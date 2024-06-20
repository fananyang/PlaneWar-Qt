import QtQuick
import Felgo
import QtQuick.Controls

Item {
    id:_map

    //the position of the map
//    property string bgSource:Qt.resolvedUrl("../assets/img/img_bg_5.jpg")
    property var pic : _bg


    ParallaxScrollingBackground{
        id : _bg
//        anchors.fill: parent // 确保背景填充整个场景
        anchors.horizontalCenter: parent.horizontalCenter
        movementVelocity: Qt.point(0,150)
        sourceImage:Qt.resolvedUrl("../assets/img/img_bg_4.jpg")
    }

}
