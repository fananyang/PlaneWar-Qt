import Felgo
import QtQuick
import QtQuick.Controls

Item{
    id: _mainItem
    //    screenHeight: 767
    //    screenWidth: 512
    //activeScene: playScene
    property alias gameScene:_gameScene

    EntityManager{
        id: _entityManager
//        entityContainer:_gameScene.level
    }

    MenuScene {
        id: _menuScene
        width: 640
        height: 1080
        column.onClicked: {
            _menuScene.visible=false;
            _gameScene.visible=true;
        }
    }


        GameScene {
            id: _gameScene
            visible: false
        }


}
