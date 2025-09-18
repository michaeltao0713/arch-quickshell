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
    onVisibleChanged: {
        if (visible) {
            popoutBackground.forceActiveFocus();
        }
    }

    Rectangle {
        id: popoutBorder

        anchors.fill: parent
        gradient: Gradient {
            GradientStop { position: 0.0; color: ColorConfig.bg_border_gradient_1 }
            GradientStop { position: 1.0; color: ColorConfig.bg_border_gradient_2 }
        }

        radius: 10
    }

    // Rectangle shape for the Bar
    Rectangle {
        id: popoutBackground

        color: ColorConfig.bg_primary
        // color: "transparent"
        radius: 10

        // border.color: ColorConfig.bg_border
        // border.width: 2

        anchors.fill: parent
        anchors.margins: 2

        MouseArea {
            anchors.fill: parent
            onClicked: function() {
                // timePopout.visible = false;
                console.log(popoutBackground.activeFocus);
            }
        }
    }
}