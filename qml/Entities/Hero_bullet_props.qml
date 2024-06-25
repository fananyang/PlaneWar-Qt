import QtQuick
import QtQuick.Controls
import Felgo
import "../Entities"
import "../../assets/img"

EntityBase {
    id:_Hero_bullet_props

    entityId: "Props4"
    entityType: "Hero_bullet_props"

    Image {
        id: _propsimage
        width: 50
        height: 45
        source: Qt.resolvedUrl("../../assets/img/prop_1.png")
    }

    x:getRandomFloat(50,500)


    BoxCollider{
        id:_propscollider
        anchors.fill: _propsimage    // make the collider as big as the image

        //Set this property to false when the position & rotation should be updated by Box2D (the default value). set it to true, the positions are taken from the target and the colliders are only used for collision detection but not for position updating.
        collisionTestingOnlyMode: true

        angularDamping: 0.1
        fixedRotation: true

        density: 0.003
        friction: 0.4
        restitution: 0.5
        body.bullet: true

        //This handler is called when 2 fixtures start to collide with each other.
        fixture.onBeginContact:other=> {
                                   var fixture=other
                                   var collderbody = other.getBody();
                                   var collidedEntity =collderbody.target;

                                   console.log("collided with entity:",collidedEntity.entityType);

                                   //The collision rules for the enemy aircraft are as follows: when the enemy aircraft is hit, it will disappear or Health reduction .
                                   if(collidedEntity.entityType ==="Wall"){
//                                       _propsimage.visible=false;
                                       _Hero_bullet_props.removeEntity();
                                   }
                                   if(collidedEntity.entityType ==="Plane"){
                                       _propsimage.visible=false;
                                       _Hero_bullet_props.removeEntity();

                                   }
                                   if(collidedEntity.entityType ==="Helth_props"){
//                                       _propsimage.visible=false;
                                       _Hero_bullet_props.removeEntity();

                                   }
                                   if(collidedEntity.entityType ==="Defense_props"){
//                                       _propsimage.visible=false;
                                       _Hero_bullet_props.removeEntity();

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



}

