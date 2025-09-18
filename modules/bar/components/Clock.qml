import "../popouts"
import qs.config
import qs.services
import QtQuick
import Quickshell

Rectangle {
    id: clockElement

    required property ShellScreen screen

    width: 130
    height: AppearanceConfig.bar_element_height
    radius: 10

    color: ColorConfig.bar_element

    Rectangle {
        anchors {
            top: parent.top
            left: parent.left
            bottom: parent.bottom
        }
        width: 40
        radius: 10
        color: ColorConfig.bar_accent

        Rectangle {
            anchors {
                top: parent.top
                right: parent.right
                bottom: parent.bottom
            }
            width: 10
            color: parent.color
        }

        Text {
            anchors.centerIn: parent
            text: "󰥔"

            font.pixelSize: 18
        }
    }

    Rectangle {
        anchors {
            top: parent.top
            right: parent.right
            bottom: parent.bottom
        }
        width: 90
        radius: 10
        color: ColorConfig.bar_element

        Rectangle {
            anchors {
                top: parent.top
                left: parent.left
                bottom: parent.bottom
            }
            width: 10
            color: parent.color
        }

        Text {
            anchors.centerIn: parent

            color: ColorConfig.bar_text

            text: Time.format("hh:mm A")

            font.family: "CaskaydiaCove Nerd Font"
            font.pixelSize: 14
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
