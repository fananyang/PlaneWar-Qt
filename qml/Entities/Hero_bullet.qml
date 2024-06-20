import QtQuick 2.15
import QtQuick.Controls 2.15
import Felgo 4.0


EntityBase {
    id: _entity
    entityType: "Hero_bullet"

    Image {
        id: image
        source: "../../assets/img/blue_bullet.png"
        anchors.centerIn: parent
        width: boxCollider.width
        height: boxCollider.height
    }

    function initi_alizeBullet() {
        var rad = _entity.rotation / 180 * Math.PI

        var localForward = Qt.point(power * Math.cos(rad), power * Math.sin(rad))

        boxCollider.body.initializeBullet(localForward, boxCollider.body.getWorldCenter())
    }

    Component.onCompleted: {
        initi_alizeBullet();
    }



    property real angleDeg
    property int boom: 1
    property int power: 1000

    rotation: angleDeg

    BoxCollider {
        id: _hero_bullet

        width: 40
        height: 8

        anchors.centerIn: parent

        density: 0.003
        friction: 0.4
        restitution: 0.5
        body.bullet: true
        body.fixedRotation: true

        fixture.onBeginContact: {
            var fixture = other;
            var body = other.getBody();
            var otherEntity = body.target

            var collidingType = otherEntity.entityType

            if(collidingType === "wall") {
                _entity.removeEntity()
                return
            }
            if(collidingType === "enemy") {
                entity.removeEntity()
                return
            }
        }

    }


}
