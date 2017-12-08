TEMPLATE = app

QT += qml quick widgets sql

!contains(sql-drivers, sqlite): QTPLUGIN += qsqlite

SOURCES += main.cpp \
    recipe.cpp \
    sqlrecipemodel1.cpp \
    sqlingredientmodel.cpp

RESOURCES += qml.qrc

TRANSLATIONS = i18n/qrecipes_sl.ts
#To update lupdate Qrecipe.pro
#To use translations lrelease i18n/*.ts
#Translations *qm files need to be in the same folder as executable
lupdate_only {
    SOURCES = *.qml
}

linux-rasp-pi2-g++ {
    message("Building for PI3")
    DEFINES += "ON_PI3"
}

linux-rasp-pi3-g++ {
    message("Building for PI3")
    DEFINES += "ON_PI3"
}

target.path = /home/pi/apps
INSTALLS +=target

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    recipe.hpp \
    sqlrecipemodel1.hpp \
    sqlingredientmodel.hpp

DISTFILES += \
    main.qml \
    MainForm.qml \
    RecipeFullItem.qml \
    RecipesList.qml \
    RecipeSmallItem.qml \
    bar-descriptor.xml

qnx {
    QMAKE_LFLAGS += '-Wl,-rpath,\'./app/native/lib\''

PACKAGE_ARGS = \
        $${PWD}/bar-descriptor.xml $$TARGET \
        -e $$[QT_INSTALL_LIBS]/libQt5Core.so.5 lib/libQt5Core.so.5 \
        -e $$[QT_INSTALL_LIBS]/libQt5Gui.so.5 lib/libQt5Gui.so.5 \
        -e $$[QT_INSTALL_LIBS]/libQt5OpenGL.so.5 lib/libQt5OpenGL.so.5 \
        -e $$[QT_INSTALL_LIBS]/libQt5Network.so.5 lib/libQt5Network.so.5 \
        -e $$[QT_INSTALL_LIBS]/libQt5Widgets.so.5 lib/libQt5Widgets.so.5 \
        -e $$[QT_INSTALL_LIBS]/libQt5Quick.so.5 lib/libQt5Quick.so.5 \
        -e $$[QT_INSTALL_LIBS]/libQt5Qml.so.5 lib/libQt5Qml.so.5 \
        -e $$[QT_INSTALL_LIBS]/libQt5Sql.so.5 lib/libQt5Sql.so.5 \
        #-e $$[QT_INSTALL_LIBS]/libQt5V8.so.5 lib/libQt5V8.so.5 \
        #-e $$[QT_INSTALL_LIBS]/libQt5XmlPatterns.so.5 lib/libQt5XmlPatterns.so.5 \
        -e $$[QT_INSTALL_PLUGINS]/platforms/libqqnx.so plugins/platforms/libqqnx.so \
        #-e $$[QT_INSTALL_PLUGINS]/platforms/libblackberry.so plugins/platforms/libblackberry.so \
        -e $$[QT_INSTALL_QML]/ qml/ \
        #-e $$[QT_INSTALL_IMPORTS]/ imports/ \   # only if you built/use the qtquick1 modules
        -e $${PWD}/qml.qrc native/qml.qrc \
        -e /home/mabu/.gourmet/recipes_copy.db db/recipes_copy.db

    package.target = $${TARGET}.bar
    package.depends = $$TARGET
    package.commands = blackberry-nativepackager \
        -package $${TARGET}.bar \
        -devMode -debugToken /home/mabu/.rim/debugtoken1.bar \
        $${PACKAGE_ARGS}

    QMAKE_EXTRA_TARGETS += package

    OTHER_FILES += bar-descriptor.xml
}
