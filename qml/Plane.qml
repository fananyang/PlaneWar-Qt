import QtQuick 2.15
import QtQuick.Controls 2.15
import Felgo 4.0

EntityBase {
    property alias playerplane:_playerplane
    id: _playerplane
    entityType: "Plane"
    signal gameover()

    property int helth:1000
    property int defenses:800

    focus: true


    Image {
        id: _image
        source: Qt.resolvedUrl("../assets/img/blue_plane.png")
        anchors.centerIn: parent
        width: 50
        height: 50
    }
    Text {
        id: t
        text: qsTr("i am Plane")
    }

    BoxCollider{
        id:_playercntroller
        width: _image.width
        height: _image.height
        anchors.centerIn: _image

        fixedRotation: true

        fixture.onBeginContact: {
            var collderbody = other.getBody();
            var collidedPlane =collderbody.target;
            if(collidedPlane.entityType === "enemy"){
                helth=helth-collidedPlane.boom
            }

        }
    }

    onHelthChanged: {
        if(helth>=0){
            _image.visible=false;
            gameover();
        }
    }
//    Keys.onPressed: (event)=>{
//                        if(event.key === Qt.Key_A){
//                            _playerplane.x-=12;
//                        }
//                        if(event.key === Qt.Key_D){
//                            _playerplane.x+=12;
//                        }
//                        if(event.key === Qt.Key_W){
//                            _playerplane.y-=12;
//                        }
//                        if(event.key === Qt.Key_S){
//                            _playerplane.y+=12;
//                        }
//                    }
}
