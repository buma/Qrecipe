import QtQuick 2.0
import QtQuick.Extras 1.4
import QtQuick.Controls 1.3

Item {
    id: recipeFullItem
    //width: 1024
    //height: 600
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

    Column {
        id: ingredients_column
        width: 200
        spacing: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 5
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 5

        Text {
            id: text1
            text: qsTr("Ingredients")
            font.bold: true
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 12
        }

        Row {
            id: amount
            width: 200
            height: 30
            spacing: 19
            anchors.top: text1.bottom
            anchors.topMargin: 10

            Label {
                id: label1
                y: 8
                text: qsTr("Yields:")
                anchors.left: parent.left
                anchors.leftMargin: 10
            }

            SpinBox {
                id: sb_amount
                anchors.left: label1.right
                anchors.leftMargin: 20
                suffix: "servings"
            }

        }

        Row {
            id: ingredients_row
            width: 200
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.top: amount.bottom
            anchors.topMargin: 10

            Text {
                id: ingredients
                text: recipeFullItem.ingredients
                anchors.fill: parent
                font.pixelSize: 12
            }
        }
    }


    Column {
        id: rest
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 5
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.left: ingredients_column.right
        anchors.leftMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 5

        Row {
            id: row1
            height: 100
            anchors.right: parent.right
            anchors.left: parent.left

            Image {
                id: image1
                width: 100
                height: 100
                source: "qrc:/qtquickplugin/images/template_image.png"
            }

            Text {
                id: title
                text: recipeFullItem.title
                anchors.horizontalCenterOffset: -56
                font.family: "Verdana"
                style: Text.Raised
                font.bold: true
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 24
                font.pixelSize: 20
            }
        }

        Text {
            id: instructions
            text: recipeFullItem.instructions
            anchors.top: row1.bottom
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.topMargin: -100
            font.pixelSize: 12
        }
    }



}

