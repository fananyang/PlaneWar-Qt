import QtQuick
import Felgo


EntityBase {
    id: enemy
    entityType: "enemy"

    Image {
        id: image
        source: Qt.resolvedUrl("../../assets/img/enemy.png")
        anchors.centerIn: parent
        width: 100
        height: 100
    }
}
