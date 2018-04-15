import QtQuick 2.5
import QtQuick.Layouts 1.2

Item {
    id:ingredientItem
    width:parent.width
    height:Math.max(16, amountText.paintedHeight)

    property bool checked: false
    property real amount_calc: ingrediendsListView.servings===0? amount:Math.round(amount * (ingrediendsListView.servings/ingrediendsListView.recipeServings)*100)/100




    Component.onCompleted:  {
        //console.log("data:", modelData)
        /*if (group != "") {
            console.log(group, ingredient)
        }*/
        //console.log("servings", ingrediendsListView.servings)
        //console.log(ingrediendsListView.servings/ingrediendsListView.recipeServings)
    }


        Text{
            id: amountText
            text: {
                if (amount_calc > 0) {
                    qsTr("%L1 %2 %3").arg(amount_calc).arg(unit).arg(ingredient)
                }else {
                    ingredient
                }
            }
            //text: "Something very very long that is too much to be shown in that small space. I wonder what will happen"
            font.pointSize: 16
            wrapMode: Text.WordWrap
            anchors.fill: parent
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
