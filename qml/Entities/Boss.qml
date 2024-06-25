import QtQuick
import Felgo
import QtQuick.Controls

EntityBase {
    id:_boss
    property alias bossImage:_bossimage
    property alias bossPositionTimer:_bossposition
    property alias bossFireTimer:t

    entityId: "Boss"
    entityType: "Boss"

    property int health :1000

    property int score : 100
    property int boom:100

    MultiResolutionImage {
        id: _bossimage
        width: 200
        height: 200
        source: Qt.resolvedUrl("../../assets/img/boss_0.png")
    }

    //    x:sc.x
    //    y:sc.y

    //    y:getRandomFloat(0,200)
    //  x:getRandomFloat(50,600)  //create position of x

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
                                       _boss.health-=10;
                                   }
                                   if( collidedEntity.entityType ==="Rocket" ){
                                       if(_boss.visible)
                                       _boss.health=health-30;
                                   }
                               }
    }

    //    onHealthChanged: {
    //        if(health <=10){
    //            _boomexp.visible=true;
    //            _bossimage.visible=false;
    //            t1.start();
    //            //            _boomexp.visible=false;
    //        }
    //        if(health <= 0){
    //            gameWon()
    //        }
    //    }

    onHealthChanged: {
        if(health<=10){
            background_music.play();
            _m1.running=true
            t.running=false
            _bossimage.visible=false
            _boomexp.visible=true
            _bossposition.running=false
            startX=endX
            console.log("-----------------------------------------------------------------------")
            t1.running;
        }
        if(health <= 0){
            gameWon()
            _bossimage.visible=false
            _bosscollider.visible=false
            t.running=false
            _bossposition.running=false
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
        interval: 1800 // update boss position per 1.8s
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


//    function enemyfire(){
//        var imagePointInWorldCoordinates = mapToItem(level,_bossimage.x, _bossimage.y);

//        _manger.createEntityFromUrlWithProperties(Qt.resolvedUrl("Boss_bullet.qml"), {"x": imagePointInWorldCoordinates.x+80, "y": imagePointInWorldCoordinates.y+160, "rotation": _boss.rotation+95});

//    }

    function enemyfire() {
            var imagePointInWorldCoordinates = mapToItem(level, _bossimage.x, _bossimage.y);
            var bulletCount = 10;
            var angleStep = 360 / bulletCount;


            for (var i = 0; i < bulletCount; i++) {
                var currentAngle = _boss.rotation - angleStep * i;
                var radians = currentAngle * Math.PI / 180;
                var bulletX = imagePointInWorldCoordinates.x +  + Math.cos(radians) * 80;
                var bulletY = imagePointInWorldCoordinates.y +  + Math.sin(radians) * 80;

                var bullet = _manger.createEntityFromUrlWithProperties(Qt.resolvedUrl("Boss_bullet.qml"), {
                    "x": bulletX+50+45,
                    "y": bulletY+50+25,
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

    Timer {
        id: t1
        interval: 800 // a new target(=monster) is spawned every second
        running: false
        onTriggered: {
            console.log("<<<----------------_boomexp--------------------------------->");
            health-=20;
            _boomexp.visible=false;
        }
    }


    SpriteSequence {
        id: _boomexp
        width: 90
        height: 90
        anchors.centerIn: _bossimage
        //        anchors.fill: _enemyimage
        visible: false

        Sprite {
            name: "bomb1"
            source: "../../assets/img/boom1.png"
            to: { "bomb2": 1 }
            frameDuration: 100
        }
        Sprite {
            name: "bomb2"
            source: "../../assets/img/boom2.png"
            to: { "bomb3": 1 }
            frameDuration: 150
        }
        Sprite {
            name: "bomb3"
            source: "../../assets/img/boom3.png"
            to: { "bomb4": 1 }
            frameDuration: 200
        }
        Sprite {
            name: "bomb4"
            source: "../../assets/img/boom4.png"
            to: { "bomb5": 1 }
            frameDuration: 150
        }
        Sprite {
            name: "bomb5"
            source: "../../assets/img/bomm0.png"
            to: { "bomb1": 1 }
            frameDuration: 100
        }

    }
    BackgroundMusic {
        id:background_music
//        loop:Infinite
        source: Qt.resolvedUrl("../../assets/wav/exploBig.wav")
    }

//     Component.onCompleted:{
//         background_music.play();
//     }
    Timer {
        id: _m1
        interval: 1000 // a new target(=monster) is spawned every second
        running: false
        onTriggered: {
            background_music.stop();
        }
    }

}
