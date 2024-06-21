import Felgo
import QtQuick
import QtQuick.Controls

Item{
    id: _mainItem
//    activeScene: _gameScene
    property alias gameScene:_gameScene

    MenuScene {
        id: _menuScene
        width: 640
        height: 1080
        column.onClicked: {
            _menuScene.visible=false;
            _gameScene.visible=true;
            _gameScene.timecontrol.running=true
             console.log("clicked", _menuScene.visible,_gameScene.visible)
        }
    }

    GameScene {
        id: _gameScene
        visible: false
    }

}
