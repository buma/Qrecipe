import QtQuick 2.5
import QtQuick.Layouts 1.2

Item {
    id:ingredientItem
    width:parent.width
    height:20

    /*Component.onCompleted:  {
        console.log("data:", modelData)
    }*/

    RowLayout {
        id: rowLayout1

        Text{
            id: amountText
            text: modelData.amount
            visible: modelData.amount > 0
        }
        
        Text {
            id:unitText
            text:modelData.unit
            visible:text.length > 0
        }
        
        Text {
            id: ingredientText
            text: modelData.ingredient
            wrapMode: Text.WordWrap
            font.pixelSize: 12
            Layout.fillWidth: true
        }
        MouseArea {
            id:mouseArea
            anchors.fill: parent
            onClicked: {
                console.log(modelData)
                modelData.checked = !modelData.checked

            }
        }
        
        states: [
            State {
                name: "checked"
                when: modelData.checked === true
                
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
