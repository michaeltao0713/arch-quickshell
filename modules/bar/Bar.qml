import "components"
import QtQuick
import QtQuick.Layouts
import Quickshell

PanelWindow {
    required property ShellScreen modelData

    screen: modelData
    color: "transparent"
    implicitHeight: barBackground.height
    anchors.top: true
    anchors.left: true
    anchors.right: true

    visible: true

    // Background rectangle for the bar
    Rectangle {
        id: barBackground
        width: parent.width
        height: 30
        color: "transparent"
        anchors.top: parent.top
        anchors.left: parent.left
    }

    RowLayout {
        id: leftWidgetsRow
        anchors.verticalCenter: barBackground.verticalCenter
        anchors.left: barBackground.left
        anchors.leftMargin: 18
        spacing: 12

        Clock {}
    }
}
