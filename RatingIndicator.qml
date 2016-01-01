import QtQuick 2.5

Item {
    id:ratingIndicator
    property real indicator_rating:;
    width:repeater.count*24
    height:24

    Row {
        Repeater {
            id:repeater
            model:5
            delegate: Star{
                id:star
                rating:indicator_rating-index
            }
        }
    }
}

