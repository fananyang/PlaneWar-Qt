import Felgo
import QtQuick

Item{
    id: _mainItem
    //    screenHeight: 767
    //    screenWidth: 512
    property alias gameScene:_gameScene

    MenuScene {
        id: _menuScene
        width: 640
        height: 1080
    }


    GameScene {
        id: _gameScene
        visible: false

//        width: 640
//        height: 1080
//        anchors.fill: gameWindowAnchorItem
    }


}
