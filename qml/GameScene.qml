import QtQuick
import Felgo
import QtQuick.Controls
import "Entities"
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


//    anchors.fill: parent            //hei ping

    EntityManager {
        id: entityManager
        entityContainer: level
    }

    Background{
//        width: 640
//        height: 1080              //useless
        id : _bg
//        anchors.fill: parent              //useless
        anchors.horizontalCenter: parent.horizontalCenter;  //xiao guo tong xia
//        x:parent.width/2
//        y: parent.height/2            useless
    }

    Plane{
        id :plane
        x:parent.width/2
        y:parent.height-50
    }

    PhysicsWorld{
        id :physicworld
        updatesPerSecondForPhysics: 60
    }

    Level{
        id : level
    }

}
