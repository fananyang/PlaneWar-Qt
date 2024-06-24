import Felgo
import QtQuick
import QtQuick.Controls
import "../Entities"

Item{
    id: _mainItem
    //    activeScene: _gameScene
//        property alias gameScene:_gameScene
    property alias menuScene:_menuScene
    property alias settingScene:_settingScene

    MenuScene {
        id: _menuScene
        width: 640
        height: 1080
        start.onClicked: {
            _menuScene.visible=false
//            _settingScene.visible=false
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

    SettingScene {
        id: _settingScene
        visible: false
    }


//    Component{
//        id:gameSceneComponent
//        GameScene{
//            id: _gameScene
//        }
//    }



}
