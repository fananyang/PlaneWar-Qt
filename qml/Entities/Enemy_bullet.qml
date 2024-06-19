import QtQuick 2.0
import QtQuick.Controls 2.15
import Felgo 4.0

EntityBase {
    id: entity
    entityType: "Enemy_bullet"
    property alias m_width: boxCollider.width
    property alias m_height: boxCollider.height
    property alias m_image: image

    Image {
        id: image
        source: "../../assets/img/enemy_bullet.png"
        rotation: 90
        anchors.centerIn: parent
        width: boxCollider.width
        height: boxCollider.height
    }


    function initializeBullet() {
        var rad = entity.rotation / 180 * Math.PI

        var localForward = Qt.point(power * Math.cos(rad), power * Math.sin(rad))

        boxCollider.body.initializeBullet(localForward, boxCollider.body.getWorldCenter())
    }

    Component.onCompleted: {
        initializeBullet();
    }


    property real angleDeg
    property int boom: 1
    property int power: 4500

    rotation: angleDeg


    BoxCollider {
        id: boxCollider

        width: 60
        height: 35

        anchors.centerIn: parent

        fixture.onBeginContact: {
            var fixture = other;
            var body = other.getBody();
            var otherEntity = body.target

            var collidingType = otherEntity.entityType

            if(collidingType==="Hero_bullet"){
                otherEntity.removeEntity()
                entity.removeEntity()
            }
            if(collidingType === "Plane") {
                 otherEntity.health--;
                 _entity.removeEntity();
                 return
             }
            if(collidingType === "wall") {
                entity.removeEntity()
                return
            }
        }

        density: 0.003
        friction: 0.4
        restitution: 0.5
        groupIndex: -2
        body.fixedRotation: true
    }



}
