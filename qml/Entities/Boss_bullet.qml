import QtQuick 2.0
import QtQuick.Controls
import Felgo 4.0

EntityBase {
    id: entity
    entityType: "Enemy_bullet"

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
    //    restitution: 0.5  rebound
        body.bullet: true
        // we prevent the physics engine from applying rotation to the rocket, because we will do it ourselves
//        body.fixedRotation: true

        property var lastWall: null

        fixture.onBeginContact: (other, contactNormal) => {
                                    var fixture = other;
                                    var body = other.getBody();
                                    var otherEntity = body.target

                                    // get the entityType of the colliding entity
                                    var collidingType = otherEntity.entityType

                                    if(collidingType === "Wall") {
                                        entity.removeEntity()
                                    }
                                    if(collidingType ==="Plane"){
                                        entity.removeEntity()
                                    }
                                    if(collidingType ==="Helth_props"){
                                        entity.removeEntity()
                                    }
                                    if(collidingType  === "Hero_bullet"){
                                        entity.removeEntity();

                                    }
                                    if(collidingType ==="Boss_bullet"){
                                        entity.removeEntity();
                                    }
                                    if(collidingType ==="Rocket"){
                                        entity.removeEntity();
                                    }
                                    if(collidingType ==="Defense_props"){
                                        entity.removeEntity()
                                    }
                                    if(collidingType ==="Hero_bullet_props"){
                                        entity.removeEntity()
                                    }
                                    if(collidingType ==="Rocket_props"){
                                        entity.removeEntity()
                                    }

                                }
    }

    Image {
        id: image
//        source: Qt.resolvedUrl("../../assets/img/boss_bullet_triangle.png")
        source: "qrc:/assets/images/boss_bullet_triangle.png"
        anchors.centerIn: parent
        width: 30
        height:25
    }

//    function applyForwardImpulse() {
//        var power = 1000    //bullet speed
//        var rad = entity.rotation / 180 * Math.PI

//        //can't use body.toWorldVector() because the rotation is not instantly
//        var localForward = Qt.point(power * Math.cos(rad), power * Math.sin(rad))
//        boxCollider.body.applyLinearImpulse(localForward, boxCollider.body.getWorldCenter())
//    }

    function applyForwardImpulse() {
        var power = 1000    // bullet speed
        var rad = entity.rotation / 180 * Math.PI

        // Apply forward linear impulse to move the bullet
        var localForward = Qt.point(power * Math.cos(rad), power * Math.sin(rad))
        boxCollider.body.applyLinearImpulse(localForward, boxCollider.body.getWorldCenter())

        // Apply clockwise rotational torque to the bullet
        var torque = -1000000 // Negative value for clockwise rotation
        boxCollider.body.applyTorque(torque)
    }
}

