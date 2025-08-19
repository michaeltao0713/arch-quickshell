import qs.services
import QtQuick

// Column {
//     id: root

    // property color colour: Colours.palette.m3tertiary

    // spacing: Appearance.spacing.small

    // MaterialIcon {
    //     id: icon

    //     text: "calendar_month"
    //     color: root.colour

    //     anchors.horizontalCenter: parent.horizontalCenter
    // }

    Text {
        id: text

        // anchors.horizontalCenter: parent.horizontalCenter

        // horizontalAlignment: StyledText.AlignHCenter
        text: Time.format("hh:mm A")
        // font.pointSize: Appearance.font.size.smaller
        // font.family: Appearance.font.family.mono
        // color: root.colour
    }
// }