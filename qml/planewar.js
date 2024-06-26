function addmoster(){

    score++
    _manger.createEntityFromUrlWithProperties(Qt.resolvedUrl("./Entities/Enemy.qml"), {"y": parent.y+20})
}

function addmoster2(){

    score++
    _manger.createEntityFromUrlWithProperties(Qt.resolvedUrl("./Entities/Enemy01.qml"), {"y": parent.y+20})
}


function addHero_bulletProps(){
    _manger.createEntityFromUrlWithProperties(Qt.resolvedUrl("./Entities/Hero_bullet_props.qml"),{"y":parent.y+2})
}

function addHelthProps(){
    _manger.createEntityFromUrlWithProperties(Qt.resolvedUrl("./Entities/Helth_props.qml"),{"y":parent.y+5})
}

function addDefenseProps(){
    _manger.createEntityFromUrlWithProperties(Qt.resolvedUrl("./Entities/Defense_props.qml"),{"y":parent.y+20})
}
function addRocketProps(){
    _manger.createEntityFromUrlWithProperties(Qt.resolvedUrl("./Entities/Rocket_props.qml"),{"y":parent.y+15})

}
