import "components"
import QtQuick
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

    margins {
        top: 2
        left: 20
        right: 20
    }

    // Rectangle shape for the Bar
    Rectangle {
        id: barBackground

        color: Qt.rgba(0, 0, 0, 0.5)
        // color: "white"
        radius: 10

        anchors.fill:parent

        border {
            color: Qt.rgba(0, 0, 0, 0.2)
            // color: "blue"
            width: 5
        }
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
