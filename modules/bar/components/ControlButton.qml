import qs.services
import QtQuick

Rectangle {

    width: 60
    height: 24
    radius: 3

    color: "light blue"
    // border.color: "black"
    // border.width: 2

    Text {
        id: text

        color: "white"

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        text: Time.format("hh:mm A")

        // font.pointSize: Appearance.font.size.smaller
        // font.family: Appearance.font.family.mono
        // color: root.colour
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            // Open the control panel thing
        }
    }
}