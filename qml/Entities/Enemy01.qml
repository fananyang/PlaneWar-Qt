import QtQuick
import Felgo
import QtQuick.Controls

Enemy{
    id:_enemy01

    entityId: "enemy01"
    entityType: "Enemy01"

    property int health :25

    property int score : 1
    property int boom:5


    //    image.source: Qt.resolvedUrl("../../assets/img/small_enemy.png")
    image.source:"qrc:/assets/images/small_enemy.png"

    function enemyfire(){
        var imagePointInWorldCoordinates = mapToItem(level,image.x, image.y);

        //        _manger.createEntityFromUrlWithProperties(Qt.resolvedUrl("Enemy_bullet.qml"), {"x": imagePointInWorldCoordinates.x+20, "y": imagePointInWorldCoordinates.y+40, "rotation": _enemy01.rotation+30});
        _manger.createEntityFromUrlWithProperties(Qt.resolvedUrl("Enemy_bullet.qml"), {"x": imagePointInWorldCoordinates.x-10, "y": imagePointInWorldCoordinates.y+20, "rotation": _enemy01.rotation+120});
        _manger.createEntityFromUrlWithProperties(Qt.resolvedUrl("Enemy_bullet.qml"), {"x": imagePointInWorldCoordinates.x+20, "y": imagePointInWorldCoordinates.y+50, "rotation": _enemy01.rotation+90});
        _manger.createEntityFromUrlWithProperties(Qt.resolvedUrl("Enemy_bullet.qml"), {"x": imagePointInWorldCoordinates.x+55, "y": imagePointInWorldCoordinates.y+20, "rotation": _enemy01.rotation+60});
        //        _manger.createEntityFromUrlWithProperties(Qt.resolvedUrl("Enemy_bullet.qml"), {"x": imagePointInWorldCoordinates.x+20, "y": imagePointInWorldCoordinates.y+40, "rotation": _enemy01.rotation+150});

    }
}

