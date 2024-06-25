import Felgo
import QtQuick
import QtQuick.Controls
import "../Entities"

Item{
    id: _mainItem
    property alias menuScene:_menuScene
    property alias settingScene:_settingScene

    MenuScene {
        id: _menuScene
        width: 640
        height: 1080
        start.onClicked: {
            _menuScene.visible=false
            componentLoader.source="./GameScene.qml"
            componentLoader.active=true
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

    GameSoundEffect {
        id:background_music
//        loop:Infinite
        source: Qt.resolvedUrl("../../assets/wav/music_game.wav")
    }

     Component.onCompleted:{
         background_music.play();
     }

}
