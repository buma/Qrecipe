#include <QtGlobal>
#include "recipe.hpp"

Recipe::Recipe(QObject *parent, QString title, QString instructions, QString notes,
               quint8 rating, quint16 id, float yields, QString yieldUnit) : QObject(parent)
{
    m_title = title;
    m_instructions = instructions;
    m_notes = notes;
    //This converts ratings from 0-10 to 0-5 but with half ratings
    //because we have 5 stars and want to show half stars
    m_rating = rating/10.0*5;
    m_id = id;
    //Some yields are empty in DB and are read as 1.
    m_yields = qMax(yields, 1.0F);
    m_yieldUnit = yieldUnit;

    emit titleChanged(title);
    emit instructionsChanged(instructions);
    emit notesChanged(notes);
    emit ratingChanged(m_rating);
    emit idChanged(id);
    emit yieldsChanged(yields);
    emit yieldUnitChanged(yieldUnit);
}
