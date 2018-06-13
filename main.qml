import QtQuick 2.5
import QtQuick.Controls 2.1
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1
import QtQuick.VirtualKeyboard 2.2

ApplicationWindow {
    visible: true
    width: 1024
    height: 600
    title: qsTr("Hello World")
    id:rootW

    //TODO: add menubar



    header:ToolBar {
        RowLayout {
            anchors.fill: parent
            ToolButton {
                id:exitButton1
                text: qsTr("Exit")
                onClicked: Qt.quit();
            }

            TextField {
                placeholderText: "Iskanje"
                id:search
                onAccepted: {

                    console.log("Search for:"+search.text)
                    recipeModel.search(search.text);
                }
                anchors.left: exitButton1.right
            }

            ToolButton {
                id:clearButton
                anchors.left: search.right
                text: qsTr("Clear")
                visible: search.text.length > 0
                onClicked: {
                    recipeModel.clear()
                    search.text = ""
                }
            }

            //TODO: this button should close recipe view
            ToolButton {
                id:exitButton
                anchors.right: parent.right
                text: qsTr("Back")
                visible: false
                onClicked: smallRecipe.state = ""
            }

        }
    }

    /*header: MenuBar {
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
    }*/

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

            /*onRecipeClicked: {
                recipeFull.setRecipeData(title, "", instructions)
                //recipeFull.ingredients = ingredients
                console.log("main")
                stackView.push(recipeFull)
            }*/
        }
    }

    InputPanel {
        id:inputPanel
        z:89
        anchors.left: parent.left
        anchors.right: parent.right
        y:stackView.height
        states:
            State {
            name: "visible"
            when: inputPanel.active
            PropertyChanges {
                target: inputPanel
                y:stackView.height-inputPanel.height

            }
        }
        transitions: Transition {
            id: inputPanelTransition
            from: ""
            to: "visible"
            reversible: true
            enabled: !VirtualKeyboardSettings.fullScreenMode
            ParallelAnimation {
                NumberAnimation {
                    properties: "y"
                    duration: 250
                    easing.type: Easing.InOutQuad
                }
            }
        }
        Binding {
            target: InputContext
            property: "animating"
            value: inputPanelTransition.running
        }
        // AutoScroller {}

    }


    MessageDialog {
        id: messageDialog
        title: qsTr("May I have your attention, please?")

        function show(caption) {
            messageDialog.text = caption;
            messageDialog.open();
        }
    }
}

