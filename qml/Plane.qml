import QtQuick 2.0
import Felgo 4.0

EntityBase {
    id: plane
    entityType: "plane"

    Image {
        id: image
        source: Qt.resolvedUrl("../../assets/img/hero.png")
        anchors.centerIn: parent
        width: 50
        height: 50
    }
}
