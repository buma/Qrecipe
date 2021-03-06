import QtQuick 2.5
import QtQuick.Controls 2.1


Item {
    id:smallRecipe
    width:recipesListView.width
    height:40
    //anchors.horizontalCenter: parent.horizontalCenter

    signal recipeClicked(string title, string instructions, string notes)


    Loader {
        id:loader
        width:300
        height:300
        anchors.rightMargin: 0
        anchors.fill: parent
        visible: source != ""
    }

    Row {
        id: row1
        width: recipesListView.width
        height: 40
        visible: !loader.visible
        Image {
            id:icon
            width: 40
            height: 40
            fillMode: Image.PreserveAspectFit
            source: thumb
        }


        Text {
            text: title
            anchors.verticalCenter: parent.verticalCenter
            font.bold: true
        }

        spacing: 10
        RatingIndicator {
            anchors.verticalCenter: parent.verticalCenter
            indicator_rating: rating
        }

    }

    /*Component.onCompleted:  {
        console.log("data:", model)
    }*/

    MouseArea {
        id: mouseArea1
        anchors.fill: parent
        onClicked: parent.state = "expanded"
        /*onClicked: {
            console.log(modelData.title);
            smallRecipe.recipeClicked(modelData.title, modelData.instructions, modelData.notes)
        }*/
    }
    Button {
                   id: closeButton

                   anchors.right: parent.right
                   anchors.top: parent.top
                   anchors.rightMargin: 2
                   anchors.topMargin: 2


                   text: qsTr("Close")

                   //color: "#157efb"
                   //border.color: Qt.lighter(color, 1.1)

                   opacity: 0
                   onClicked: smallRecipe.state = ""


               }
    states: [
        State {
            name: "expanded"

            PropertyChanges {
                target: closeButton
                opacity: 1
            }
            PropertyChanges {
                target: smallRecipe
                height:recipesListView.height

            }
            PropertyChanges {
                target: mouseArea1
                enabled:false
            }
            PropertyChanges {
                target: recipesListView
                //smallRecipe.ListView.view
                contentY:smallRecipe.y
                interactive:false

            }
            PropertyChanges {
                target: loader
                source:"RecipeFullItem.qml"
                x:0
                y:0
                anchors.rightMargin: 0
                anchors.bottomMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 0


            }
        }
    ]
    transitions: [
                    Transition {
                        NumberAnimation {
                            duration: 200;
                            properties: "height,width,anchors.rightMargin,anchors.topMargin,opacity,contentY"
                        }
                    }
                ]

}

