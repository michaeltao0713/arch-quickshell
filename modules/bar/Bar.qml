import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import qs.configs as Configs
import qs.services as Services
import "components"

PanelWindow {
    id: barRoot

    property var hyCache: Services.Cache {}
    property int activeWsId: Hyprland.focusedMonitor?.activeWorkspace?.id ?? 1

    anchors { top: true; left: true; right: true }
    implicitHeight: Configs.Appearance.barBgHeight
    exclusiveZone: implicitHeight
    color: "transparent"

    // Event Listener + scheduleRebuild
    Connections {
        target: Hyprland
        function onRawEvent(ev) {
            if (!ev || !ev.name) {
                console.log("Invalid Hyprland event received:", ev)
                return
            }

            if (ev.name === "openwindow" || ev.name === "closewindow" ||
                    ev.name === "movewindowv2" || ev.name === "workspacev2" ||
                    ev.name === "activewindowv2" || ev.name === "urgent") {

                // Re-fetch the window list from Hyprland immediately
                Hyprland.refreshToplevels()
                barRoot.hyCache.scheduleRebuild()
            }
        }
    }

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
        Hub {}

        // Workspaces
        Workspaces {
            activeWsId: barRoot.activeWsId
            hyCache: barRoot.hyCache
        }

        // Hardware Stats

        // Package List
    }




    // Center Elements
    // RowLayout {
    //     id: centerButtons

    //     anchors.verticalCenter: barBackground.verticalCenter
    //     anchors.horizontalCenter: barBackground.horizontalCenter
    //     spacing: AppearanceConfig.bar_element_spacing

    //     // Media Play Panel

    // }

    // Right Side Elements
    RowLayout {
        id: rightButtons

        anchors.top: parent.top
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.topMargin: Configs.Appearance.barElementsTopMargin
        anchors.rightMargin: Configs.Appearance.barElementsSideMargin
        spacing: Configs.Appearance.barElementsSpacing

        Text {
            text: Configs.Settings.isDarkMode ? "Dark Mode" : "Light Mode"
        }        

        // Package List

        // Network Panel

        // Bluetooth Panel

        // Battery

        // Volume Panel

        // System Tray

        // Clock
        Clock {}

        // Notifications
    }    
}
