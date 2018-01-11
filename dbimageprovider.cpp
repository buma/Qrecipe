#include "dbimageprovider.hpp"
#include <QtDebug>
#include <QPainter>
#include <QSqlQuery>
#include <QSqlError>

DBImageProvider::DBImageProvider() : QQuickImageProvider (QQuickImageProvider::Image)
{

}

QImage DBImageProvider::requestImage(const QString &id, QSize *size, const QSize &requestedSize)
{

    //qDebug() << "ID:" << id << requestedSize;

    auto parts = id.split("/");

    //qDebug() << "IDX:" << parts[0] << "TYPE:" << parts[1];


    QSqlQuery query;
    if (parts[1] == "thumb") {
        query.prepare(DBImageProvider::queryThumb);
    } else {
        query.prepare(DBImageProvider::queryImage);
    }
    query.bindValue(":id", parts[0]);
    if (!query.exec()) {
        qDebug() << "Error:" << query.lastError().text();
        qFatal("Query failed");
    }
    query.first();
    auto value = query.value(1);
    auto image = QImage::fromData(value.toByteArray());
    //qDebug() << "I" << parts[0] << image.width() << image.height() << image.isNull();



    if (size)

        *size = QSize(image.width(), image.height());

    return image;

    //TODO: do something with missing images
    /*QPixmap pixmap(requestedSize.width() > 0 ? requestedSize.width() : width,

                   requestedSize.height() > 0 ? requestedSize.height() : height);

    pixmap.fill(Qt::red);

    QPainter p(&pixmap);

    p.drawText(0, 10, id);

    p.end();

    return pixmap.toImage();*/
}

const QString DBImageProvider::queryThumb = "SELECT id, thumb FROM recipe WHERE id == :id";
const QString DBImageProvider::queryImage = "SELECT id, image FROM recipe WHERE id == :id";
