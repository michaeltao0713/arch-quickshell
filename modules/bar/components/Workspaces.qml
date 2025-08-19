import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland

RowLayout {
    spacing: 2

    Repeater {
        model: Hyprland.workspaces
        Rectangle {
            width: 32
            height: 24
            color: modelData.active ? "light blue" : "grey"
            radius: 3
            // border.color: "black"
            // border.width: 2

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    Hyprland.dispatch("workspaces " + modelData.id)
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