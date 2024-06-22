import QtQuick 2.0
import Felgo 4.0
import QtQuick.Controls 2.0

EntityBase {
    id: car
    // the enityId should be set by the level file!
    entityType: "Plane"

    property int helth:10
    //    property int defenses:800
//    signal gameOver
//    signal gamewin()

    property alias inputActionsToKeyCode: twoAxisController.inputActionsToKeyCode
    property alias image: image

    // gets accessed to insert the input when touching the HUDController
    property alias controller: twoAxisController

    readonly property real forwardForce: 8000 * world.pixelsPerMeter

    Component.onCompleted: {
        console.debug("car.onCompleted()")
        console.debug("car.x:", x)
        var mapped = mapToItem(world.debugDraw, x, y)
        console.debug("car.x world:", mapped.x)
    }

    Image {
        id: image
        source: Qt.resolvedUrl("../../assets/img/blue_plane.png")

        anchors.centerIn: parent
        width: boxCollider.width
        height: boxCollider.height

        property list<Item> imagePoints: [
            // this imagePoint can be used for creation of the rocket
            // it must be far enough in front of the car that they don't collide upon creation
            // the +30 might have to be adapted if the size of the rocket is changed
            Item {x: image.width/2+30}
        ]

    }

    // this is used as input for the BoxCollider force & torque properties
    TwoAxisController {
        id: twoAxisController

        // call the logic function when an input press (possibly the fire event) is received
        onInputActionPressed: actionName => handleInputAction(actionName)
    }

    BoxCollider {
        id: boxCollider

        // the image and the physics will use this size; this is important as it specifies the mass of the body! it is in respect to the world size
        width: 60
        height: 40

        anchors.centerIn: parent

        //    collisionTestingOnlyMode: true

        density: 0.02
        friction: 0.35
        restitution: 0.5
        body.bullet: true
        body.linearDamping: 10
        body.angularDamping: 15
        fixedRotation: true

        //fixedRotation: true

        // this is applied every physics update tick
        force: Qt.point(twoAxisController.yAxis*forwardForce+800, twoAxisController.xAxis*forwardForce+1000)//move speed
        torque: twoAxisController.xAxis*2000 * world.pixelsPerMeter * world.pixelsPerMeter

        Component.onCompleted: {
            console.debug("car.physics.x:", x)
            var mapped = mapToItem(world.debugDraw, x, y)
            console.debug("car.physics.x world:", mapped.x)
        }

        fixture.onBeginContact: (other, contactNormal) => {
                                    var fixture = other;
                                    var body = other.getBody();
                                    var component = other.getBody().target;
                                    var collidingType = component.entityType;


                                    if(collidingType ==="Enemy_bullet"){
                                        car.helth --;
                                    }
                                    if(collidingType === "Enemy"){
                                        car.helth-=component.boom
                                    }
                                    if(collidingType ==="Helth_props"){
                                        helth+=getRandomFloat(-5,10);
                                    }

                                    //var
                                    console.debug("car contact with: ", other, body, component)
                                    console.debug("car collided entity type:", collidingType)

                                    console.debug("car contactNormal:", contactNormal, "x:", contactNormal.x, "y:", contactNormal.y)

                                }
    }

    function handleInputAction(action) {
        if( action === "fire") {
            var imagePointInWorldCoordinates = mapToItem(level,image.imagePoints[0].x, image.imagePoints[0].y)
            console.debug("imagePointInWorldCoordinates x", imagePointInWorldCoordinates.x, " y:", imagePointInWorldCoordinates.y)

            // create the rocket at the specified position with the rotation of the car that fires it
            _manger.createEntityFromUrlWithProperties(Qt.resolvedUrl("Hero_bullet.qml"), {"x": imagePointInWorldCoordinates.x-70, "y": imagePointInWorldCoordinates.y-50, "rotation": car.rotation+270})
            _manger.createEntityFromUrlWithProperties(Qt.resolvedUrl("Hero_bullet.qml"), {"x": imagePointInWorldCoordinates.x-40, "y": imagePointInWorldCoordinates.y-50, "rotation": car.rotation+270})

        }
    }

    onHelthChanged: {
        console.log("----------------------------------------------->",car.helth);
        if(car.helth <= 0){
            gameFail()
//            image.visible=false
        }
    }



    function getRandomFloat(a, b) {
        // make sure a <= b
        if (a > b) {
            var temp = a;
            a = b;
            b = temp;
        }

        return Math.random() * (b - a) + a;
    }

}
