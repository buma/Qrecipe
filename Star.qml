import QtQuick 2.5

Item {
    id: container
    width: 24
    height: 24

    property real rating

    Image {
        id: starImage
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        source: "img/no_star.png"
    }
    states: [
        State {
            name: "on"
            when: rating >=1
            PropertyChanges {
                target: starImage
                source: "img/gold_star.png"

            }
        },
        State {
            name: "half"
            when: rating < 1 && rating > 0
            PropertyChanges {
                target: starImage
                source: "img/half_gold_star.png"
            }
        }
    ]
}

