import QtQuick 2.5



Item {
    id:smallRecipe
    width:recipesListView.width
    height:40
    anchors.horizontalCenter: parent.horizontalCenter

    signal recipeClicked(string title, string instructions, string notes)

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
        RatingIndicator {
            anchors.verticalCenter: parent.verticalCenter
            indicator_rating: modelData.rating
        }

    }

    MouseArea {
        id: mouseArea1
        anchors.fill: parent
        onClicked: {
            console.log(modelData.title);
            smallRecipe.recipeClicked(modelData.title, modelData.instructions, modelData.notes)
        }
    }
}

