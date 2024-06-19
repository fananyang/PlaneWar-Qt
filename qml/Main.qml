import Felgo 4.0
import QtQuick 2.15
import QtQuick.Controls 2.15
import "./Entities"
GameWindow {
    id: gameWindow
    screenWidth: 960
    screenHeight: 640
    activeScene: scene

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
                // the "logical size" - the scene content is auto-scaled to match the GameWindow size
                width: 640
                height: 960
                Image {
                    source:"../assets/img/img_bg_4.jpg";
                    anchors.fill:parent
                }
        Plane {
            id:planer
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

    // You get free licenseKeys from https://felgo.com/licenseKey
    // With a licenseKey you can:
    //  * Publish your games & apps for the app stores
    //  * Remove the Felgo Splash Screen or set a custom one (available with the Pro Licenses)
    //  * Add plugins to monetize, analyze & improve your apps (available with the Pro Licenses)
    //licenseKey: "<generate one from https://felgo.com/licenseKey>"


    // the size of the Window can be changed at runtime by pressing Ctrl (or Cmd on Mac) + the number keys 1-8
    // the content of the logical scene size (480x320 for landscape mode by default) gets scaled to the window size based on the scaleMode
    // you can set this size to any resolution you would like your project to start with, most of the times the one of your main target device
    // this resolution is for iPhone 4 & iPhone 4S
    Timer {
            id: t1
            running: true
            repeat: true
            interval: 3200
            onTriggered: {
                entityManager.createEntityFromComponent(_enemy)
            }

        }
    }


}
