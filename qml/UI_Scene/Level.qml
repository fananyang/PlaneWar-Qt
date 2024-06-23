import QtQuick
import Felgo
import QtQuick.Controls
import "../Entities"
import "../Windows"

Item
{
    property alias planer:_plane
    property alias timecontrol:_alltime
    property alias failText:_failText
    property alias wonText:_wonText
    property alias gameOverTimer:_gameOverTimer
    property int score : 0
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
//        onGameOver: {
//            gameFail()

//        }
    }

    Boss{
        id:_boss
        y:285
        visible: false
    }

    Component.onCompleted: {
        _alltime.running=true
    }

    Timer{
        id:_alltime
        running: false
        onTriggered: {
            timer1.running=true;
            timer2.running=true
        }
    }

    Timer{
        id:timer1
        interval: 2000
        repeat: true
        running: _alltime.running
        onTriggered: {
            //            _manger.createEntityFromComponent(mostercreate)
            addmoster();
        }

    }
    function addmoster(){
        _manger.createEntityFromUrlWithProperties(Qt.resolvedUrl("../Entities/Enemy.qml"), {"y": parent.y+20})
    }

    Timer{
        id:timer2
        interval: 4000
        repeat: true
        running: _alltime.running
        onTriggered: {
            addHelthProps();
        }

    }

    function addHelthProps(){
        _manger.createEntityFromUrlWithProperties(Qt.resolvedUrl("../Entities/Helth_props.qml"),{"y":parent.y+5})
    }

    onScoreChanged: {
        if(score>=5){
            gameWon()
        }
    }

    Text {
        id: _wonText
        text: qsTr("you won !")
        color: "gold"
        //Font.pixelSize: 50
        font.pixelSize: 100
        visible: false
        opacity: 0.8
        anchors.centerIn: parent

    }

    Text {
        id: _failText
        text: qsTr("game over, you failed")
        color: "red"
        font.pixelSize: 100
        opacity: 0.8
        visible: false
        anchors.centerIn: parent
        font.family: "Arial" // 设置字体系列为 Arial
        font.bold: true // 设置为粗体
    }


    function gameFail() {
        console.log("game over");
        _failText.visible=true
        gameOverTimer.running=true
    }

    function gameWon() {
        console.log("game won");
        _wonText.visible=true
        _gameWonTimer.running=true
    }

    Timer{
        id :_gameOverTimer
        running: false
        interval: 4000
        repeat: false
        onTriggered: {
            menuScene.column.opacity=0.8;
            componentLoader.active=false
            menuScene.visible=true
            _plane.image.visible=false      //can not false?
        }
    }

    Timer{
        id: _gameWonTimer
        running: false
        interval: 4000
        repeat: false
        onTriggered: {
            menuScene.column.opacity=0.8;
            componentLoader.active=false
            menuScene.visible=true
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
