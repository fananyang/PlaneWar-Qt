import QtQuick
import Felgo
import QtQuick.Controls

Item {
    id:_map

    //the position of the map
    property string bgSource/*:Qt.resolvedUrl("../assets/img/img_bg_5.jpg")*/


    //operator: switch the map
//    function bgswitch(option) {
//        switch (option) {
//        case 1:
//            //            bgSource = "../assets/img/img_bg_1.jpg"
//            bgSource=Qt.resolvedUrl("../assets/img/img_bg_1.jpg")
//            break
//        case 2:
//            //            bgSource = "../assets/img/img_bg_2.jpg"
//            bgSource=Qt.resolvedUrl("../assets/img/img_bg_2.jpg")
//            break
////        case 3:
////            bgSource = "../assets/img/img_bg_level_3.jpg"
////            bgSource=Qt.resolvedUrl("../assets/img/img_bg_3.jpg")
////            break
//        case 4:
//            //            bgSource = "../assets/img/img_bg_4.jpg"
//            bgSource=Qt.resolvedUrl("../assets/img/img_bg_4.jpg")
//            break
//        case 5:
//            //            bgSource = "../assets/img/img_bg_1.jpg"
//            bgSource=Qt.resolvedUrl("../assets/img/img_bg_5.jpg")
//            break
//        }
//    }

    ParallaxScrollingBackground{
        anchors.fill: parent // 确保背景填充整个场景
        anchors.horizontalCenter: parent.horizontalCenter
        movementVelocity: Qt.point(0,150)
        sourceImage:Qt.resolvedUrl("../assets/img/img_bg_4.jpg")
    }

}
