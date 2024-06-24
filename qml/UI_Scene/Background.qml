import QtQuick
import Felgo
import QtQuick.Controls
import "../../assets"

Item {
    id:_map
    //2024/6/22
    width: picture.width
    height: picture.height

    property alias picture: image

    //the position of the map
    property string bgSource:Qt.resolvedUrl("../../assets/img/img_bg_4.jpg")/*:Qt.resolvedUrl("../assets/img/img_bg_5.jpg")*/

    // property alias picture:_bg

    ParallaxScrollingBackground{
        id: _image
        anchors.horizontalCenter: parent.horizontalCenter
        movementVelocity: Qt.point(0,150)
        sourceImage:bgSource
        sourceImage2: bgSource
    }


    MultiResolutionImage {//Displays the first background imag
        id: image
        source: bgSource
        visible: true
        z:-10
        anchors.horizontalCenter: parent.horizontalCenter

    }
}
