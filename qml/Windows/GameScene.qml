import QtQuick
import Felgo
import QtQuick.Controls
import "../Entities"
import "../UI_Scene"

Scene {

    property alias level:_level

    property alias sc:_scene

    id:_scene
    focus: true
    //Keys.forwardTo: planer.twoAxisController

//    width: _map.width
//    height:_map.height

//    Background{
//        id:_map
//        anchors.fill: _scene.gameWindowAnchorItem
//        Component.onCompleted: {
//            //something to do
//        }
//    }

    EntityManager{
        id:_manger
        entityContainer: planer
    }

    Background{
        id:_map
        anchors.fill: parent
    }

    Plane {
        id:planer
        visible: _scene.visible
        anchors.centerIn: parent.Center
        focus: true
        x: parent.width/2-width/2; y: parent.height-50;
        function gobullet(){
            entityManager.createEntityFromComponent(planer.planebullet)
        }

        Component{
            id:_enemy
            Enemy{
                id:enemy
                function enemyfire(){
                    entityManager.createEntityFromComponent(enemy.enemybullet)
                }
            }
        }
    }

    PhysicsWorld {
        id: world
        updatesPerSecondForPhysics: 60
    }

    Level{
        id:_level
    }


    Timer {
        id: t1
        running: _scene.visible
        repeat: true
        interval: 2100
        onTriggered: {
            _entityManager.createEntityFromComponent(_enemy)
        }

    }
}
