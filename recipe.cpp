#include <QtGlobal>
#include "recipe.hpp"

Recipe::Recipe(QObject *parent, float yields, QString yieldUnit) : QObject(parent)
{
    //Some yields are empty in DB and are read as 1.
    m_yields = qMax(yields, 1.0F);
    m_yieldUnit = yieldUnit;
    emit yieldsChanged(yields);
    emit yieldUnitChanged(yieldUnit);
}

