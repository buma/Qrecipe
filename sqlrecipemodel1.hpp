#ifndef SQLRECIPEMODEL1_HPP
#define SQLRECIPEMODEL1_HPP

#include <QObject>
#include <QtSql>
#include <QSqlQueryModel>

class SqlRecipeModel1 : public QSqlQueryModel
{
    Q_OBJECT
public:
    explicit SqlRecipeModel1(QObject* parent = 0);
    QVariant data(const QModelIndex& index, int role) const;
    QHash<int, QByteArray> roleNames() const { return roleNameHash; }
    static const QString queryAllrecipes;
    Q_INVOKABLE void search(QString search);
public slots:
    void clear() {
        QSqlQuery query;
        if (!query.exec(SqlRecipeModel1::queryAllrecipes))
            qFatal("Contacts SELECT query failed: %s", qPrintable(query.lastError().text()));

        //qDebug() << query.lastQuery();

        setQuery(query);
        if (lastError().isValid())
            qFatal("Cannot set query on SqlContactModel: %s", qPrintable(lastError().text()));
    }


private:
    QHash<int, QByteArray> roleNameHash;
};

#endif // SQLRECIPEMODEL1_HPP
