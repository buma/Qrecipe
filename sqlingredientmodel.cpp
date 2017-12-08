#include "sqlingredientmodel.hpp"

#include <QSqlRecord>
#include <QSqlQuery>
#include <QDebug>
#include <QSqlError>

SqlIngredientModel::SqlIngredientModel(QObject *parent) :QSqlQueryModel (parent)
{
    roleNameHash.insert(Qt::UserRole, QByteArray("id"));
    roleNameHash.insert(Qt::UserRole + 1, QByteArray("unit"));
    roleNameHash.insert(Qt::UserRole + 2, QByteArray("amount"));
    roleNameHash.insert(Qt::UserRole + 3, QByteArray("ingredient"));
    roleNameHash.insert(Qt::UserRole + 4, QByteArray("group"));;
}

QVariant SqlIngredientModel::data(const QModelIndex &index, int role) const
 {
     if (role < Qt::UserRole)
         return QSqlQueryModel::data(index, role);

     const QSqlRecord sqlRecord = record(index.row());
     return sqlRecord.value(role - Qt::UserRole);
 }

void SqlIngredientModel::setRecipeId(quint16 id) {
    if (id == m_recipeId) {
        return;
    }
    m_recipeId = id;
    QSqlQuery query;
    query.prepare(SqlIngredientModel::queryIngredientsForRecipe);
    query.bindValue(":id", m_recipeId);
    //qDebug() << "Query:" << query.lastQuery();

    if (!query.exec()) {
        qDebug() << "Error:" << query.lastError().text();
        qFatal("Query failed");
    }
    setQuery(query);
    emit recipeIdChanged();

}

const QString SqlIngredientModel::queryIngredientsForRecipe = QStringLiteral(
            "SELECT id, unit, amount, item, inggroup"
            " FROM ingredients WHERE recipe_id == :id"
            " AND deleted == 0"
            " ORDER BY position");
