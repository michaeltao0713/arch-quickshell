import "../popouts"
import qs.config
import qs.services
import QtQuick
import Quickshell

Rectangle {
    id: clockElement

    required property ShellScreen screen

    width: 98
    height: AppearanceConfig.bar_element_height
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
        cursorShape: Qt.PointingHandCursor
        onClicked: function() {
            timePopout.visible = !timePopout.visible
        }
    }

    TimePopout {
        id: timePopout
        screen: clockElement.screen
        visible: false
    }
}