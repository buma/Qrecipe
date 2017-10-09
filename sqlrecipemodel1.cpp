#include "sqlrecipemodel1.hpp"
#include "ingredient.hpp"
#include "sqlrecipemodel.hpp"
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
}

QVariant SqlRecipeModel1::data(const QModelIndex& index, int role) const
{
    if (role < Qt::UserRole)
        return QSqlQueryModel::data(index, role);

    QSqlRecord r = record(index.row());
    //qDebug() << r.value(1 - Qt::UserRole);
    QVariant value= r.value(role - Qt::UserRole);

    if (role-Qt::UserRole == 4) {
        return value.toUInt();
    } else if (role-Qt::UserRole == 5) {
            return value.toFloat();
    } else {
        return value;
    }
}

QList<QObject *> SqlRecipeModel1::getIngredients(int recipeId)
{
    qDebug() << "Getting ingredients for recipe:" << recipeId << "\n";
    QSqlQuery query(SqlRecipeModel::queryIngredientsForRecipe.arg(recipeId));
    if (!query.exec()) {
        qFatal("Query for ingredients failed");
    }

    QList<QObject*> ingredients;
    while(query.next()) {
        Ingredient *ingredient = new Ingredient(this, query.value("unit").toString(),
                                                query.value("amount").toFloat(), query.value("item").toString(),
                                                query.value("inggroup").toString());
        ingredients.append(ingredient);
    }
    return ingredients;
}
