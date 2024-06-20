import QtQuick
import Felgo
import QtQuick.Controls
import "../../assets"

Item {
    id:_map

    //the position of the map
    property string bgSource:Qt.resolvedUrl("../../assets/img/img_bg_4.jpg")/*:Qt.resolvedUrl("../assets/img/img_bg_5.jpg")*/

   // property alias picture:_bg

    ParallaxScrollingBackground{
        anchors.horizontalCenter: parent.horizontalCenter
        movementVelocity: Qt.point(0,150)
        sourceImage:bgSource
    }

}
