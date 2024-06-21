import QtQuick
import Felgo
import QtQuick.Controls
import "../Entities"

Item {
    property alias planer:_plane
    property alias timecontrol:_alltime
    id:_level
    width: parent.width
    height: parent.height

    Plane{
        id:_plane
        objectName: "Plane"
        variationType: "Plane"
        visible: _scene.visible
//      r  anchors.centerIn: parent.Center
        focus: true
        x: parent.width/2-width/2;
        y: parent.height-50;

        inputActionsToKeyCode: {
            "up": Qt.Key_D,
            "down": Qt.Key_A,
            "left": Qt.Key_W,
            "right": Qt.Key_S,
            "fire": Qt.Key_Space
        }
    }

    Component{
        id:mostercreate
        Enemy{

        }
    }
    Timer{
        id:_alltime
        running: false
        onTriggered: {
            timer.running=true
        }
    }

    Timer{
        id:timer
        interval: 2000
        repeat: true
        running: false
        onTriggered: {
//            _manger.createEntityFromComponent(mostercreate)
            _manger.createEntityFromUrlWithProperties(Qt.resolvedUrl("../Entities/Enemy.qml"), {"y": parent.y+20})
        }

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
//            bottomMargin: 50
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
//    Component.onCompleted: timer.running= true

}
