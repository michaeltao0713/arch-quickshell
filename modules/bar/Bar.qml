import "components"
import qs.config
import QtQuick
import QtQuick.Effects
import QtQuick.Layouts
import Quickshell

PanelWindow {
    required property ShellScreen modelData

    screen: modelData

    implicitHeight: 40
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
        radius: 8

        anchors.centerIn: parent
        width: parent.width - 100
        height: parent.height - 10
    }

    // Left Side Elements
    RowLayout {
        id: leftButtons

        anchors.verticalCenter: barBackground.verticalCenter
        anchors.left: barBackground.left
        anchors.leftMargin: 10
        spacing: 10

        // Control Panel
        ControlButton {}

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
        spacing: 10

        // Media Play Panel

    }

    // Right Side Elements
    RowLayout {
        id: rightButtons
        
        anchors.verticalCenter: barBackground.verticalCenter
        anchors.right: barBackground.right
        anchors.rightMargin: 16
        spacing: 10

        // Network Panel

        // Bluetooth Panel

        // Battery

        // Volume Panel

        // Clock/Time
        Clock {}


        // System Tray

        // Notifications
    }

    
}
