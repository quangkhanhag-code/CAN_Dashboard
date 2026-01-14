import QtQuick
Rectangle
{
    id:root
    anchors.fill: parent
    color: "black"
    Text
    {
        id: title
        width: root.width
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        font.pixelSize: 30
        color: "white"
        font.bold: true
        wrapMode: Text.WordWrap
        text: "DAY LA CHO DE HIEN THI CAN FRAME KHI BI LOI"
    }
}
