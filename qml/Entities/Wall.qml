import QtQuick 2.15

import Felgo 4.0

EntityBase {
    id: entity
    entityType: "Wall"

    BoxCollider {
        id: _wallCollider
        bodyType: Body.Static
        // the size of the collider is the same as the one from entity by default
    }

    Rectangle {
        anchors.fill: parent
        color: "brown"
        // this could be set to true for debugging
        visible: false
    }
}
