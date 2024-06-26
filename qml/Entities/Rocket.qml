import QtQuick 2.0
import QtQuick.Controls
import Felgo 4.0

EntityBase {
    id: entity
    entityType: "Rocket"

    Component.onCompleted: {
//        console.debug("Rocket.onCompleted, width:", width);
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
                                        image.visible=false;
                                        entity.removeEntity();
                                    }
                                    if(collidingType ==="Enemy"){
                                        image.visible=false;
//                                        otherEntity.health-=8;
                                        entity.removeEntity();
                                    }
                                    if(collidingType === "Enemy_bullet"){
                                        image.visible=false;
                                        entity.removeEntity();
                                    }
                                    if(collidingType === "Defense_props"){
                                        image.visible=false;
                                        entity.removeEntity();
                                    }
                                    if(collidingType === "Helth_props"){
                                        image.visible=false;
                                        entity.removeEntity();
                                    }
                                    if(collidingType === "Boss"){
                                        image.visible=false;
                                        entity.removeEntity();
                                    }
                                    if(collidingType ==="Rocket"){
                                        entity.removeEntity();
                                    }
                                    if(collidingType ==="Hero_bullet_props"){
                                        entity.removeEntity()
                                    }
                                    if(collidingType ==="Rocket_props"){
                                        entity.removeEntity()
                                    }

                                    //can't hit the same wall twice, but onBeginContact called again after rotation has changed


                                    //apply law of reflection, all calculations in degrees
                                    var normalAngle = 180 / Math.PI * Math.atan2(contactNormal.y, contactNormal.x)
                                    var angleDiff = normalAngle - entity.rotation
                                    var newAngle = entity.rotation + 2 * angleDiff + 180

                                    // manually set the entity rotation, because it is the target and its rotation will be used for the physics body
                                    entity.rotation = newAngle

                                    // it's important to clear the old velocity before applying the impulse, otherwise the rocket would get faster every time it collides with a wall!
                                    boxCollider.body.linearVelocity = Qt.point(0,0)

                                   // applyForwardImpulse();
                                }
    }

    Image {
        id: image
//        source: Qt.resolvedUrl("../../assets/img/rocket.png")
        source:"qrc:/assets/images/rocket.png"
        anchors.centerIn: parent
        width:50
        height:20
    }

    function applyForwardImpulse() {
        var power = 1850            //bullet speed
        var rad = entity.rotation / 180 * Math.PI

        //can't use body.toWorldVector() because the rotation is not instantly
        var localForward = Qt.point(power * Math.cos(rad), power * Math.sin(rad))
        boxCollider.body.applyLinearImpulse(localForward, boxCollider.body.getWorldCenter())
    }
}
