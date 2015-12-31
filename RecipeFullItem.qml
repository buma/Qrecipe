import QtQuick 2.0
import QtQuick.Extras 1.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.2
import si.mabu.recipe 1.0

Item {
    id: recipeFullItem
    width: 1024
    height: 600


    Component.onCompleted:  {
        //console.log("data:", recipeFullItem.ListView.view.model)
        //console.log(recipeModel.getIngredients(modelData.id))
    }

    SplitView {
        id: splitView1
        anchors.fill: parent

        ColumnLayout {
            id: ingredients_column
            spacing: 10
            Layout.minimumWidth: 200
            Layout.minimumHeight: 20


            Text {
                id: text1
                text: qsTr("Ingredients")
                font.bold: true
                Layout.alignment: Qt.AlignVCenter
                Layout.fillWidth: true
                font.pixelSize: 12
            }

            RowLayout {
                id: amount
                Layout.minimumHeight: 30
                Layout.fillWidth: true
                spacing: 10

                Label {
                    id: label1
                    text: qsTr("Yields:")
                }

                SpinBox {
                    id: sb_amount
                    suffix: "servings"
                }

            }

            ListView {
                id:ingrediendsListView
                //model:recipeFullItem.ListView.view.model.getIngredients(1)
                model:recipeModel.getIngredients(modelData.id)
                Layout.fillHeight: true
                Layout.fillWidth: true

                delegate:
                    Component {
                    Loader {
                        source: "IngredientItem.qml"
                    }
                }



        }

        }

        ColumnLayout {
            id: rest
            Layout.fillWidth: true
            Layout.fillHeight: true


            RowLayout {
                id: row1
                Layout.maximumHeight: 100
                Layout.fillWidth: true

                Image {
                    id: image1
                    width: height
                    clip: false
                    Layout.maximumWidth: 100
                    Layout.maximumHeight: 100

                }

                Text {
                    id: titleText
                    text: modelData.title

                    font.family: "Verdana"
                    style: Text.Raised
                    font.bold: true

                    font.pixelSize: 20
                    Layout.minimumHeight: 20
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignHCenter
                }
            }

            Text {
                Layout.fillHeight: true
                Layout.fillWidth: true
                id: instructions
                text:modelData.instructions
                wrapMode: Text.WordWrap

                font.pixelSize: 12
            }
        }
    }



}
