import Felgo 4.0
import QtQuick 2.0
import QtQuick.Controls 2.0

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
                // the "logical size" - the scene content is auto-scaled to match the GameWindow size
                width: 640
                height: 960
        Plane{
            id:planer
            anchors.centerIn: parent.Center
            focus: true
            x: parent.width/2-width/2; y: parent.height-50;

        }

            Enemy{
                id:enemty
            }

}
}
