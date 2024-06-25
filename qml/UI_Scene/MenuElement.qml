

import QtQuick
import Felgo
import QtQuick.Controls

Rectangle {
    id: menuElement
    property alias label: _label
    signal clicked()

    anchors.horizontalCenter: parent.horizontalCenter

    width: parent.width * 0.7; height: 60
    color: "lightgreen"
    opacity: mouse.hovered? 0.6: 0.8
//    opacity: 0.8
    radius: 12

    Label {
        id: _label
        anchors.centerIn: parent
        font.bold: true
        font.pixelSize: 20
    }

    TapHandler {
        id: _tp
        onTapped: {
            clicked() // 发出 clicked 信号
//            menuElement.opacity = 0.6
        }
        //        onPressed: {
        //            menuElement.opacity = 0.6
        //        }
        //        onReleased: {
        //            menuElement.opacity = 0.8
        //            clicked() // 发出 clicked 信号
        //        }
    }

   HoverHandler{
       id:mouse
       acceptedDevices: PointerDevice.Mouse
       cursorShape: Qt.PointingHandCursor
   }
}
