import "components"
import qs.config
import QtQuick
import QtQuick.Effects
import QtQuick.Layouts
import Quickshell

PanelWindow {
    required property ShellScreen modelData

    screen: modelData

    visible: true

    implicitHeight: 50
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
        // color: "light blue"
        radius: 8

        // anchors.fill: parent
        anchors.centerIn: parent
        width: parent.width - 100
        height: parent.height - 16
    }



    // Buttons aligned to the left of the Bar
    RowLayout {
        id: leftButtons

        anchors.verticalCenter: barBackground.verticalCenter
        anchors.left: barBackground.left
        anchors.leftMargin: 16
        spacing: 10

        // Control Panel
        ControlButton {}

        // Workspaces
        Workspaces {}

        // Hardware Stats

        // Package List
    
    }

    // Buttons aligned to the center of the Bar
    RowLayout {
        id: centerButtons

        anchors.verticalCenter: barBackground.verticalCenter
        anchors.horizontalCenter: barBackground.horizontalCenter
        spacing: 10

        // Media Play Panel

    }


    // Buttons aligned to the right of the Bar
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
