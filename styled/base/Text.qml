import QtQuick
import qs.configs as Configs

Text {
    font.hintingPreference: Font.PreferFullHinting
    renderType: Text.NativeRendering
    textFormat: Text.PlainText

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
