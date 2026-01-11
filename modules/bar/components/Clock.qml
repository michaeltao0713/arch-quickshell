import QtQuick
import QtQuick.Layouts
import qs.configs as Configs
import qs.services as Services
import qs.styled as Styled

Rectangle {
    id: clockRoot

    Layout.alignment: Qt.AlignVCenter
    Layout.preferredHeight: Configs.Appearance.barElementsHeight
    Layout.preferredWidth: clockRow.implicitWidth + Configs.Appearance.barElementsMinWidth
    radius: Configs.Appearance.barElementRadius
    color: Configs.Color.barElementBg
    clip: true
    // scale: clockPress.pressed ? Configs.Appearance.barElementsClickScale : 1

    Behavior on scale { NumberAnimation { duration: Configs.Appearance.barElementsDuration; easing.type: Easing.OutBack; easing.overshoot: Configs.Appearance.barElementsOvershoot } }

    HoverHandler { id: clockHover }

    RowLayout {
        id: clockRow

        anchors.centerIn: parent
        spacing: 8
        Styled.BarText {
            text: Services.Time.format("ddd, MMM d")
            color: Configs.Color.barTextColor
        }
        Styled.BarText {
            text: "•"
            color: Configs.Color.barTextColor
        }
        Styled.BarText {
            text: Services.Time.format("h:mm AP")
            color: Configs.Color.barTextColor
        }
    }
}








//     RowLayout {
//         id: clockRow
//         anchors.centerIn: parent; spacing: 8
//         Text { id: dateText; text: Qt.formatDateTime(new Date(), "ddd, MMM d"); font.family: Theme.textFont; font.pixelSize: 12; font.weight: 600; color: palette.accent }
//         Text { text: "•"; font.pixelSize: 10; color: palette.textSecondary }
//         Text { id: timeText; text: Qt.formatDateTime(new Date(), "h:mm AP"); font.family: Theme.textFont; font.pixelSize: 13; font.weight: 800; color: palette.textPrimary }
//         Timer {
//             interval: 1000; running: true; repeat: true
//             onTriggered: { var now = new Date(); dateText.text = Qt.formatDateTime(now, "ddd, MMM d"); timeText.text = Qt.formatDateTime(now, "h:mm AP") }
//         }
//     }
//     Rectangle { id: clockMask; anchors.fill: parent; radius: 17; visible: false }
//     Item {
//         anchors.fill: parent
//         layer.enabled: true; layer.smooth: true; layer.effect: OpacityMask { maskSource: clockMask }
//         Rectangle {
//             id: clockShimmer
//             width: 44; height: parent.height * 2; rotation: 20
//             x: -100; y: -parent.height/2
//             color: "transparent"
//             gradient: Gradient {
//                 GradientStop { position: 0.0; color: "transparent" }
//                 GradientStop { position: 0.5; color: win.isDarkMode ? Qt.rgba(1,1,1,0.20) : Qt.rgba(0,0,0,0.1) }
//                 GradientStop { position: 1.0; color: "transparent" }
//             }
//         }
//     }
//     NumberAnimation { id: clockShimmerAnim; target: clockShimmer; property: "x"; from: -60; to: clockRect.width + 60; duration: 800; easing.type: Easing.InOutQuad }
//     MouseArea {
//         id: clockArea
//         anchors.fill: parent; hoverEnabled: true
//         onPressed: (mouse) => { win.requestHubToggle(); mouse.accepted = true }
//         onEntered: clockShimmerAnim.restart()
//     }
//     Rectangle {
//         anchors.fill: parent; radius: 17
//         color: win.isDarkMode ? "#ffffff" : "#000000"
//         opacity: clockArea.pressed ? 0.18 : (clockArea.containsMouse ? 0.12 : 0.0)
//         Behavior on opacity { NumberAnimation { duration: 120; easing.type: Easing.OutCubic } }
//     }
//     Rectangle { anchors.fill: parent; radius: 17; color: "transparent"; border.width: 0 }
// }