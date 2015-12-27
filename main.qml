import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Dialogs 1.2

ApplicationWindow {
    visible: true
    width: 1024
    height: 600
    title: qsTr("Hello World")

    menuBar: MenuBar {
        Menu {
            title: qsTr("File")
            MenuItem {
                text: qsTr("&Open")
                onTriggered: console.log("Open action triggered");
            }
            MenuItem {
                text: qsTr("Exit")
                onTriggered: Qt.quit();
            }
            MenuItem {
                text: qsTr("Back")
                onTriggered: if (stackView.depth > 1) {
                                 stackView.pop()
                             }
            }
        }
    }

    RecipeFullItem {
        id:recipeFull
        visible: false

    }

    StackView {
        id: stackView
        anchors.fill: parent
        // Implements back key navigation
        focus: true
        Keys.onReleased: if (event.key === Qt.Key_Back && stackView.depth > 1) {
                             stackView.pop();
                             event.accepted = true;
                         }
        initialItem: MainForm {
            anchors.fill: parent

            onRecipeClicked: {
                recipeFull.setRecipeData(title, "", instructions)
                //recipeFull.ingredients = ingredients
                stackView.push(recipeFull)
            }
        }
    }



    /*MainForm {
        anchors.fill: parent

    }*/

    MessageDialog {
        id: messageDialog
        title: qsTr("May I have your attention, please?")

        function show(caption) {
            messageDialog.text = caption;
            messageDialog.open();
        }
    }
}

