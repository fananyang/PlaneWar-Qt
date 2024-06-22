import QtQuick
import Felgo
import QtQuick.Controls
import "../Entities"
import "../UI_Scene"

Scene {
    property alias level:_level
    property alias timercontrol:_level.timecontrol
    property alias sc:_scene

    id:_scene
    focus: true
    Keys.forwardTo: [_level.planer.controller]
//2024/6/22
    width: _map.picture.width
    height: _map.picture.height

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

