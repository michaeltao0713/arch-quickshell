import QtQuick
import QtQuick.Layouts
import qs.configs as Configs
import qs.styled as Styled

Rectangle {
    id: hubRoot

    Layout.alignment: Qt.AlignVCenter
    Layout.preferredHeight: Configs.Appearance.barElementsHeight
    Layout.preferredWidth: Layout.preferredHeight
    radius: Configs.Appearance.barElementRadius
    color: Configs.Color.barElementBg
    scale: hubPress.pressed ? Configs.Appearance.barElementsClickScale : 1

    Behavior on scale {
        NumberAnimation {
            duration: Configs.Appearance.barElementsDuration
            easing.type: Easing.OutBack
            easing.overshoot: Configs.Appearance.barElementsOvershoot
        }
    }

    HoverHandler {
        id: hubHover
    }

    Styled.BarIconText {
        anchors.centerIn: parent
        anchors.horizontalCenterOffset: 1
        text: ""
        font.pointSize: Configs.Appearance.hubIconFontSize
        color: Configs.Settings.isDarkMode ? "#89b4fa" : "#1e66f5"
        scale: hubHover.hovered ? Configs.Appearance.barElementsHoverScale : 1
        rotation: hubHover.hovered ? Configs.Appearance.barElementsHoverRotation : 0
    }

    MouseArea {
        id: hubPress

        anchors.fill: parent
        hoverEnabled: true
        acceptedButtons: Qt.LeftButton | Qt.RightButton
        onClicked: mouse => {
            if (mouse.button === Qt.LeftButton) {
                // TODO: Open the hub panel
            } else if (mouse.button === Qt.RightButton) {
                Configs.Settings.isDarkMode = !Configs.Settings.isDarkMode;
                // TODO: Script to toggle system-wide dark mode
            }
        }
    }
}
