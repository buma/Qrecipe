import QtQuick 2.5
import QtQuick.Layouts 1.2

Item {
    id:ingredientItem
    width:parent.width
    height:20

    property bool checked: false


    Component.onCompleted:  {
        //console.log("data:", modelData)
        if (group != "") {
            console.log(group, ingredient)
        }
        //console.log("servings", ingrediendsListView.servings)
        //console.log(ingrediendsListView.servings/ingrediendsListView.recipeServings)
    }

    RowLayout {
        id: rowLayout1

        Text{
            id: amountText
            text: ingrediendsListView.servings===0? amount:amount * (ingrediendsListView.servings/ingrediendsListView.recipeServings)
            visible: amount > 0
        }
        
        Text {
            id:unitText
            text:unit
            visible:text.length > 0
        }
        
        Text {
            id: ingredientText
            text: ingredient
            wrapMode: Text.WordWrap
            font.pixelSize: 12
            Layout.fillWidth: true
        }
        MouseArea {
            id:mouseArea
            anchors.fill: parent
            onClicked: {
                //console.log(modelData)
                checked = !checked


            }
        }
        
        states: [
            State {
                name: "checked"
                when: checked === true
                
                PropertyChanges {
                    target: amountText
                    color: "gray"
                    font.strikeout: true
                }
                
                PropertyChanges {
                    target: unitText
                    color: "gray"
                    font.strikeout: true
                }
                
                PropertyChanges {
                    target: ingredientText
                    color: "gray"
                    font.strikeout: true
                }
            }
        ]
        transitions: Transition {
            from: ""
            to: "checked"
            reversible: true
            
            ColorAnimation {
                duration: 500
            }
            
        }
    }
}
