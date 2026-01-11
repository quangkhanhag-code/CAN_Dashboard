import QtQuick
import QtQuick.Controls
import RealTimeLib 1.0

Window {
    id: root
    visible: true
    width: 900
    height: 500
    color: "#000"

    property real speed: keyArea.gialapspeed
    property real rpm: keyArea.gialaprpm
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
            //font.family: carfont.name
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
    Rectangle
    {
        id: keyArea
        anchors.fill: parent
        color: "transparent"
        focus: true
        property real throttle: 0
        property real gialapspeed: 0
        property real gialaprpm: 500 //500 = chế độ không tải
        property real tisotruyenCVT: 2 //Tỉ số truyền biến thiên giả lập
        Keys.onPressed: (event)=> {
            if (event.key === Qt.Key_Up) throttle =1
            if (event.key === Qt.Key_Down) throttle =0
        }
        Timer
        {
            interval: 16
            running: true
            repeat: true
            onTriggered: {
               // Gia toc
                let engineForce = keyArea.throttle * 400
                    let drag = keyArea.gialapspeed * 3
                    let accel = (engineForce - drag) * 0.002
                    keyArea.gialapspeed += accel
                    if (keyArea.gialapspeed < 0) keyArea.gialapspeed = 0
                // Chuyen so CVT gialap
                    let targetRPM

                        if (keyArea.gialapspeed < 30)
                            targetRPM = 500 + speed * 20
                        else if (keyArea.gialapspeed < 80)
                            targetRPM = 1200
                        else
                            targetRPM = 1200 + (keyArea.gialapspeed - 80) * 15
                // Lam tron gia lap RPM
                keyArea.gialaprpm += (targetRPM - keyArea.gialaprpm) * 0.05
                //CVT tu doi ti so truyen
                keyArea.tisotruyenCVT = keyArea.gialaprpm / (keyArea.gialapspeed + 1)
            }
        }
    }
}
