import Felgo
import QtQuick

Item{
    id: _mainItem
    //    screenHeight: 767
    //    screenWidth: 512
    //activeScene: playScene
    property alias gameScene:_gameScene

    MenuScene {
        id: _menuScene
        //        startMenuElement.onClicked: { gameScene.visible = true; menuScene.visible = false }
        //        exitMenuElement.onClicked: { Qt.quit() }

    }


        GameScene {
            id: _gameScene
            visible: false
        }


}
