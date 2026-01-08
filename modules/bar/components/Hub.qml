import QtQuick
import QtQuick.Layouts
import qs.configs as Configs

Rectangle {
    id: hubRoot
    
    required property bool isDarkMode
    
    signal darkModeToggleRequest()

    Layout.preferredHeight: Configs.Appearance.barElementsHeight
    Layout.preferredWidth: Layout.preferredHeight
    Layout.alignment: Qt.AlignVCenter
    color: isDarkMode ? Configs.Color.barElementBgDark : Configs.Color.barElementBgLight
    radius: Configs.Appearance.barElementRadius

    scale: hubPress.pressed ? Configs.Appearance.barElementsClickScale : 1
    Behavior on scale { NumberAnimation { duration: Configs.Appearance.barElementsDuration; easing.type: Easing.OutBack; easing.overshoot: Configs.Appearance.barElementsOvershoot } }
    
    HoverHandler { id: hubHover }

    Text {
        anchors.centerIn: parent
        text: ""
        font.family: Configs.Appearance.barIconFontFamily; font.pixelSize: Configs.Appearance.barIconFontSize
        color: hubRoot.isDarkMode ? "#89b4fa" : "#1e66f5"

        scale: hubHover.hovered ? Configs.Appearance.barElementsHoverScale : 1
        Behavior on scale { NumberAnimation { duration: Configs.Appearance.barElementsDuration; easing.type: Easing.OutBack; easing.overshoot: Configs.Appearance.barElementsOvershoot } }
        rotation: hubHover.hovered ? Configs.Appearance.barElementsHoverRotation : 0
        Behavior on rotation { NumberAnimation { duration: Configs.Appearance.barElementsDuration; easing.type: Easing.OutBack; easing.overshoot: Configs.Appearance.barElementsOvershoot } }
    }

    MouseArea {
        id: hubPress

        anchors.fill: parent
        hoverEnabled: true;
        acceptedButtons: Qt.LeftButton | Qt.RightButton
        onClicked: (mouse) => {
            if (mouse.button === Qt.LeftButton) {
                // TODO: Open the hub panel
            } else if (mouse.button === Qt.RightButton) {
                hubRoot.darkModeToggleRequest()
                // TODO: Apply dark mode change system-wide
            }
        }
    }
}