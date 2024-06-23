import QtQuick
import QtQuick.Controls
import Felgo
import "../Entities"
import "../../assets/img"

EntityBase {
    id:_helth_props

    entityId: "Props0"
    entityType: "Helth_props"

    Image {
        id: _propsimage
        source: Qt.resolvedUrl("../../assets/img/blood.png")
    }

    x:getRandomFloat(50,265)


    BoxCollider{
        id:_propscollider
        anchors.fill: _propsimage    // make the collider as big as the image

        //Set this property to false when the position & rotation should be updated by Box2D (the default value). set it to true, the positions are taken from the target and the colliders are only used for collision detection but not for position updating.
//        collisionTestingOnlyMode: true

        angularDamping: 0.1
        fixedRotation: true

        //This handler is called when 2 fixtures start to collide with each other.
        fixture.onBeginContact:other=> {
                                   var fixture=other
                                   var collderbody = other.getBody();
                                   var collidedEntity =collderbody.target;

                                   console.log("collided with entity:",collidedEntity.entityType);

                                   //The collision rules for the enemy aircraft are as follows: when the enemy aircraft is hit, it will disappear or Health reduction .
                                   if(collidedEntity.entityType ==="Wall"){
                                       _helth_props.removeEntity();
                                   }
                                   if(collidedEntity.entityType ==="Plane"){
                                       _helth_props.removeEntity();

                                   }
                                   if(collidedEntity.entityType ==="Helth_props"){
                                       _helth_props.removeEntity();

                                   }
                               }
    }


    function getRandomFloat(a, b) {
        // make sure a <= b
        if (a > b) {
            var temp = a;
            a = b;
            b = temp;
        }

        return Math.random() * (b - a) + a;
    }



    NumberAnimation on y {
        //from: -monsterImage.height // move the monster to the left side of the screen
        id: move_y
        //            from: 0
        to: 5000 // start at the right side
        duration: 30000
        //duration:getRandomFloat(4000, 10000) // vary animation duration between 2-4 seconds for the 480 px scene width
        onStopped: {
            console.debug("helth_props reached base")
            // changeToGameOverScene(false)
        }
    }


//    Component.onCompleted: {
//        console.debug("Hero_props.onCompleted, width:", width);
//        applyForwardImpulse();
//    }


//    function applyForwardImpulse() {
//        var power = 1000    // speed
//        var rad = _helth_props.rotation / 180 * Math.PI

//        //can't use body.toWorldVector() because the rotation is not instantly
//        var localForward = Qt.point(power * Math.cos(rad), power * Math.sin(rad))
//        _propscollider.body.applyLinearImpulse(localForward, _propscollider.body.getWorldCenter())
//    }

}
