import QtQuick
import QtQuick.Controls
import RealTimeLib 1.0
import QtQuick.Layouts
import QtQuick.Effects

Window {
    id: root
    visible: true
    width: 900
    height: 500
    Image {
        id: backgroundImage
        anchors.fill: parent
        source: "qrc:/image/assets/backgroundTest.jpg"
    }

    property real speed: keyArea.gialapspeed
    property real rpm: keyArea.gialaprpm
    property bool num1: false
    property bool num2: false
    property bool num3: false
    property bool num4: false
    property bool num5: false
    property bool num6: false
    property bool num7: false
    property real progressFuel: 0
    property real progressTemp: 0

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
        anchors.leftMargin: 20
        color: "transparent"
        DongHoTocDo
        {
            id: speedGause
            width: parent.width
            height: width
            anchors.verticalCenter: parent.verticalCenter
            speed: root.speed
            iconSource: "qrc:/image/assets/purple.png"
        }
    }
    Rectangle
    {
        id:rectDisplay
        height: rectDisplay.width
        anchors.left: rectSpeed.right
        anchors.right: rectRpm.left
        anchors.verticalCenter: parent.verticalCenter
        color: "transparent"
        Item {
            id: displayArea
            anchors.bottom: parent.bottom
            height: parent.height*0.8
            width: parent.width
            Image {
                id: carBackView
                source: "qrc:/image/assets/Carbackview2.png"
                anchors.centerIn: parent
                width: parent.width
                height: parent.height
                fillMode: Image.PreserveAspectFit
            }
        }
        Text {
            id: textSpeed
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.bottom: displayArea.top
            anchors.bottomMargin: 10
            font.pixelSize: 60
            color: "white"
            font.bold: true
            text: Math.round(root.speed).toString()
        }
        Text {
            id: textUnit
            text: "km/h"
            anchors.bottom: textSpeed.top
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 20
            color: "gray"
            font.italic: true
        }
        Text {
            id: displayTimer
            text: realTime.datetime
            font.pixelSize: 40
            color: "white"
            antialiasing: true
            anchors.top: displayArea.bottom
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    Rectangle
    {
        id: rectRpm
        width: root.width/3
        height: rectRpm.width
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        anchors.rightMargin: 20
        color: "transparent"
        DongHoRPM
        {
            id: rpmGause
            width: parent.width
            height: width
            anchors.verticalCenter: parent.verticalCenter
            rpm: root.rpm
            iconSource: "qrc:/image/assets/purple.png"
        }
    }
    Rectangle
    {
        id: rectDiag
        anchors.bottom: rectSpeed.top
        anchors.top: parent.top
        width: parent.width/3
        x: (parent.width-width)/2
        color: "transparent"
        RowLayout
        {
            anchors.fill: rectDiag
            spacing: 20
            Item {
                Layout.fillWidth: true
                Layout.preferredHeight: 40
                Image {
                    id: battery
                    source: "qrc:/image/assets/battery1.png"
                    width: 32
                    height: 32
                    anchors.centerIn: parent
                    fillMode: Image.PreserveAspectFit
                    visible: num1
                }
            }
            Item{
                Layout.fillWidth: true
                Layout.preferredHeight: 40
                Image {
                    id: oil
                    source: "qrc:/image/assets/oilpressure1.png"
                    width: 32
                    height: 32
                    anchors.centerIn: parent
                    fillMode: Image.PreserveAspectFit
                    visible: num2
                }
            }
            Item{
                Layout.fillWidth: true
                Layout.preferredHeight: 40
                Image {
                    id: abs
                    source: "qrc:/image/assets/abs1.png"
                    width: 32
                    height: 32
                    anchors.centerIn: parent
                    fillMode: Image.PreserveAspectFit
                    visible: num3
                }
            }
            Item{
                Layout.fillWidth: true
                Layout.preferredHeight: 40
                Image {
                    id: airbag
                    source: "qrc:/image/assets/airbag1.png"
                    width: 32
                    height: 32
                    anchors.centerIn: parent
                    fillMode: Image.PreserveAspectFit
                    visible: num4
                }
            }
            Item{
                Layout.fillWidth: true
                Layout.preferredHeight: 40
                Image {
                    id: brake
                    source: "qrc:/image/assets/brake-system-warning.png"
                    width: 32
                    height: 32
                    anchors.centerIn: parent
                    fillMode: Image.PreserveAspectFit
                    visible: num5
                }
            }
            Item{
                Layout.fillWidth: true
                Layout.preferredHeight:40
                Image {
                    id: engine
                    source: "qrc:/image/assets/engine.png"
                    width: 32
                    height: 32
                    anchors.centerIn: parent
                    fillMode: Image.PreserveAspectFit
                    visible: num6
                }
            }
            Item{
                Layout.fillWidth: true
                Layout.preferredHeight: 40
                Image {
                    id: temperature
                    source: "qrc:/image/assets/temp.png"
                    width: 32
                    height: 32
                    anchors.centerIn: parent
                    fillMode: Image.PreserveAspectFit
                    visible: num7
                }
            }
        }
    }
    Rectangle
    {
        id: rectFuel
        anchors.top: rectSpeed.bottom
        anchors.bottom: parent.bottom
        anchors.right: rectDiag.left
        anchors.left: parent.left
        anchors.leftMargin: 20
        color: "transparent"
        MyProgressBar
        {
            id: fuelBar
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            height: 32
            width: parent.width
            radiusprogress: height/2
            progress: progressFuel
        }
        Image {
            id: fuelImage
            source: "qrc:/image/assets/local_gas_station_24dp_1F1F1F_FILL0_wght400_GRAD0_opsz24.png"
            width: 32
            height: width
            anchors.centerIn: fuelBar
            fillMode: Image.PreserveAspectFit
        }
    }
    Rectangle
    {
        id: rectTemp
        anchors.top: rectRpm.bottom
        anchors.bottom: parent.bottom
        anchors.left: rectDiag.right
        anchors.right: parent.right
        anchors.rightMargin: 20
        color: "transparent"

        MyProgressBar
        {
            id: tempBar
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            height: 32
            width: parent.width
            radiusprogress: height/2
            progress: progressTemp
        }
        Image {
            id: tempImage
            source: "qrc:/image/assets/device_thermostat_24dp_1F1F1F_FILL0_wght400_GRAD0_opsz24.png"
            width: 32
            height: width
            anchors.centerIn: tempBar
            fillMode: Image.PreserveAspectFit
        }
    }
    // Rectangle
    // {
    //     id: realTimeDisplay
    //     anchors.top: rectDisplay.bottom
    //     anchors.bottom: rectButton.top
    //     width: rectDisplay.width
    //     height: rectDisplay.height
    //     color: "transparent"
    //     Text {
    //         id: displayTimer
    //         text: realTime.datetime
    //         font.pixelSize: 40
    //         color: "white"
    //         antialiasing: true
    //         anchors.centerIn: parent
    //     }
    // }

    Rectangle
    {
        id: rectButton
        anchors.top: rectDisplay.bottom
        anchors.bottom: parent.bottom
        width: parent.width/2
        x: (parent.width-width)/2
        color: "transparent"
    }
    Rectangle
    {
        id: keyArea
        anchors.fill: parent
        color: "transparent"
        focus: true
        property real throttle: 0
        property real gialapspeed: 0
        property real gialaprpm: 0
        property real tisotruyenCVT: 2 //Tỉ số truyền biến thiên giả lập
        Component.onCompleted:
        {
            gialaprpm: 500 //500 = chế độ không tải
        }

        Keys.onPressed: (event)=> {
                            if (event.key === Qt.Key_Up) throttle =1
                            if (event.key === Qt.Key_Down) throttle =0
                            if (event.key === Qt.Key_1) num1 = !num1
                            if (event.key === Qt.Key_2) num2 = !num2
                            if (event.key === Qt.Key_3) num3 = !num3
                            if (event.key === Qt.Key_4) num4 = !num4
                            if (event.key === Qt.Key_5) num5 = !num5
                            if (event.key === Qt.Key_6) num6 = !num6
                            if (event.key === Qt.Key_7) num7 = !num7
                            if (event.key === Qt.Key_W) {
                                progressFuel += 0.1
                                if (progressFuel > 1) progressFuel = 1
                            }
                            if (event.key === Qt.Key_S) {
                                progressFuel -= 0.1
                                if (progressFuel <0) progressFuel = 0
                            }
                            if (event.key === Qt.Key_D) {
                                progressTemp += 0.1
                                if (progressTemp > 1) progressTemp = 1
                            }
                            if (event.key === Qt.Key_A) {
                                progressTemp -= 0.1
                                if (progressTemp < 0) progressTemp = 0
                            }
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

