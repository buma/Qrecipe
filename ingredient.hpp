#ifndef INGREDIENT_HPP
#define INGREDIENT_HPP

#include <QObject>

class Ingredient : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString unit READ unit)
    Q_PROPERTY(float amount READ amount NOTIFY amountChanged)
    Q_PROPERTY(QString ingredient READ ingredient) // WRITE setIngredient NOTIFY ingredientChanged)


public:
    explicit Ingredient(QObject *parent = 0);
    Ingredient(QObject *parent, QString unit, float amount, QString ingredient) {
        m_unit = unit;
        m_ingredient = ingredient;
        m_amount = amount;
        emit amountChanged(amount);
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

signals:

    void amountChanged(float amount);


private:
    QString m_unit;

    float m_amount;

    QString m_ingredient;
};

#endif // INGREDIENT_HPP
