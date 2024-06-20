import QtQuick 2.15
import QtQuick.Controls 2.15
import Felgo 4.0


EntityBase {
    property alias playerplane:_playerplane
    property alias twoAxisController:_twoAxisController
    property alias planebullet:_planebullet

    id: _playerplane
    entityType: "Plane"
    signal gameover()

    property int helth:1000
    property int defenses:800

    focus: true


    Image {
        id: _image
        source: Qt.resolvedUrl("../../assets/img/blue_plane.png")
        anchors.centerIn: parent
        width: 50
        height: 50
    }
//    Text {
//        id: t
//        text: qsTr("i am Plane")
//    }

    BoxCollider{
        id:_playercntroller
        width: _image.width
        height: _image.height
        anchors.centerIn: _image
        collisionTestingOnlyMode: true

        fixedRotation: true

        fixture.onBeginContact: {
            var collderbody = other.getBody();
            var collidedPlane =collderbody.target;
            if(collidedPlane.entityType === "enemy"){
                helth=helth-collidedPlane.boom
            }

        }
        force: Qt.point(_twoAxisController.yAxis*8000, 0)
        torque: _twoAxisController.xAxis*2000
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


    TwoAxisController {
        id: _twoAxisController
        inputActionsToKeyCode: {
                "up": Qt.Key_W,
                "down": Qt.Key_S,
                "left": Qt.Key_A,
                "right": Qt.Key_D,
                "fire": Qt.Key_Space
            }

        onInputActionPressed: {
          if(actionName === "fire"){
              //_bullettofire.start()
              gobullet();
          }
          if(actionName === "up"){
              _playerplane.y-=15;
          }
          if(actionName === "down"){
              _playerplane.y+=15;
          }
          if(actionName === "left"){
              _playerplane.x-=15;
          }
          if(actionName === "right"){
              _playerplane.x+=15;
          }

        }

    }

//    Timer{
//        id:_bullettofire
//        running: false
//        interval: 300
//        repeat: true
//        onTriggered: {
//            console.log("player fire")
//            gobullet();
//        }
//    }

     Component{
         id:_planebullet
         Hero_bullet{
             id:planebull
             x:_playerplane.x
             y:_playerplane.y
             visible: _playerplane.visible
             NumberAnimation on y {
                     id: y
                     to: -1
                     duration: 5000

                 }
         }
     }


}
