import QtQuick
import qs.configs as Configs

Rectangle {
    Behavior on color {
        ColorAnimation {
            duration: Configs.Appearance.barElementsDuration
        }
    }

    Behavior on scale {
        NumberAnimation {
            duration: Configs.Appearance.barElementsDuration
            easing.type: Easing.OutBack
            easing.overshoot: Configs.Appearance.barElementsOvershoot
        }
    }

    Behavior on rotation {
        NumberAnimation {
            duration: Configs.Appearance.barElementsDuration
            easing.type: Easing.OutBack
            easing.overshoot: Configs.Appearance.barElementsOvershoot
        }
    }
}
