#ifndef SQLINGREDIENTMODEL_HPP
#define SQLINGREDIENTMODEL_HPP

#include <QSqlQueryModel>


class SqlIngredientModel : public QSqlQueryModel
{
    Q_OBJECT
    Q_PROPERTY(quint16 recipeId READ recipeId WRITE setRecipeId NOTIFY recipeIdChanged)
public:
    SqlIngredientModel(QObject* parent = 0);
    QVariant data(const QModelIndex& index, int role) const;
    QHash<int, QByteArray> roleNames() const { return roleNameHash; }
    quint16 recipeId() const { return m_recipeId; }
    void setRecipeId(const quint16 id);
    static const QString queryIngredientsForRecipe;
signals:
    void recipeIdChanged();
private:
    QHash<int, QByteArray> roleNameHash;
    quint16 m_recipeId;
};

#endif // SQLINGREDIENTMODEL_HPP
