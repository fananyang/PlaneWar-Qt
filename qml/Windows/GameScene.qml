import QtQuick
import Felgo
import QtQuick.Controls
import "../Entities"
import "../UI_Scene"

Scene {
    property alias level:_level

    property alias sc:_scene

    property alias timecontrol:_level.timeControl
    id:_scene
    focus: true
    Keys.forwardTo: [_level.planer.controller]

//    Component.onCompleted:{
//        console.log(_scene.focus,_level.planer.controller.focus)
//    }

//    onFocusChanged: {
//        console.log("in game scene focus changged",_scene.focus,_level.planer.focus)
//    }

//        width: _map.width
//        height:_map.height

    EntityManager{
        id:_manger
        entityContainer: _level
    }

    Background{
        id:_map
        anchors.fill: _scene.gameWindowAnchorItem
        Component.onCompleted: {
            //something to do
        }
    }

    PhysicsWorld {
        id: world
        updatesPerSecondForPhysics: 10
    }

    Level{
        id:_level

    }

}

