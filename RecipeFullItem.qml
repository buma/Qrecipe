import QtQuick 2.0
import QtQuick.Extras 1.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.2

Item {
    id: recipeFullItem
    width: 1024
    height: 600
    //property alias title:title
    //property alias ingredients: ingredients
    property string title
    property string ingredients
    property string instructions

    function setRecipeData(title, ingredients, instructions) {
        recipeFullItem.title = title;
        recipeFullItem.ingredients = ingredients
        recipeFullItem.instructions = instructions;
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


                Text {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    id: ingredients
                    text: recipeFullItem.ingredients
                    font.pixelSize: 12
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
                    id: title
                    text: recipeFullItem.title

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
                text:recipeFullItem.instructions
                wrapMode: Text.WordWrap

                font.pixelSize: 12
            }
        }
    }



}

