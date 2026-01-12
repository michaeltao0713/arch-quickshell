import QtQuick
import QtQuick.Layouts
import qs.configs as Configs
import qs.styled as Styled

Styled.BarRectangle {
    id: hubRoot

    Layout.alignment: Qt.AlignVCenter
    Layout.preferredHeight: Configs.Appearance.barElementsHeight
    Layout.preferredWidth: Layout.preferredHeight
    radius: Configs.Appearance.barElementRadius
    color: Configs.Color.barElementBg
    scale: hubPress.pressed ? Configs.Appearance.barElementsClickScale : 1

    HoverHandler {
        id: hubHover
    }

    Styled.BarIconText {
        anchors.centerIn: parent
        anchors.horizontalCenterOffset: 1
        text: ""
        font.pointSize: Configs.Appearance.hubIconFontSize
        color: Configs.Color.hubIconColor
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
