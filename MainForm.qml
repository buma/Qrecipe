import QtQuick 2.5
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.3
import si.mabu.recipe 1.0

Item {
    id:mainForm
    width: 640
    height: 480

    signal recipeClicked(string title, string instructions, string notes)

    ListView {
        id: recipesListView
        anchors.fill: parent
        anchors.margins: 10
        model:recipeModel
        delegate: RecipeSmallItem {}

        spacing: 10
    }
    onRecipeClicked: {
        console.log("mainForm")
        //mainForm.recipeClicked(title, instructions, notes)
    }

    /*SqlRecipeModel1 {
        id: recipeModel
    }*/



}

