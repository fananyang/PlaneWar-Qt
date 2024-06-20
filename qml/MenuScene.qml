import QtQuick
import Felgo
import QtQml.Models
import QtQuick.Controls

// EMPTY SCENE

//SceneBase {
//    id: scene
//    property alias startMenuElement: m_start
//    property alias exitMenuElement: m_exit

//    //    width: _bg.picture.width
//    //    height: _bg.picture.height

//    //background
//    Background {
//        id: _bg;
//        x: parent.width
//        //        anchors.horizontalCenter: parent.horizontalCenter
//    }

//    //title
//    MultiResolutionImage {
//        id: _title;
//        //        source: "../assets/img/title.png"
//        source: Qt.resolvedUrl("../assets/img/title.png")
//        anchors.horizontalCenter: parent.horizontalCenter
//        y: 100
//    }


//    //menu option
//    Column {
//        id: _column
//        // 设置 _column 的位置和大小
//        anchors.horizontalCenter: parent.horizontalCenter
//        width: parent.width
//        y: 350
//        //        y: _title.y + _title.height + 50 // 根据标题的位置和大小调整
//        spacing: 10
//        MenuElement {
//            id: m_start
//            width: parent.width*0.7
//            label.text: "Start New Game"
//            onClicked: {
//                gameScene.visible = true;
//                menuScene.visible = false;
//            }
//        }
//        MenuElement {
//            id: m_exit
//            width: parent.width*0.7
//            label.text: "Exit"
//            onClicked: {
//                Qt.quit();
//            }
//        }
//    }

//}

Scene{
    id: _scene
//    anchors.fill: parent          hei ping

    Background{
        id:_map
        anchors.fill: parent
    }

    MultiResolutionImage {
        id: _title;
        width: parent.width/2+parent.width/6
        height: parent.height/4
        source: Qt.resolvedUrl("../assets/img/title.png")
        anchors.horizontalCenter: parent.horizontalCenter
        y: 200
    }

    Column {
        id: _column
        // 设置 _column 的位置和大小
        anchors.horizontalCenter: parent.horizontalCenter
//        anchors.verticalCenter: parent.verticalCenter-parent.verticalCenter
        width: parent.width
        y:parent.height/2-parent.height/24
        //        y: _title.y + _title.height + 50 // 根据标题的位置和大小调整
        spacing: 25
        MenuElement {
            id: m_start
            width: parent.width*0.7
            label.text: "Start New Game"
            onClicked: {
                gameScene.visible = true;
                _scene.visible = false;
            }
        }
        MenuElement{
            id:m_setting
            width: parent.width*0.7
            label.text: "Setting"
            onClicked: {

            }
        }

        MenuElement {
            id: m_exit
            width: parent.width*0.7
            label.text: "Exit"
            onClicked: {
                Qt.quit();
            }
        }
    }
}
