import QtQuick
import QtQuick.Controls

Window {
    id: root
    visible: true
    width: 900
    height: 500
    color: "#000"

    property real speed: 0
    property real rpm: 0
    property real temp: 70
    property real load: 0
    property real battery: 12.6
    property bool flag1: false
    property bool flag2: false

    Rectangle
    {
        id: rectSpeed
        height: root.height
        width: root.width/3
        anchors.left: parent.left
        color: "lightblue"
        DongHoTocDo
        {
            id: speedGause
            width: parent.width
            height: width
            anchors.verticalCenter: parent.verticalCenter
            speed: root.speed
        }
    }
    Rectangle
    {
        id:rectControl
        height: root.height
        width: root.width/3
        anchors.left: rectSpeed.right
        color: "darkblue"
    }

    Rectangle
    {
        id: rectRpm
        height: root.height
        width: root.width/3
        anchors.right: parent.right
    }
    ?
}
