import qs.config
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland

RowLayout {
    spacing: 5

    Repeater {
        model: Hyprland.workspaces
        Rectangle {
            width: 32
            height: 24
            color: modelData.active ? ColorConfig.bar_accent : ColorConfig.bar_element
            radius: 3
            // border.color: "black"
            // border.width: 2

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    onClicked: modelData.activate()
                }
            }

            Text {
                text: modelData.id
                color: modelData.active ? "white" : "white"
                anchors.centerIn: parent

                font.pixelSize: 12
                font.family: "Inter, sans-serif"
            }
        }
    }
}