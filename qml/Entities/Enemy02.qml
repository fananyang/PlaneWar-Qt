import QtQuick
import Felgo
import QtQuick.Controls

Enemy{
    id:_enemy02

    entityId: "enemy02"
    entityType: "Enemy02"

    health :30
    score : 1
    boom:15

    property int startX: 50
    property int endX: getRandomFloat(50,550)

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
        interval: 1700 // update boss position per 1.8s
        repeat: true
        running: _enemy02.image.visible
        onTriggered: {
//            console.log(startX,"------------------------------------------------->",endX);
            startX =_enemy02.endX
            endX=getRandomFloat(50,550);
//            console.log(startX,"------------------------------------------------->>>",endX);

        }
    }

  //  image.source:Qt.resolvedUrl("../../assets/img/small_enemy.png")
//    image.source: "qrc:/assets/images/small_enemy.png"
    image.width: 70
    image.height: 130
    image.rotation: -90
    image.source: "qrc:/assets/images/enemy2.png"

    function enemyfire() {

                var imagePointInWorldCoordinates = mapToItem(level,image.x, image.y);

//                _manger.createEntityFromUrlWithProperties(Qt.resolvedUrl("Enemy_bullet.qml"), {"x": imagePointInWorldCoordinates.x+20, "y": imagePointInWorldCoordinates.y+40, "rotation": _enemy01.rotation+30});
//                _manger.createEntityFromUrlWithProperties(Qt.resolvedUrl("Enemy_bullet.qml"), {"x": imagePointInWorldCoordinates.x-10, "y": imagePointInWorldCoordinates.y+20, "rotation": _enemy02.rotation+120});
                _manger.createEntityFromUrlWithProperties(Qt.resolvedUrl("Enemy02_bullet.qml"), {"x": imagePointInWorldCoordinates.x+10, "y": imagePointInWorldCoordinates.y+80, "rotation": _enemy02.rotation+90});
                _manger.createEntityFromUrlWithProperties(Qt.resolvedUrl("Enemy02_bullet.qml"), {"x": imagePointInWorldCoordinates.x+55, "y": imagePointInWorldCoordinates.y+50, "rotation": _enemy02.rotation+90});
        //        _manger.createEntityFromUrlWithProperties(Qt.resolvedUrl("Enemy_bullet.qml"), {"x": imagePointInWorldCoordinates.x+20, "y": imagePointInWorldCoordinates.y+40, "rotation": _enemy01.rotation+150});

            }



}

