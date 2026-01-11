import QtQuick
import QtQuick.Layouts
import qs.configs as Configs

Rectangle {
    id: hubRoot

    Layout.preferredHeight: Configs.Appearance.barElementsHeight
    Layout.preferredWidth: Layout.preferredHeight
    Layout.alignment: Qt.AlignVCenter
    color: Configs.Color.barElementBg
    radius: Configs.Appearance.barElementRadius
    scale: hubPress.pressed ? Configs.Appearance.barElementsClickScale : 1
    
    Behavior on scale { NumberAnimation { duration: Configs.Appearance.barElementsDuration; easing.type: Easing.OutBack; easing.overshoot: Configs.Appearance.barElementsOvershoot } }
    
    HoverHandler { id: hubHover }

    Text {
        anchors.centerIn: parent
        text: ""
        font.family: Configs.Appearance.barIconFontFamily
        font.pixelSize: Configs.Appearance.barIconFontSize
        color: Configs.Settings.isDarkMode ? "#89b4fa" : "#1e66f5"
        scale: hubHover.hovered ? Configs.Appearance.barElementsHoverScale : 1
        rotation: hubHover.hovered ? Configs.Appearance.barElementsHoverRotation : 0

        Behavior on scale { NumberAnimation { duration: Configs.Appearance.barElementsDuration; easing.type: Easing.OutBack; easing.overshoot: Configs.Appearance.barElementsOvershoot } }
        Behavior on rotation { NumberAnimation { duration: Configs.Appearance.barElementsDuration; easing.type: Easing.OutBack; easing.overshoot: Configs.Appearance.barElementsOvershoot } }
    }

    MouseArea {
        id: hubPress

        anchors.fill: parent
        hoverEnabled: true
        acceptedButtons: Qt.LeftButton | Qt.RightButton
        onClicked: (mouse) => {
            if (mouse.button === Qt.LeftButton) {
                // TODO: Open the hub panel
            } else if (mouse.button === Qt.RightButton) {
                Configs.Settings.isDarkMode = !Configs.Settings.isDarkMode
                // TODO: Script to toggle system-wide dark mode
            }
        }
    }
}