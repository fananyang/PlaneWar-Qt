import QtQuick 2.15
import QtQuick.Controls 2.15
import Felgo 4.0


EntityBase {

    id: _playerplane
    entityType: "Plane"


    property alias inputActionsToKeyCode: _twoAxisController.inputActionsToKeyCode
    property int helth:1000
    property int defenses:800
    property alias controller: _twoAxisController

    focus: true


    MultiResolutionImage {
        id: _planeimage
        source: Qt.resolvedUrl("../../assets/img/blue_plane.png")
        anchors.centerIn: parent
        width: 75
        height: 55
    }

    BoxCollider{
        id:_planecntroller
        width: _planeimage.width
        height: _planeimage.height
        anchors.centerIn: _planeimage

        fixedRotation: true

        fixture.onBeginContact: {
            var collderbody = other.getBody();
            var collidedPlane =collderbody.target;

//            if(collidedPlane.entityType === "enemy"){
//                helth--;
//            }
            if(collidedPlane.entityType === "Enemy_bullet"){
                helth--;
            }


        }
        force: Qt.point(_twoAxisController.yAxis*8000, 0)
        torque: _twoAxisController.xAxis*2000
    }

    onHelthChanged: {
        if(helth>=0){
            _planeimage.visible=false;
        }
    }


    TwoAxisController {
        id: _twoAxisController
        inputActionsToKeyCode: handleInputAction(actionName)/*{
            "up": Qt.Key_W,
            "down": Qt.Key_S,
            "left": Qt.Key_A,
            "right": Qt.Key_D,
            "fire": Qt.Key_Space
        }*/

//        onInputActionPressed: {
//            if(actionName === "fire"){
//                //_bullettofire.start()
//                gobullet();
//            }
//            if(actionName === "up"){
//                _playerplane.y-=15;
//            }
//            if(actionName === "down"){
//                _playerplane.y+=15;
//            }
//            if(actionName === "left"){
//                _playerplane.x-=15;
//            }
//            if(actionName === "right"){
//                _playerplane.x+=15;
//            }

//        }

    }

    function handleInputAction(action) {
        if( action === "fire") {
            // x&y of this component are 0..
            console.debug("creating weapon at current position x", plane.x, "y", plane.y)
            console.debug("image.imagePoints[0].x:", image.imagePoints[0].x, ", image.imagePoints[0].y:", image.imagePoints[0].y)
            //collisionSound.play()
            // this is the point that we defined in Car.qml for the rocket to spawn
            var imagePointInWorldCoordinates = mapToItem(level,image.imagePoints[0].x, image.imagePoints[0].y)
            console.debug("imagePointInWorldCoordinates x", imagePointInWorldCoordinates.x, " y:", imagePointInWorldCoordinates.y)

            // create the rocket at the specified position with the rotation of the car that fires it
            entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("Rocket.qml"), {"x": imagePointInWorldCoordinates.x-15, "y": imagePointInWorldCoordinates.y, "rotation": plane.rotation})

            entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("Rocket.qml"), {"x": imagePointInWorldCoordinates.x+15, "y": imagePointInWorldCoordinates.y, "rotation": plane.rotation})
        }
    }

}
