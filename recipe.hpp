#ifndef RECIPE_HPP
#define RECIPE_HPP

#include <QObject>

class Recipe : public QObject
{
    Q_OBJECT


    Q_PROPERTY(QString title READ title NOTIFY titleChanged)
    Q_PROPERTY(QString instructions READ instructions NOTIFY instructionsChanged)
    Q_PROPERTY(QString notes READ notes NOTIFY notesChanged)
    Q_PROPERTY(float rating READ rating NOTIFY ratingChanged)
    Q_PROPERTY(quint16 id READ id NOTIFY idChanged)
    Q_PROPERTY(float yields READ yields NOTIFY yieldsChanged)
    Q_PROPERTY(QString yieldUnit READ yieldUnit NOTIFY yieldUnitChanged)
public:
    explicit Recipe(QObject *parent, QString title, QString instructions, QString notes, quint8 rating, quint16 id, float yields, QString yieldUnit);

    QString notes() const
    {
        return m_notes;
    }

    QString instructions() const
    {
        return m_instructions;
    }

    QString title() const
    {
        return m_title;
    }

    float rating() const
    {
        return m_rating;
    }

    quint16 id() const
    {
        return m_id;
    }

    float yields() const
    {
        return m_yields;
    }

    QString yieldUnit() const
    {
        return m_yieldUnit;
    }

signals:

    void notesChanged(QString notes);

    void instructionsChanged(QString instructions);

    void titleChanged(QString title);

    void ratingChanged(float rating);

    void idChanged(quint16 id);

    void yieldsChanged(float yields);

    void yieldUnitChanged(QString yieldUnit);

private:

    QString m_notes;
    QString m_instructions;
    QString m_title;
    float m_rating;
    quint16 m_id;
    float m_yields;
    QString m_yieldUnit;
};

#endif // RECIPE_HPP
