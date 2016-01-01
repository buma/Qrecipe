#include "sqlrecipemodel.hpp"
#include <QDebug>
#include <QFileInfo>
#include <QSqlError>
#include <QSqlQuery>

SqlRecipeModel::SqlRecipeModel()
{
    createConection();
}

QList<QObject *> SqlRecipeModel::allRecipes()
{

    QSqlQuery query(queryAllRecipes);
    if (!query.exec()) {
        qFatal("Query failed");
    }
    QList<QObject*> recipes;
    while(query.next()) {
        Recipe *recipe = new Recipe(this, query.value("title").toString(), query.value("instructions").toString(),
                                    query.value("modifications").toString(), query.value("rating").toUInt(),
                                    query.value("id").toInt(),
                                    query.value("yields").toFloat(), query.value("yield_unit").toString());
        recipes.append(recipe);
    }
    return recipes;
}

QList<QObject *> SqlRecipeModel::getIngredients(int recipeId)
{
    QSqlQuery query(queryIngredientsForRecipe.arg(recipeId));
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

void SqlRecipeModel::createConection()
{
    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName("/home/mabu/.gourmet/recipes_copy.db");
    if (!db.open()) {
        qFatal("Cannot open database");
        return;
    }

}

const QString SqlRecipeModel::queryAllRecipes = QStringLiteral("SELECT * FROM recipe WHERE deleted == 0");
const QString SqlRecipeModel::queryIngredientsForRecipe = QStringLiteral(
            "SELECT * FROM ingredients WHERE recipe_id == '%1'"
            " AND deleted == 0"
            " ORDER BY position");

