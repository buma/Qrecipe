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
public:
    explicit Recipe(QObject *parent = 0);

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

signals:

    void notesChanged(QString notes);

    void instructionsChanged(QString instructions);

    void titleChanged(QString title);

    void ratingChanged(quint8 rating);

private:

    QString m_notes;
    QString m_instructions;
    QString m_title;
    quint8 m_rating;
};

#endif // RECIPE_HPP