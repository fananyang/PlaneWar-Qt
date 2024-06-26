import QtQuick
import Felgo

Enemy_bullet{
    id:_enemy02_bullet

    entityId: "enemy02_bullet"
    entityType: "Enemy_bullet"

//    image.source: Qt.resolvedUrl("../../assets/img/enemy_bullet.png")
    image.source: "qrc:/assets/images/enemy_bullet.png"

    PropertyAnimation on rotation {
        from: _enemy02_bullet.rotation
        to: _enemy02_bullet.rotation+270
        duration: 1000
        running: true
    }

}
