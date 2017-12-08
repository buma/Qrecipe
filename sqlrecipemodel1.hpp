#ifndef SQLRECIPEMODEL1_HPP
#define SQLRECIPEMODEL1_HPP

#include <QObject>
#include <QtSql>
#include <QSqlQueryModel>

class SqlRecipeModel1 : public QSqlQueryModel
{
public:
    SqlRecipeModel1(QObject* parent = 0);
    QVariant data(const QModelIndex& index, int role) const;
    QHash<int, QByteArray> roleNames() const { return roleNameHash; }
    static const QString queryAllrecipes;
private:
    QHash<int, QByteArray> roleNameHash;
};

#endif // SQLRECIPEMODEL1_HPP
