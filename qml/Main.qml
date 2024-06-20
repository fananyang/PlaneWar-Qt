import Felgo 4.0
import QtQuick 2.15
import QtQuick.Controls 2.15
import "./Entities"
import "./Windows"
GameWindow {
    id: _gameWindow

    screenWidth: 960
    screenHeight: 640

//    Component.onCompleted: {
//        mainItemLoader.source = "MainScene.qml"
////        mainItemLoader.source = "GameScene.qml"
//    }

//    Loader {
//        id: mainItemLoader
//    }

    MainScene{
        id: mainscene
    }

}
