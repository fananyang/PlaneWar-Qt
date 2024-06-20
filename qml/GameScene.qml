import QtQuick
import Felgo
import QtQuick.Controls
import "./Entities"
//import "common"

// EMPTY SCENE

//Scene {
//    id: scene
//    //    width: background.picture.width
//    //    height: background.picture.height
//    anchors.fill: parent

//    //background
//    Background {
//        anchors.fill: parent
//        id: background;
//        anchors.horizontalCenter: parent.horizontalCenter;
//        Component.onCompleted: {
//            bgswitch(5)
//        }
//    }
//}




Scene{
    id:_playscene
    EntityManager {
        id: entityManager
        entityContainer: scene
    }
    Rectangle{
        anchors.fill: parent
        color: "gray"
    }
    Scene{
        id: scene
        focus: true
        Keys.forwardTo: planer.twoAxisController

        width: 640
        height: 960
        Background{
            id:_map
            anchors.fill: parent
        }

        Plane {
            id:planer
            visible: _playscene.visible
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
            //            MenuScene{
            //                id : menuscene
            //            }
        }

    }

    Timer {
        id: t1
        running: _playscene.visible
        repeat: true
        interval: 2100
        onTriggered: {
            entityManager.createEntityFromComponent(_enemy)
        }

    }
//    Props {
//        id:_props
//        visible: _playscene.visible
//        anchors.centerIn: parent.Center
//        focus: true
//        x: parent.width/2-width/2; y: parent.height-50;
        Component{
        id:props
        Exp_prop{
            id:prop
//            function createprops(){
//                entityManager.createEntityFromComponent(_props.propsImage)
//                }
//            }
        }
    }
    Timer {
        id: t2
        running: _playscene.visible
        repeat: true
        interval: 1200
        onTriggered: {
            entityManager.createEntityFromComponent(props)
        }

    }
}
