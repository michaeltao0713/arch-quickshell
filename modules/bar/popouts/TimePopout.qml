import qs.config
import QtQuick
import Quickshell

PanelWindow {
    id: timePopout

    anchors {
        top: true
        right: true
    }

    margins {
        top: 50
        right: 10
    }

    implicitWidth: 400
    implicitHeight: 400

    color: "transparent"
    visible: false

    exclusionMode: ExclusionMode.Ignore

    // mask: Region { item: popoutBackground }

    // Rectangle shape for the Bar
    Rectangle {
        id: popoutBackground

        color: ColorConfig.bg_primary
        radius: 10

        border.color: ColorConfig.bg_border
        border.width: 2

        anchors.fill: parent

        MouseArea {
            anchors.fill: parent
            onClicked: function() {
                timePopout.visible = false;
                console.log("Hiding time popout");
            }
        }
    }
}