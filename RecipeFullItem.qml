import QtQuick 2.5
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import si.mabu.recipe 1.0

Item {
    id: recipeFullItem
    width: 1024
    height: 600

    property int recipeId


    Component.onCompleted:  {

        //console.log("data:", recipeFullItem.ListView.view.model)
        //console.log(recipeModel.getIngredients(modelData.id))
        //console.log("COmpleted" + model.id + "title" + model.title)
    }

    RowLayout {
        id: splitView1
        anchors.fill: parent

        ColumnLayout {
            id: ingredients_column
            spacing: 10
            Layout.minimumWidth: 400
            Layout.minimumHeight: 20


            Text {
                id: text1
                text: qsTr("Ingredients")
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.bold: true
                Layout.fillWidth: true
                font.pixelSize: 16
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
                    value: yields
                }
                Label {
                    text:yield_unit
                    visible:yield_unit
                }

            }

            ListView {
                id:ingrediendsListView
                property real servings: sb_amount.value
                property real recipeServings: yields
                spacing: 5
                model:SqlIngredientModel {
                    recipeId: model.id
                }

                Layout.fillHeight: true
                Layout.fillWidth: true
                delegate: IngredientItem {}
                section {
                    property: "group"
                    criteria: ViewSection.FullString
                    delegate: Rectangle {
                                //color: "#b0dfb0"
                                width: parent.width
                                height: childrenRect.height + 4
                                Text { anchors.horizontalCenter: parent.horizontalCenter
                                    font.pixelSize: 18
                                    font.bold: true
                                    text: section
                                }
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
                    text: model.title
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter

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
                text:model.instructions
                wrapMode: Text.WordWrap

                font.pixelSize: 12
            }
            Text {
                id: notesTitle
                text: qsTr("Notes")
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                font.family: "Verdana"
                style: Text.Raised
                font.bold: true

                font.pixelSize: 14
                Layout.minimumHeight: 20
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignHCenter
                visible: model.modifications
            }
            ScrollView {
                id:notesSv
                rightPadding: 5
                contentWidth: parent.width
                Layout.preferredHeight: 100
                visible: model.modifications
                Layout.fillHeight: false
                Layout.fillWidth: true
                Layout.maximumHeight: 400
                clip:true
                Text {

                id: notes
                text:model.modifications
                width:row1.width

                wrapMode: Text.WordWrap

                font.pixelSize: 12
                visible: model.modifications
            }
            }
        }
    }



}
