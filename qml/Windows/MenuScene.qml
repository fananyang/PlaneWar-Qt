import QtQuick
import Felgo
import QtQml.Models
import QtQuick.Controls
import "../UI_Scene"

// EMPTY SCENE


Scene{

    id: _scene

    property alias start:m_start

    width:_map.picture.width
    height: _map.picture.height

    Background{
        id:_map
        anchors.fill: parent
    }

    MultiResolutionImage {
        id: _title;
        //        source: "../assets/img/title.png"
//        width: parent.width/2+parent.width/6
//        height: parent.height/4
//        source: Qt.resolvedUrl("../../assets/img/title.png")
        source:"qrc:/assets/images/title.png"
//        anchors.fill: parent
        anchors.horizontalCenter: _scene.gameWindowAnchorItem.horizontalCenter
        y:260
    }

    Column {
        id: _column
        // 设置 _column 的位置和大小
        anchors.horizontalCenter: parent.horizontalCenter
//        anchors.verticalCenter: parent.verticalCenter-parent.verticalCenter/2
        width: parent.width
        y:parent.height/2 + parent.height/12
//                y: _title.y + _title.height + 50 // 根据标题的位置和大小调整
        spacing: 25
        MenuElement {
            id: m_start
            width: parent.width*0.7
            label.text: "Start a New Game"
        }
        MenuElement {
            id: m_setting
            width: parent.width*0.7
            label.text: "Setting"
            onClicked: {
                settingScene.visible=true
            }
        }
        MenuElement {
            id: m_exit
            width: parent.width*0.7
//            height: parent.height*0.43
            label.text: "Exit"
            onClicked: {
                Qt.quit();
            }
        }
    }
}
