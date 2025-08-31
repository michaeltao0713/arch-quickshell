import qs.config
import qs.services
import QtQuick

Rectangle {

    width: 98
    height: 24
    radius: 8

    color: ColorConfig.bar_accent

    Rectangle {

        anchors {
            top: parent.top
            right: parent.right
            bottom: parent.bottom
        }

        width: 74
        radius: 8

        color: ColorConfig.bar_element

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter

            color: ColorConfig.bar_text

            text: Time.format("hh:mm A")
        }

        // Extremely scuffed rectangle for the overriding corner rounding
        Rectangle {
            anchors {
                top: parent.top
                left: parent.left
                bottom: parent.bottom
            }
            width: 8
            color: ColorConfig.bar_element
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            // Handle click event
            console.log("Clock clicked");
        }
    }
}