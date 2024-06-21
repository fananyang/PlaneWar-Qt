//import QtQuick 2.0
//import QtQuick.Controls 2.15
//import Felgo 4.0

//EntityBase {
//    id: entity
//    entityType: "Enemy_bullet"
//    property alias m_width: boxCollider.width
//    property alias m_height: boxCollider.height
//    property alias m_image: image

//    Image {
//        id: image
//        source: "../../assets/img/enemy_bullet.png"
//        rotation: 90
//        anchors.centerIn: parent
//        width: boxCollider.width
//        height: boxCollider.height
//    }


//    function initializeBullet() {
//        var rad = entity.rotation / 180 * Math.PI

//        var localForward = Qt.point(power * Math.cos(rad), power * Math.sin(rad))

//        boxCollider.body.initializeBullet(localForward, boxCollider.body.getWorldCenter())
//    }

//    Component.onCompleted: {
//        initializeBullet();
//    }


//    property real angleDeg
//    property int boom: 1
//    property int power: 4500

//    rotation: angleDeg


//    BoxCollider {
//        id: boxCollider

//        width: 60
//        height: 35

//        anchors.centerIn: parent

//        fixture.onBeginContact:other=> {
//            var fixture = other;
//            var body = other.getBody();
//            var otherEntity = body.target

//            var collidingType = otherEntity.entityType

//            if(collidingType==="Hero_bullet"){
//                otherEntity.removeEntity()
//                entity.removeEntity()
//            }
//            if(collidingType === "Plane") {
//                 otherEntity.health--;
//                 _entity.removeEntity();
//                 return
//             }
//            if(collidingType === "wall") {
//                entity.removeEntity()
//                return
//            }
//        }

//        density: 0.003
//        friction: 0.4
//        restitution: 0.5
//        groupIndex: -2
//        body.fixedRotation: true
//    }

//    NumberAnimation on y {
//            //from: -monsterImage.height // move the monster to the left side of the screen
//            id: move_y
//            to: 1000 // start at the right side
//            duration: 80000
//            //duration:getRandomFloat(4000, 10000) // vary animation duration between 2-4 seconds for the 480 px scene width
//            onStopped: {
//                console.debug("ennmy reached base")
//                // changeToGameOverScene(false)
//            }
//        }



//}

import QtQuick 2.0
import QtQuick.Controls
import Felgo 4.0

EntityBase {
    id: entity
    entityType: "Enemy_bullet"

    Component.onCompleted: {
        console.debug("Rocket.onCompleted, width:", width);
        applyForwardImpulse();
    }

    property real angleDeg

    rotation: angleDeg

    BoxCollider {
        id: boxCollider

        // the image and the physics will use this size; this is important as it specifies the mass of the body! it is in respect to the world size
        width: 50
        height: 20

        anchors.centerIn: parent

        density: 0.003
        friction: 0.4
        restitution: 0.5
        body.bullet: true
        // we prevent the physics engine from applying rotation to the rocket, because we will do it ourselves
        body.fixedRotation: true

        property var lastWall: null

        fixture.onBeginContact: (other, contactNormal) => {
                                    var fixture = other;
                                    var body = other.getBody();
                                    var otherEntity = body.target

                                    // get the entityType of the colliding entity
                                    var collidingType = otherEntity.entityType

                                    //      if(collidingType === "car" ||
                                    //              collidingType === "rocket") {
                                    //          entity.removeEntity()
                                    //          return
                                    //      }

                                    if(collidingType === "Wall") {
                                        entity.removeEntity()
                                    }
                                    if(collidingType ==="Plane"){
                                        entity.removeEntity()

                                    }
                                    if(collidingType  === "Hero_bullet"){
                                        console.log("eb ---------------------------------------------------------> pb")
                                        entity.removeEntity();

                                    }


                                    //can't hit the same wall twice, but onBeginContact called again after rotation has changed


                                    //apply law of reflection, all calculations in degrees
//                                    var normalAngle = 180 / Math.PI * Math.atan2(contactNormal.y, contactNormal.x)
//                                    var angleDiff = normalAngle - entity.rotation
//                                    var newAngle = entity.rotation + 2 * angleDiff + 180

                                    // manually set the entity rotation, because it is the target and its rotation will be used for the physics body
//                                    entity.rotation = newAngle

                                    // it's important to clear the old velocity before applying the impulse, otherwise the rocket would get faster every time it collides with a wall!
//                                    boxCollider.body.linearVelocity = Qt.point(0,0)

                                    // applyForwardImpulse();
                                }
    }

    Image {
        id: image
        source: Qt.resolvedUrl("../../assets/img/enemy_bullet.png")
        anchors.centerIn: parent
        width: 20
        height:25
    }

    function applyForwardImpulse() {
        var power = 1000    //bullet speed
        var rad = entity.rotation / 180 * Math.PI

        //can't use body.toWorldVector() because the rotation is not instantly
        var localForward = Qt.point(power * Math.cos(rad), power * Math.sin(rad))
        boxCollider.body.applyLinearImpulse(localForward, boxCollider.body.getWorldCenter())
    }
}

