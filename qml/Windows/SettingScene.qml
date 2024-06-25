import QtQuick
import Felgo
import QtQuick.Controls

// EMPTY SCENE

Scene {
    id: scene
    property int selectMap: 1
    width: 960
    height: 1080

    MultiResolutionImage {
        id: bg;
        anchors.fill: parent;
        source: Qt.resolvedUrl("../../assets/img/setting.jpg")
    }

//level 1
    Text {
        id: text1
        text: qsTr("Level 1")
        y: 130+50+50
        x: 200
        color: "white"
        font.pixelSize: 30
    }
    Rectangle {
        id: stage1
        width: 100
        height: 100
        x: 480
        y: 100+50+50
        MultiResolutionImage {
            id: image
            anchors.fill: parent
            source: Qt.resolvedUrl("../../assets/img/img_bg_2.jpg")
        }
        TapHandler{
            onTapped: {
                selectStage1.visible = true; selectStage2.visible = false; selectStage3.visible = false; selectMap = 1
            }
        }
        opacity: mouse1.hovered? 0.6: 0.8
        HoverHandler{
            id:mouse1
            acceptedDevices: PointerDevice.Mouse
            cursorShape: Qt.PointingHandCursor
        }
    }
    MultiResolutionImage {
        id: selectStage1
        height: 60
        width: 60
        source: Qt.resolvedUrl("../../assets/img/setting.jpg")
        x: 700
        y: 120+50+50
        visible: true
    }

    //Level 2
    Text {
        id: text2
        text: qsTr("Level 2")
        y: 280+50+50
        x: 200
        color: "white"
        font.pixelSize: 30
    }
    Rectangle {
        id: stage2
        width: 100
        height: 100
        x: 480
        y: 250+50+50
        MultiResolutionImage {
            anchors.fill: parent
            source: Qt.resolvedUrl("../../assets/img/img_bg_1.jpg")
        }
        TapHandler{
            onTapped: {
                selectStage1.visible = false; selectStage2.visible = true; selectStage3.visible = false; selectMap = 2
            }
        }
        opacity: mouse2.hovered? 0.6: 0.8
        HoverHandler{
            id:mouse2
            acceptedDevices: PointerDevice.Mouse
            cursorShape: Qt.PointingHandCursor
        }
    }
    MultiResolutionImage {
        id: selectStage2
        height: 60
        width: 60
        source: Qt.resolvedUrl("../../assets/img/setting.jpg")
        x: 700
        y: 270+50+50
        visible: false
    }


    //Level 3
    Text {
        id: text3
        text: qsTr("Level 3")
        y: 430+50+50
        x: 200
        color: "white"
        font.pixelSize: 30
    }
    Rectangle {
        id: stage3
        width: 100
        height: 100
        x: 480
        y: 400+50+50
        MultiResolutionImage {
            anchors.fill: parent
            source:Qt.resolvedUrl("../../assets/img/img_bg_5.jpg")
        }
        TapHandler{
            onTapped: {
                selectStage1.visible = false; selectStage2.visible = false; selectStage3.visible = true; selectMap = 3
            }
        }
        opacity: mouse3.hovered? 0.6: 0.8
        HoverHandler{
            id:mouse3
            acceptedDevices: PointerDevice.Mouse
            cursorShape: Qt.PointingHandCursor
        }
    }
    MultiResolutionImage {
        id: selectStage3
        height: 60
        width: 60
        source: Qt.resolvedUrl("../../assets/img/setting.jpg")
        x: 700
        y: 420+50+50
        visible: false
    }


    /*back*/
    MultiResolutionImage {
        id: m_backImage
        source: Qt.resolvedUrl("../../assets/img/title.png")
        anchors.horizontalCenter: parent.horizontalCenter
        y: parent.height - 220

        property alias mouseArea: m_handler
        TapHandler{
            id:m_handler
            onTapped: {
                settingScene.visible=false
                menuScene.visible= true
            }
        }
        opacity: mouse.hovered? 0.6: 0.8
        HoverHandler{
            id:mouse
            acceptedDevices: PointerDevice.Mouse
            cursorShape: Qt.PointingHandCursor
        }
    }

}

