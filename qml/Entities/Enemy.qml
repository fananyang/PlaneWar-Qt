import QtQuick 2.15
import Felgo 4.0
import QtQuick.Controls 2.15


EntityBase {
    id: _enemy
    entityType: "enemy"
    property alias enemyimage:_enemyimage
    property alias enemybullet:_enemybullet

    property int health :10
    property int score:1
    property int boom:1

    Image {
        id: _enemyimage
        source: Qt.resolvedUrl("../../assets/img/small_enemy.png")
        anchors.centerIn: parent
        width: 50
        height: 50
    }
//    x:getRandomFloat(_enemyimage.width, _enemyimage.width-20)
    x:getRandomFloat(100, 600)
    y:getRandomFloat(0,200)

//    Text {
//        id: t
//        text: qsTr("i am enemy")
//    }

    BoxCollider{
        id:_enemtycollider
        anchors.fill: _enemyimage    // make the collider as big as the image

        //Set this property to false when the position & rotation should be updated by Box2D (the default value). set it to true, the positions are taken from the target and the colliders are only used for collision detection but not for position updating.
        collisionTestingOnlyMode: true
        angularDamping: 0.1
        fixedRotation: true
        //This handler is called when 2 fixtures start to collide with each other.
        fixture.onBeginContact: {
            var collderbody = other.getBody();
            var collidedEntity =collderbody.target;

            //The collision rules for the enemy aircraft are as follows: when the enemy aircraft is hit, it will disappear or Health reduction .

            if( collidedEntity.entityType ==="Plane" ){
                if(_enemy.visible)
                    health=health-8;
            }

            if(collidedEntity.entityType ==="Wall"){
                _enemy.removeEntity();

            }
        }
    }

    onHealthChanged: {
        if(health <= 0){
            _image.visible=false;
            _enemtycollider.visible=false;
        }
    }

    function getRandomFloat(a, b) {
        // 确保a不大于b
        if (a > b) {
            var temp = a;
            a = b;
            b = temp;
        }
        // 生成随机数并缩放到指定范围
        return Math.random() * (b - a) + a;
    }
    NumberAnimation on y {
            //from: -monsterImage.height // move the monster to the left side of the screen
            id: move_y
            from: 0
            to: 10000 // start at the right side
            duration: 80000
            //duration:getRandomFloat(4000, 10000) // vary animation duration between 2-4 seconds for the 480 px scene width
            onStopped: {
                console.debug("ennmy reached base")
                // changeToGameOverScene(false)
            }
        }

    NumberAnimation on x {
            //from: -monsterImage.height // move the monster to the left side of the screen
            id: move_x
            to: getRandomFloat(0, 620)  // start at the right side

            duration:getRandomFloat(1000, 5000) // vary animation duration between 2-4 seconds for the 480 px scene width
            onStopped: {
                console.debug("enemy reached base ")
                // changeToGameOverScene(false)
            }
        }
    Component{
        id:_enemybullet
        Hero_bullet{
            id:_enemybull
            x:_enemy.x
            y:_enemy.y
            visible: _enemy.visible
            NumberAnimation on y {
                    id: y
                    to: 10000
                    duration: 50000

                }
        }
    }

    Timer {
        id: t
        interval: 800 // a new target(=monster) is spawned every second
        repeat: true
        running: true
        onTriggered: {
            console.log("enemy fire")
            enemyfire();
        }
      }
    Component.onCompleted:t.start();
}
