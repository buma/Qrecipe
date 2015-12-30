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
    SqlRecipeModel();

    Q_INVOKABLE QList<QObject*> allRecipes();
    Q_INVOKABLE QList<Ingredient*> getIngredients(int recipeId);

private:
    static void createConection();
};

#endif // SQLRECIPEMODEL_HPP
