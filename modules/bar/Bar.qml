import QtQuick
// import QtQuick.Effects
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import qs.configs as Configs
import "components"


PanelWindow {
    id: barRoot

    property bool isDarkMode: true
    property int activeWorkspaceId: Hyprland.focusedMonitor?.activeWorkspace?.id ?? 1

    anchors { top: true; left: true; right: true }

    implicitHeight: Configs.Appearance.barBgHeight
    exclusiveZone: Configs.Appearance.barBgHeight
    color: "transparent"

    // Rectangle {
    //     id: debugBG
    //     anchors.fill: parent
    //     color: Configs.Color.testColors
    // }

    // Rectangle {
    //     id: debugRowLayout
    //     anchors.fill: leftElements
    //     color: "transparent"
    // }

    // Left Side Elements: Hub, Workspaces
    RowLayout {
        id: leftElements

        anchors.top: parent.top
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.topMargin: Configs.Appearance.barElementsTopMargin
        anchors.leftMargin: Configs.Appearance.barElementsSideMargin
        spacing: Configs.Appearance.barElementsSpacing

        // Hub
        Hub {
            isDarkMode: barRoot.isDarkMode

            onDarkModeToggleRequest: {
                barRoot.isDarkMode = !barRoot.isDarkMode
            }
        }

        // Workspaces
        Workspaces {
            isDarkMode: barRoot.isDarkMode
            activeWorkspaceId: barRoot.activeWorkspaceId
        }


        Text {
            text: barRoot.isDarkMode ? "Dark Mode" : "Light Mode"
        }

        // Hardware Stats

        // Package List

    }




    //     // Center Elements
    //     RowLayout {
    //         id: centerButtons

    //         anchors.verticalCenter: barBackground.verticalCenter
    //         anchors.horizontalCenter: barBackground.horizontalCenter
    //         spacing: AppearanceConfig.bar_element_spacing

    //         // Media Play Panel

    //     }

    //     // Right Side Elements
    //     RowLayout {
    //         id: rightButtons

    //         anchors.verticalCenter: barBackground.verticalCenter
    //         anchors.right: barBackground.right
    //         anchors.rightMargin: AppearanceConfig.bar_element_margin
    //         spacing: AppearanceConfig.bar_element_spacing

    //         // Package List

    //         // Network Panel

    //         // Bluetooth Panel

    //         // Battery

    //         // Volume Panel

    //         // Clock/Time
    //         // Clock {
    //         // screen: barRoot.modelData
    //         // }

    //         // System Tray

    //         // Notifications
    //     }
    // }
}