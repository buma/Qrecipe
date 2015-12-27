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
        recipe->setTitle(query.value("title").toString());
        recipe->setRating(query.value("rating").toUInt());
        recipe->setInstructions(query.value("instructions").toString());
        recipe->setNotes(query.value("modifications").toString());

        recipes.append(recipe);
    }
    return recipes;
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

