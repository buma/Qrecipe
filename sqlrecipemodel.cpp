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
    const QString queryAllRecipes = QString::fromLatin1("SELECT * FROM recipe");
    QSqlQuery query(queryAllRecipes);
    if (!query.exec()) {
        qFatal("Query failed");
    }
    QList<QObject*> recipes;
    while(query.next()) {
        Recipe *recipe = new Recipe(this);
        recipe->setId(query.value("id").toInt());
        recipe->setTitle(query.value("title").toString());
        recipe->setRating(query.value("rating").toUInt());
        recipe->setInstructions(query.value("instructions").toString());
        recipe->setNotes(query.value("modifications").toString());

        recipes.append(recipe);
    }
    return recipes;
}

QList<Ingredient *> SqlRecipeModel::getIngredients(int recipeId)
{
    const QString queryIngredientsForRecipe = QString::fromLatin1(
                "SELECT * FROM ingredients WHERE recipe_id == '%1'"
                " AND deleted == 0"
                " ORDER BY position");
    QSqlQuery query(queryIngredientsForRecipe.arg(recipeId));
    if (!query.exec()) {
        qFatal("Query for ingredients failed");
    }

    QList<Ingredient*> ingredients;
    while(query.next()) {
        Ingredient *ingredient = new Ingredient(this, query.value("unit").toString(),
                                                query.value("amount").toFloat(), query.value("item").toString());
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

