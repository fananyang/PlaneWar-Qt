function addmoster(){

    score++
    _manger.createEntityFromUrlWithProperties(Qt.resolvedUrl("./Entities/Enemy.qml"), {"y": parent.y+20,"entityId":score+"a"})
}

function addmoster2(){

    score++
    _manger.createEntityFromUrlWithProperties(Qt.resolvedUrl("./Entities/Enemy01.qml"), {"y": parent.y+20,"entityId":score+"b"})
}
function addmoster3(){

    score++
    _manger.createEntityFromUrlWithProperties(Qt.resolvedUrl("./Entities/Enemy02.qml"), {"y": parent.y+20,"entityId":score+"g"})
}


function addHero_bulletProps(){
    _manger.createEntityFromUrlWithProperties(Qt.resolvedUrl("./Entities/Hero_bullet_props.qml"),{"y":parent.y+2,"entityId":score+"c"})
}

function addHelthProps(){
    _manger.createEntityFromUrlWithProperties(Qt.resolvedUrl("./Entities/Helth_props.qml"),{"y":parent.y+5,"entityId":score+"d"})
}

function addDefenseProps(){
    _manger.createEntityFromUrlWithProperties(Qt.resolvedUrl("./Entities/Defense_props.qml"),{"y":parent.y+20,"entityId":score+"e"})
}
function addRocketProps(){
    _manger.createEntityFromUrlWithProperties(Qt.resolvedUrl("./Entities/Rocket_props.qml"),{"y":parent.y+15,"entityId":score+"f"})

}
