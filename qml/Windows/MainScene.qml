import Felgo
import QtQuick
import QtQuick.Controls

Item{
    id: _mainItem
    //    activeScene: _gameScene
    //    property alias gameScene:_gameScene
    property alias menuScene:_menuScene

    MenuScene {
        id: _menuScene
        width: 640
        height: 1080
        column.onClicked: {
            _menuScene.visible=false;
            componentLoader.source="./GameScene.qml"
            componentLoader.active=true
//            componentLoader.sourceComponent=gameSceneComponent
//            console.log("clicked", _menuScene.visible,_gameScene.visible);
        }
    }

    Loader{
        id: componentLoader
        focus: true
    }

//    Component{
//        id:gameSceneComponent
//        GameScene{
//            id: _gameScene
//        }
//    }



}
