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
             console.log("clicked", _menuScene.visible,_gameScene.visible);
            _gameScene.timercontrol.running=true;
        }
    }

    GameScene {
        id: _gameScene
        visible: false
    }

    function gameover() {
         console.log("game over");
        _menuScene.visible=true;
        _gameScene.visible=false;
        _gameScene.timercontrol.running=false;
         console.log("clicked", _menuScene.visible,_gameScene.visible)

     }

}
