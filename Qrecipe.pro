TEMPLATE = app

QT += qml quick widgets sql

!contains(sql-drivers, sqlite): QTPLUGIN += qsqlite

SOURCES += main.cpp \
    recipe.cpp \
    sqlrecipemodel.cpp \
    ingredient.cpp

RESOURCES += qml.qrc

TRANSLATIONS = i18n/qrecipes_sl.ts
#To update lupdate Qrecipe.pro
#To use translations lrelease i18n/*.ts
#Translations *qm files need to be in the same folder as executable
lupdate_only {
    SOURCES = *.qml
}

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    recipe.hpp \
    sqlrecipemodel.hpp \
    ingredient.hpp

DISTFILES += \
    main.qml \
    MainForm.qml \
    RecipeFullItem.qml \
    RecipesList.qml \
    RecipeSmallItem.qml
