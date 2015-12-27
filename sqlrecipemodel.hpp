#ifndef SQLRECIPEMODEL_HPP
#define SQLRECIPEMODEL_HPP

#include <QList>
#include <QObject>
#include <QSqlTableModel>

#include "recipe.hpp"


class SqlRecipeModel : public QSqlQueryModel
{
    Q_OBJECT
public:
    SqlRecipeModel();

    Q_INVOKABLE QList<QObject*> allRecipes();

private:
    static void createConection();
};

#endif // SQLRECIPEMODEL_HPP
