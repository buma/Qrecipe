#ifndef DBIMAGEPROVIDER_HPP
#define DBIMAGEPROVIDER_HPP

#include <QObject>
#include <QQuickImageProvider>

class DBImageProvider : public QQuickImageProvider
{
public:
    DBImageProvider();
    QImage requestImage(const QString &id, QSize *size, const QSize &requestedSize) override;
private:
    static const QString queryThumb;
    static const QString queryImage;
};

#endif // DBIMAGEPROVIDER_HPP
