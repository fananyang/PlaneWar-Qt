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
//    property alias gameOverTimer:_gameOverTimer
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
            timer2.running=true;
            timer3.running=true;
            timer4.running=true;
            timer5.running=true;
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

        score++
        _manger.createEntityFromUrlWithProperties(Qt.resolvedUrl("../Entities/Enemy.qml"), {"y": parent.y+20})
    }

    Timer{
        id:timer2
        interval: 6000
        repeat: true
        running: _alltime.running
        onTriggered: {
            addHelthProps();
        }

    }

    Timer{
        id:timer3
        interval: 8000
        repeat: true
        running: _alltime.running
        onTriggered: {
            addDefenseProps();
        }

    }
    Timer{
        id:timer4
        interval: 7000
        repeat: true
        running: _alltime.running
        onTriggered: {
            addRocketProps();
        }

    }
    Timer{
        id:timer5
        interval: 7000
        repeat: true
        running: _alltime.running
        onTriggered: {
            addHero_bulletProps();
        }

    }


    function addHero_bulletProps(){
        _manger.createEntityFromUrlWithProperties(Qt.resolvedUrl("../Entities/Hero_bullet_props.qml"),{"y":parent.y+2})
    }

    function addHelthProps(){
        _manger.createEntityFromUrlWithProperties(Qt.resolvedUrl("../Entities/Helth_props.qml"),{"y":parent.y+5})
    }

    function addDefenseProps(){
        _manger.createEntityFromUrlWithProperties(Qt.resolvedUrl("../Entities/Defense_props.qml"),{"y":parent.y+20})
    }
    function addRocketProps(){
        _manger.createEntityFromUrlWithProperties(Qt.resolvedUrl("../Entities/Rocket_props.qml"),{"y":parent.y+15})
    }


    onScoreChanged: {
        if(score>=5){
//            gameWon()
            _bosstimer.running=true
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
            menuScene.start.opacity=0.8;
            componentLoader.active=false
            menuScene.visible=true
            settingScene.visible=false
            _plane.image.visible=false      //can not false?
        }
    }

    Timer{
        id: _gameWonTimer
        running: false
        interval: 4000
        repeat: false
        onTriggered: {
            _menuScene.start.opacity=0.8;
            componentLoader.active=false
            menuScene.visible=true
            settingScene.visible=false
            _boss.visible=false       //can not false?
            _boss.bossImage.visible=false
            _boss.removeEntity()
        }
    }



    Timer{
        id : _bosstimer
        running: false
//        interval: 1000
        repeat: false
        onTriggered: {
            _boss.visible=true
            _boss.bossFireTimer.running=true
            _boss.bossPositionTimer.running=true
//            console.log("------------------------------------------------------------------------------------------------------")
//            console.log("boss.visible:",_boss.visible,"bossfire:",_boss.bossFireTimer.running,"bosspositionT:",_boss.bossPositionTimer.running)
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
