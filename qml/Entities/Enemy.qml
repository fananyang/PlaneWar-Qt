import QtQuick 2.15
import Felgo 4.0
import QtQuick.Controls 2.15


EntityBase {
    id: _enemy
    entityType: "Enemy"
    property alias image: _enemyimage

    property int health :10

    property int score : 1
    property int boom:1

    MultiResolutionImage {
        id: _enemyimage
        source: Qt.resolvedUrl("../../assets/img/small_enemy.png")
    }

    //    x:sc.x
    //    y:sc.y

    //    y:getRandomFloat(0,200)
    x:getRandomFloat(50,600)  //create position of x

    BoxCollider{
        id:_enemtycollider
        anchors.fill: _enemyimage    // make the collider as big as the image

        //Set this property to false when the position & rotation should be updated by Box2D (the default value). set it to true, the positions are taken from the target and the colliders are only used for collision detection but not for position updating.
        collisionTestingOnlyMode: true

        angularDamping: 0.1
        fixedRotation: true

        //This handler is called when 2 fixtures start to collide with each other.
        fixture.onBeginContact:other=> {
                                   var fixture = other;
                                   var collderbody = other.getBody();
                                   var collidedEntity =collderbody.target;

                                   console.log("collided with entity:",collidedEntity.entityType);

                                   //The collision rules for the enemy aircraft are as follows: when the enemy aircraft is hit, it will disappear or Health reduction .

                                   if( collidedEntity.entityType ==="Plane" ){
                                       if(_enemy.visible)
                                       _enemy.health=health-10;
                                   }

                                   if(collidedEntity.entityType ==="Wall"){
                                       _enemy.removeEntity();
//                                       _enemy.visible=false;

                                   }
                                   if(collidedEntity.entityType === "Hero_bullet"){
                                       _enemy.health-=10;
                                   }
                               }
    }

    onHealthChanged: {
        if(health <= 0){
//            _enemyimage.visible=false;
//            _enemtycollider.visible=false;
            _enemy.removeEntity()

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
        duration: 22000
        //duration:getRandomFloat(4000, 10000) // vary animation duration between 2-4 seconds for the 480 px scene width
        onStopped: {
            console.debug("ennmy reached base")
            // changeToGameOverScene(false)
        }
    }

    Timer {
        id: t
        interval: 1000 // a new target(=monster) is spawned every second
        repeat: true
        running: false
        onTriggered: {
            console.log("enemy fire")
            enemyfire();
        }
    }


//    function enemyfire(){
//        var imagePointInWorldCoordinates = mapToItem(level,_enemyimage.x, _enemyimage.y);

//        _manger.createEntityFromUrlWithProperties(Qt.resolvedUrl("Enemy_bullet.qml"), {"x": imagePointInWorldCoordinates.x+20, "y": imagePointInWorldCoordinates.y+40, "rotation": _enemy.rotation+90});

//    }
    function enemyfire() {
        var imagePointInWorldCoordinates = mapToItem(level, _enemyimage.x, _enemyimage.y);
        var bulletCount = 10;
        var angleStep = 360 / bulletCount;


        for (var i = 0; i < bulletCount; i++) {
            var currentAngle = _enemy.rotation - angleStep * i;
            var radians = currentAngle * Math.PI / 180;
            var bulletX = imagePointInWorldCoordinates.x +  + Math.cos(radians) * 80;
            var bulletY = imagePointInWorldCoordinates.y +  + Math.sin(radians) * 80;

            var bullet = _manger.createEntityFromUrlWithProperties(Qt.resolvedUrl("Boss_bullet.qml"), {
                "x": bulletX,
                "y": bulletY,
                "rotation": currentAngle
            });



        }
    }

    Component.onCompleted:t.start();
}
