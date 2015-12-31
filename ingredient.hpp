#ifndef INGREDIENT_HPP
#define INGREDIENT_HPP

#include <QObject>
#include <QDebug>

class Ingredient : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString unit READ unit NOTIFY unitChanged)
    Q_PROPERTY(float amount READ amount NOTIFY amountChanged)
    Q_PROPERTY(QString ingredient READ ingredient NOTIFY ingredientChanged)
    Q_PROPERTY(bool checked READ checked WRITE setChecked NOTIFY checkedChanged)
    Q_PROPERTY(QString group READ group NOTIFY groupChanged)


public:
    explicit Ingredient(QObject *parent = 0);
    Ingredient(QObject *parent, QString unit, float amount, QString ingredient, QString group) {
        m_unit = unit;
        m_ingredient = ingredient;
        m_amount = amount;
        m_checked = false;
        m_group = group;
        emit amountChanged(amount);
        emit unitChanged(unit);
        emit ingredientChanged(ingredient);
        emit checkedChanged(false);
        emit groupChanged(group);

        /*if(!group.isEmpty()) {
            qDebug() << group;
        }*/
    }

    QString unit() const
    {
        return m_unit;
    }

    float amount() const
    {
        return m_amount;
    }

    QString ingredient() const
    {
        return m_ingredient;
    }

    bool checked() const
    {
        return m_checked;
    }

    QString group() const
    {
        return m_group;
    }


public slots:
    void setChecked(bool checked)
    {
        if (m_checked == checked)
            return;

        m_checked = checked;
        emit checkedChanged(checked);
    }

signals:

    void amountChanged(float amount);


    void checkedChanged(bool checked);

    void ingredientChanged(QString ingredient);

    void unitChanged(QString unit);

    void groupChanged(QString group);

private:
    QString m_unit;

    float m_amount;

    QString m_ingredient;
    bool m_checked;
    QString m_group;
};

QDebug operator<<(QDebug debug, const Ingredient &i);

#endif // INGREDIENT_HPP
