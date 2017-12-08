#include "sqlrecipemodel1.hpp"
#include <QDebug>

SqlRecipeModel1::SqlRecipeModel1(QObject *parent) : QSqlQueryModel(parent)
{
    roleNameHash.insert(Qt::UserRole, QByteArray("id"));
    roleNameHash.insert(Qt::UserRole + 1, QByteArray("title"));
    roleNameHash.insert(Qt::UserRole + 2, QByteArray("instructions"));
    roleNameHash.insert(Qt::UserRole + 3, QByteArray("modifications"));
    roleNameHash.insert(Qt::UserRole + 4, QByteArray("rating"));;
    roleNameHash.insert(Qt::UserRole + 5, QByteArray("yields"));
    roleNameHash.insert(Qt::UserRole + 6, QByteArray("yield_unit"));

    QSqlQuery query;
    if (!query.exec(SqlRecipeModel1::queryAllrecipes))
        qFatal("Contacts SELECT query failed: %s", qPrintable(query.lastError().text()));

    //qDebug() << query.lastQuery();

    setQuery(query);
    if (lastError().isValid())
        qFatal("Cannot set query on SqlContactModel: %s", qPrintable(lastError().text()));
}

QVariant SqlRecipeModel1::data(const QModelIndex& index, int role) const
{
    if (role < Qt::UserRole)
        return QSqlQueryModel::data(index, role);

    QSqlRecord r = record(index.row());
    //qDebug() << r.value(1 - Qt::UserRole);
    QVariant value= r.value(role - Qt::UserRole);

    if (role-Qt::UserRole == 4) {
        //qDebug() << "Rating" << value.toUInt();
        return value.toFloat()/10*5;
    } else if (role-Qt::UserRole == 5) {
            return value.toFloat();
    } else {
        return value;
    }
}
//TODO: add conditional loading of everything else except title, id and rating
const QString SqlRecipeModel1::queryAllrecipes = "SELECT id, title, instructions,modifications, rating, yields, yield_unit FROM recipe WHERE deleted == 0";
