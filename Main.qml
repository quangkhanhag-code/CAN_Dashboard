import QtQuick
import QtQuick.Controls
import RealTimeLib 1.0

Window {
    id: root
    visible: true
    width: 900
    height: 500
    color: "#000"

    property real speed: 0
    property real rpm: 0
    // property real temp: 70
    // property real load: 0
    // property real battery: 12.6
    // property bool flag1: false
    // property bool flag2: false
    // FontLoader
    // {
    //     id: carfont
    //     source: "qrc:/assets/font/Inter-VariableFont_opsz,wght.ttf"
    // }

    RealTime
    {
        id: realTime
        Component.onCompleted: {
            startTimer()
        }
    }

    Rectangle
    {
        id: rectSpeed
        width: root.width/3
        height: rectSpeed.width
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
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
        id:rectDisplay
        width: root.width/3
        height: rectDisplay.width
        anchors.left: rectSpeed.right
        anchors.verticalCenter: parent.verticalCenter
        color: "darkblue"
    }

    Rectangle
    {
        id: rectRpm
        width: root.width/3
        height: rectRpm.width
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        DongHoRPM
        {
            id: rpmGause
            width: parent.width
            height: width
            anchors.verticalCenter: parent.verticalCenter
            rpm: root.rpm
        }
    }
    Rectangle
    {
        id: rectDiag
        anchors.bottom: rectSpeed.top
        anchors.top: parent.top
        width: parent.width/2
        x: (parent.width-width)/2
        color: "orange"
    }
    Rectangle
    {
        id: realTimeDisplay
        anchors.left: rectDiag.right
        anchors.right: parent.right
        height: rectDiag.height
        color: "transparent"
        Text {
            id: displayTimer
            text: realTime.datetime
            width: parent.width
            //wrapMode: Text.WorldWrap
            font.family: carfont.name
            font.pixelSize: 25
            color: "white"
            antialiasing: true
            //renderType: Text.NativeRendering
        }
    }

    Rectangle
    {
        id: rectButton
        anchors.top: rectDisplay.bottom
        anchors.bottom: parent.bottom
        width: parent.width/2
        x: (parent.width-width)/2
        color: "red"

    }

    Timer
    {
        interval: 100
        running: true
        repeat: true
        onTriggered:
        {
            root.speed = (root.speed + 1) % 241
            root.rpm = (root.rpm + 50) % 8001

        }
    }
}
