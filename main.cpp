#include <QApplication>
#include <QQmlApplicationEngine>
#include <QTranslator>
#include <QLibraryInfo>
#include <QDebug>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QTranslator qtTranslator;
    //QLocale::system() returns C locale for some reason
    QLocale systemLocale = QLocale(QLocale::Slovenian, QLocale::Slovenia);

    qtTranslator.load("qt_" + systemLocale.name(),
            QLibraryInfo::location(QLibraryInfo::TranslationsPath));
    app.installTranslator(&qtTranslator);

    QTranslator myappTranslator;
    myappTranslator.load("qrecipes_" + systemLocale.name(),
                         ":/i18n/");
    app.installTranslator(&myappTranslator);

    /*
    qDebug() << "Path: " << QLibraryInfo::location(QLibraryInfo::TranslationsPath);
    qDebug() << "system Locale: " << QLocale::system();
    qDebug() << "used locale: " << systemLocale;*/

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}

