#include "ingredient.hpp"

Ingredient::Ingredient(QObject *parent) : QObject(parent)
{

}

QDebug operator <<(QDebug debug, const Ingredient &i)
{
    QDebugStateSaver saver(debug);
    debug << "Amount:" << i.amount() << "Unit" << i.unit() << " ingredient" << i.ingredient() << " group" << i.group();
    return debug;
}

