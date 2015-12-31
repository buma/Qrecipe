#ifndef RECIPE_HPP
#define RECIPE_HPP

#include <QObject>

class Recipe : public QObject
{
    Q_OBJECT


    Q_PROPERTY(QString title READ title WRITE setTitle NOTIFY titleChanged)
    Q_PROPERTY(QString instructions READ instructions WRITE setInstructions NOTIFY instructionsChanged)
    Q_PROPERTY(QString notes READ notes WRITE setNotes NOTIFY notesChanged)
    Q_PROPERTY(quint8 rating READ rating WRITE setRating NOTIFY ratingChanged)
    Q_PROPERTY(quint16 id READ id WRITE setId NOTIFY idChanged)
    Q_PROPERTY(float yields READ yields NOTIFY yieldsChanged)
    Q_PROPERTY(QString yieldUnit READ yieldUnit NOTIFY yieldUnitChanged)
public:
    explicit Recipe(QObject *parent, float yields, QString yieldUnit);

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

    quint8 rating() const
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

public slots:
    void setNotes(QString notes)
    {
        if (m_notes == notes)
            return;

        m_notes = notes;
        emit notesChanged(notes);
    }

    void setInstructions(QString instructions)
    {
        if (m_instructions == instructions)
            return;

        m_instructions = instructions;
        emit instructionsChanged(instructions);
    }

    void setTitle(QString title)
    {
        if (m_title == title)
            return;

        m_title = title;
        emit titleChanged(title);
    }

    void setRating(quint8 rating)
    {
        if (m_rating == rating)
            return;

        m_rating = rating;
        emit ratingChanged(rating);
    }

    void setId(quint16 id)
    {
        if (m_id == id)
            return;

        m_id = id;
        emit idChanged(id);
    }

signals:

    void notesChanged(QString notes);

    void instructionsChanged(QString instructions);

    void titleChanged(QString title);

    void ratingChanged(quint8 rating);

    void idChanged(quint16 id);

    void yieldsChanged(float yields);

    void yieldUnitChanged(QString yieldUnit);

private:

    QString m_notes;
    QString m_instructions;
    QString m_title;
    quint8 m_rating;
    quint16 m_id;
    float m_yields;
    QString m_yieldUnit;
};

#endif // RECIPE_HPP
