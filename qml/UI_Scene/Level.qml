import QtQuick
import Felgo
import QtQuick.Controls
import "../Entities"

Item {
    id:_level
    width: parent.width
    height: parent.height

    Rectangle {
        width: 50
        height: 50
        color: "red"
        visible: false
    }

    Component{
        id: _enemyComponent
        Enemy {
            id: _enemy
        }
    }
//    Timer {
//        id: t
//        running: false//scene.visible == true && splashFinished // only enable the creation timer, when the gameScene is visible
//        repeat: true
//        interval: 1000 // a new target(=monster) is spawned every second
//        onTriggered:_manger.createEntityFromComponent(_enemyComponent)
//    }

    Timer {
        id: timer
        running: false//scene.visible == true && splashFinished // only enable the creation timer, when the gameScene is visible
        repeat: true
        interval: 1000 // a new target(=monster) is spawned every second
        onTriggered: addTarget()
    }

    function addTarget() {
        //console.debug("create a new monster")

        _manger.createEntityFromComponent(_enemyComponent)
    }



    Wall {
        id: border_bottom

        height: 10
        anchors {
            left: parent.left
            right: parent.right
            top:  parent.bottom
        }
    }



    Wall {
        id: border_top

        height: 10
        anchors {
            //top: parent.top
            left: parent.left
            right: parent.right
            bottom: parent.top
            bottomMargin: 50
        }
    }


    Wall {
        id: border_left
        width: 20
        anchors {
            top: parent.top
            bottom: parent.bottom
            left: parent.left
        }
    }


    Wall {
        id: border_right
        width: 20
        anchors {
            top: parent.top
            bottom: parent.bottom
            right: parent.right
        }

    }
    Component.onCompleted: timer.running= true

}
