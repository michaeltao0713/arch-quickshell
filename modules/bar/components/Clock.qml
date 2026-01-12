import QtQuick
import QtQuick.Layouts
import qs.configs as Configs
import qs.services as Services
import qs.styled as Styled

Styled.BarRectangle {
    id: clockRoot

    Layout.alignment: Qt.AlignVCenter
    Layout.preferredHeight: Configs.Appearance.barElementsHeight
    Layout.preferredWidth: clockRow.implicitWidth + Configs.Appearance.barElementsMinWidth
    radius: Configs.Appearance.barElementRadius
    color: Configs.Color.barElementBg
    clip: true
    scale: clockPress.pressed ? Configs.Appearance.barElementsClickScale : 1

    RowLayout {
        id: clockRow

        anchors.centerIn: parent
        spacing: 8
        Styled.BarText {
            text: Services.Time.format("ddd, MMM d")
            font.pointSize: 10
        }
        Styled.BarText {
            text: "•"
            font.pointSize: 16
        }
        Styled.BarText {
            text: Services.Time.format("h:mm AP")
            font.weight: 600
        }
    }

    MouseArea {
        id: clockPress

        anchors.fill: parent
        acceptedButtons: Qt.LeftButton
        onClicked: {
            // TODO: Open a calendar popup
        }
    }
}
