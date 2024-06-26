import QtQuick
import Felgo
import QtQuick.Controls

Enemy{
    id:_enemy01

    entityId: "enemy01"
    entityType: "Enemy01"

     health :25

     score : 1
     boom:5


    //    image.source: Qt.resolvedUrl("../../assets/img/small_enemy.png")
//    image.source:"qrc:/assets/images/small_enemy.png"
    image.source: "qrc:/assets/images/enemy02.png"

    function enemyfire(){
        var imagePointInWorldCoordinates = mapToItem(level,image.x, image.y);

        //        _manger.createEntityFromUrlWithProperties(Qt.resolvedUrl("Enemy01_bullet.qml"), {"x": imagePointInWorldCoordinates.x+20, "y": imagePointInWorldCoordinates.y+40, "rotation": _enemy01.rotation+30});
        _manger.createEntityFromUrlWithProperties(Qt.resolvedUrl("Enemy01_bullet.qml"), {"x": imagePointInWorldCoordinates.x-5, "y": imagePointInWorldCoordinates.y+25, "rotation": _enemy01.rotation+120,"entityId":getRandomFloat(1,456)});
        _manger.createEntityFromUrlWithProperties(Qt.resolvedUrl("Enemy01_bullet.qml"), {"x": imagePointInWorldCoordinates.x+31, "y": imagePointInWorldCoordinates.y+55, "rotation": _enemy01.rotation+90,"entityId":getRandomFloat(456,5000)});
        _manger.createEntityFromUrlWithProperties(Qt.resolvedUrl("Enemy01_bullet.qml"), {"x": imagePointInWorldCoordinates.x+55, "y": imagePointInWorldCoordinates.y+25, "rotation": _enemy01.rotation+60,"entityId":getRandomFloat(42,300)});
        //        _manger.createEntityFromUrlWithProperties(Qt.resolvedUrl("Enemy_bullet.qml"), {"x": imagePointInWorldCoordinates.x+20, "y": imagePointInWorldCoordinates.y+40, "rotation": _enemy01.rotation+150});

    }
}

