#include <QApplication>
#include <QtQml>
#include <QQmlApplicationEngine>
#include <QTranslator>
#include <QLibraryInfo>
#include <QDebug>

#include "sqlrecipemodel.hpp"
#include "sqlrecipemodel1.hpp"

void connectDB() {
    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
    #ifdef Q_OS_QNX
        db.setDatabaseName("db/recipes_copy.db");
    #elif ON_PI3
        db.setDatabaseName("/home/pi/.config/recipes/recipes.db");
    #else
        db.setDatabaseName("/home/mabu/.gourmet/recipes_copy.db");
    #endif
    if (!db.open()) {
        qFatal("Cannot open database");
        return;
    }
}

int main(int argc, char *argv[])
{
    //qputenv("QT_DEBUG_PLUGINS", QByteArray("1"));
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

    connectDB();

    SqlRecipeModel1 sqlRecipeModel1;
    sqlRecipeModel1.setQuery(SqlRecipeModel::queryAllRecipes);

    qmlRegisterType<SqlRecipeModel>("si.mabu.recipe", 1, 0, "SqlRecipeModel1");

    /*
    qDebug() << "Path: " << QLibraryInfo::location(QLibraryInfo::TranslationsPath);
    qDebug() << "system Locale: " << QLocale::system();
    qDebug() << "used locale: " << systemLocale;*/

    QQmlApplicationEngine engine;


    QQmlContext *context = engine.rootContext();
    context->setContextProperty("recipeModel", &sqlRecipeModel1);
    //engine.load(QUrl(QStringLiteral("qrc:/TestMain.qml")));
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}

