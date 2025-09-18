import "components"
import qs.config
import QtQuick
import QtQuick.Effects
import QtQuick.Layouts
import Quickshell

PanelWindow {
    id: root

    required property ShellScreen modelData

    screen: modelData

    implicitHeight: AppearanceConfig.bar_bg_height
    color: "transparent"

    anchors {
        top: true
        left: true
        right: true
    }

    RectangularShadow {
        anchors.fill: barBackground
        radius: barBackground.radius
        blur: 3
        spread: 4
        color: ColorConfig.bar_shadow
    }

    // Rectangle shape for the Bar
    Rectangle {
        id: barBackground

        color: ColorConfig.bar_base
        radius: AppearanceConfig.bar_radius

        anchors.centerIn: parent
        width: parent.width - AppearanceConfig.between_bar_and_screen_hori
        height: parent.height - AppearanceConfig.between_bar_and_screen_vert
    }

    // Left Side Elements
    RowLayout {
        id: leftButtons

        anchors.verticalCenter: barBackground.verticalCenter
        anchors.left: barBackground.left
        anchors.leftMargin: AppearanceConfig.bar_element_margin
        spacing: AppearanceConfig.bar_element_spacing

        // Control Panel
        // ControlButton {}

        // Workspaces
        Workspaces {}

        // Hardware Stats

        // Package List
    
    }

    // Center Elements
    RowLayout {
        id: centerButtons

        anchors.verticalCenter: barBackground.verticalCenter
        anchors.horizontalCenter: barBackground.horizontalCenter
        spacing: AppearanceConfig.bar_element_spacing

        // Media Play Panel

    }

    // Right Side Elements
    RowLayout {
        id: rightButtons
        
        anchors.verticalCenter: barBackground.verticalCenter
        anchors.right: barBackground.right
        anchors.rightMargin: AppearanceConfig.bar_element_margin
        spacing: AppearanceConfig.bar_element_spacing

        // Network Panel

        // Bluetooth Panel

        // Battery

        // Volume Panel

        // Clock/Time
        Clock {
            screen: root.modelData
            Layout.alignment: Qt.AlignVCenter
        }


        // System Tray

        // Notifications
    }
}
