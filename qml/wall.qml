import QtQuick 2.0
import Felgo 4.0

EntityBase {
    id: entity
     entityType: "wall"

    //定义实体的物理碰撞器
    BoxCollider {
        id: boxCollider
       bodyType: Body.Static
   }

    Rectangle {
        anchors.fill: parent
        color: "brown"
        visible: false
    }
}
