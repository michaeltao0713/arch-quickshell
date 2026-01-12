import QtQuick
import qs.configs as Configs
import "base" as Base

Base.Text {
    renderType: Text.QtRendering
    font.family: Configs.Appearance.wsIconFontFamily
    font.pointSize: Configs.Appearance.wsIconFontSize
    
    Behavior on color {
        ColorAnimation {
            duration: Configs.Appearance.wsDuration
        }
    }

    Behavior on scale {
        NumberAnimation {
            duration: Configs.Appearance.wsDuration
            easing.type: Easing.OutBack
            easing.overshoot: Configs.Appearance.wsOvershoot
        }
    }

    Behavior on rotation {
        NumberAnimation {
            duration: Configs.Appearance.wsDuration
            easing.type: Easing.OutBack
            easing.overshoot: Configs.Appearance.wsOvershoot
        }
    }
}
