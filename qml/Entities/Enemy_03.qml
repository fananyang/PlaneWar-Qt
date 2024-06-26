import QtQuick
import Felgo

Enemy{
    id: _enemy03
    entityType: "Enemy_03"
//    image.source: Qt.resolvedUrl("../../assets/img/small_enemy.png")
//    image.source:  Qt.resolvedUrl("../../assets/img/small_enemy.png")
    image.source: "qrc:/assets/images/small_enemy.png"
    property int health :10

    property int score : 1
    property int boom:1
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

}
