import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.2
import si.mabu.recipe 1.0

Item {
    width: 640
    height: 480

    ListView {
        id: recipesListView
        anchors.fill: parent
        anchors.margins: 10
        model:recipeModel.allRecipes()
        delegate: RecipeSmallItem {}
        spacing: 10
    }

    SqlRecipeModel {
        id: recipeModel
    }



}

