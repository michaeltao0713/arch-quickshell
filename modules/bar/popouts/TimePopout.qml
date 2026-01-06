import qs.config
import QtQuick
import Quickshell
import "../components"

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
    visible: false
    color: "transparent"
    exclusionMode: ExclusionMode.Ignore

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

        anchors.fill: parent
        anchors.margins: 2
        radius: 10
        color: ColorConfig.bg_primary

        Calendar {
            anchors.fill: parent
            anchors.margins: 16
        }
    }
}