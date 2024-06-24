import QtQuick
import Felgo
import QtQuick.Controls

EntityBase {
    id:_boss

    entityId: "Boss"
    entityType: "Boss"

    property int health :100

    property int score : 100
    property int boom:100

    MultiResolutionImage {
        id: _bossimage
        width: 200
        height: 200
        source: Qt.resolvedUrl("../../assets/img/small_enemy.png")
    }
    BoxCollider{
        id:_bosscollider
        anchors.fill: _bossimage    // make the collider as big as the image

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
                                       if(_boss.visible)
                                       _boss.health=health-30;
                                   }
                                   if(collidedEntity.entityType === "Hero_bullet"){
                                       if(_boss.visible)
                                       _enemy.health-=10;
                                   }
                               }
    }

    onHealthChanged: {
        if(health <= 0){

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

    // 初始化位置
    property int startX: 50
    property int endX: getRandomFloat(50,550)
    // x: startX

    // 使用 NumberAnimation 来实现移动
    NumberAnimation on x {
        from: startX
        to: endX
        duration: 2000
        running: true
        loops: 1000
        easing.type: Easing.InOutQuad
    }


    Timer {
        id: _bossposition
        interval: 1800 // a new target(=monster) is spawned every second
        repeat: true
        running: false
        onTriggered: {
            console.log(startX,"------------------------------------------------->",endX);
            startX =_boss.endX
            endX=getRandomFloat(50,550);
            console.log(startX,"------------------------------------------------->>>",endX);

        }
    }

    Timer {
        id: t
        interval: 1000 // a new target(=monster) is spawned every second
        repeat: true
        running: false
        onTriggered: {
            console.log("boss fire")
            enemyfire();
        }
    }

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


    Component.onCompleted:{
        if(_boss.visible){
            _bossposition.start();
            t.start();
        }
    }
}
