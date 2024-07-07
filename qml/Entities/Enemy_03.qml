import QtQuick
import Felgo
import QtQuick.Controls

Enemy{
    id: _enemy03
    entityType: "Enemy_03"
    //    image.source: Qt.resolvedUrl("../../assets/img/small_enemy.png")
    //    image.source:  Qt.resolvedUrl("../../assets/img/small_enemy.png")
    image.source: "qrc:/assets/images/small_enemy.png"
    property int health :10

    property int score : 1
    property int boom:1
    property int r:0
    function enemyfire() {

        r=(r+30)%360;
        //        console.log("boss 02 fire")
        _manger.createEntityFromUrlWithProperties(Qt.resolvedUrl("Enemy02_bullet.qml"), {
                                                      "x": _boss.x+50+45,
                                                      "y": _boss.y+50+25,
                                                      "rotation": r
                                                      ,"entityId":getRandomFloat(4,500)
                                                  });
    }

    Timer {
        id: t
        interval: 150 // a new target(=monster) is spawned every second
        repeat: true
        running: false
        onTriggered: {
            enemyfire();
        }
    }

    Component.onCompleted:{
        if(_boss.visible){
            t.start();
        }
    }

}
