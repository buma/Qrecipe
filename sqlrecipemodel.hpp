#ifndef SQLRECIPEMODEL_HPP
#define SQLRECIPEMODEL_HPP

#include <QList>
#include <QObject>
#include <QSqlTableModel>

#include "recipe.hpp"
#include "ingredient.hpp"


class SqlRecipeModel : public QSqlQueryModel
{
    Q_OBJECT
public:
    SqlRecipeModel(QObject *parent = 0);

    Q_INVOKABLE QList<QObject*> allRecipes();
    Q_INVOKABLE QList<QObject*> getIngredients(int recipeId);
    static void createConection();

private:
    static const QString queryAllRecipes;
    static const QString queryIngredientsForRecipe;
};

#endif // SQLRECIPEMODEL_HPP
