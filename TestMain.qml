import QtQuick 2.1
import si.mabu.recipe 1.0
Item {
    width: 500
    height: 300

    ListView {
        anchors { fill: parent; margins: 20 }
        model: recipeModel
        delegate: Text {
            text: title +  " - " + instructions
        }
    }
}
