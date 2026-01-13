import QtQuick
import QtQuick.Controls
Item {
    property real progress: 0
    property real radiusprogress: 0
    //signal progressClick (real value)
    Rectangle {
        id: progressBarBackground
        anchors.fill: parent
        color: "gray"
        radius: radiusprogress
        Rectangle {
            id: progressBarFill
            width: parent.width * progress
            height: parent.height
            color: "green"
            radius: radiusprogress
            Behavior on width {
                NumberAnimation {
                    duration: 300
                    easing.type: Easing.Linear
                }
            }
        }
        // MouseArea {
        //     anchors.fill: progressBarBackground
        //     enabled: true
        //     onClicked: {
        //         let newProgress= mouse.x / progressBarBackground.width
        //         progressClick(newProgress)
        //     }
        // }
    }
}
