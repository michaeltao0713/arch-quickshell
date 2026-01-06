import "../popouts"
import qs.config
import qs.services
import QtQuick
import Quickshell

Rectangle {
    id: clockElement

    required property ShellScreen screen

    width: AppearanceConfig.clock_width
    height: AppearanceConfig.bar_element_height
    radius: AppearanceConfig.bar_element_radius
    color: ColorConfig.bar_element

    Rectangle {
        anchors {
            top: parent.top
            left: parent.left
            bottom: parent.bottom
        }
        width: AppearanceConfig.bar_icon_width
        radius: AppearanceConfig.bar_element_radius
        color: ColorConfig.bar_accent

        Rectangle {
            anchors {
                top: parent.top
                right: parent.right
                bottom: parent.bottom
            }
            width: AppearanceConfig.straight_rectangle_width
            color: parent.color
        }

        Text {
            anchors.centerIn: parent
            text: "󰥔"
            font.pixelSize: AppearanceConfig.bar_icon_font_size
        }
    }

    Rectangle {
        anchors {
            top: parent.top
            right: parent.right
            bottom: parent.bottom
        }
        width: AppearanceConfig.clock_width - AppearanceConfig.bar_icon_width
        radius: AppearanceConfig.bar_element_radius
        color: ColorConfig.bar_element

        Rectangle {
            anchors {
                top: parent.top
                left: parent.left
                bottom: parent.bottom
            }
            width: AppearanceConfig.straight_rectangle_width
            color: parent.color
        }

        Text {
            anchors.centerIn: parent
            text: Time.format("hh:mm A")
            font.family: AppearanceConfig.bar_element_font_family
            font.pixelSize: AppearanceConfig.bar_element_font_size
            color: ColorConfig.bar_text
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
