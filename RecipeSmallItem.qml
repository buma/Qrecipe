import QtQuick 2.5



Item {
    width:recipesListView.width
    height:40
    anchors.horizontalCenter: parent.horizontalCenter

    Row {
        id: row1
        width: recipesListView.width
        height: 40
        Rectangle {
            width: 40
            height: 40
            color: "#791313"
        }


        Text {
            text: modelData.title
            anchors.verticalCenter: parent.verticalCenter
            font.bold: true
        }

        spacing: 10
        Text {
            id: text1
            text: modelData.rating
            font.bold: true
            anchors.verticalCenter: parent.verticalCenter
        }
    }
}

