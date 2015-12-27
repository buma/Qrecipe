TEMPLATE = app

QT += qml quick widgets

SOURCES += main.cpp

RESOURCES += qml.qrc

TRANSLATIONS = i18n/qrecipes_sl.ts
#To update lupdate Qrecipe.pro
#To use translations lrelease i18n/*.ts
#Translations *qm files need to be in the same folder as executable
lupdate_only {
    SOURCES = main.qml \
              MainForm.ui.qml
}

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

