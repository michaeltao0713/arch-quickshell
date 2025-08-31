pragma Singleton

import qs.utils
import QtQuick
import Quickshell
import Quickshell.Io

Singleton {

    // readonly property color shadow_primary: "#06060b"
    // readonly property color shadow_secondary: Qt.alpha(pywal.colors.color0, 0.90)
    // readonly property color shadow_tertiary: Qt.alpha(pywal.colors.color0, 0.30)

    // readonly property color border_primary: pywal.colors.color8

    // readonly property color bg_primary: Qt.alpha(pywal.colors.color0, 0.98)
    // readonly property color bg_secondary: Qt.alpha(pywal.colors.color0, 0.92)
    // readonly property color bg_tertiary: Qt.alpha(pywal.colors.color0, 0.75)

    // readonly property color bg_darker: Qt.alpha(pywal.colors.color0, 0.4)

    // readonly property color text_primary: pywal.special.foreground
    // readonly property color text_secondary: pywal.special.foreground
    // readonly property color text_accent: pywal.special.foreground
    // readonly property color text_muted: pywal.colors.color1
    // readonly property color text_info: pywal.special.foreground

    readonly property color bar_shadow: Qt.alpha(pywal.special.background, 0.4)
    readonly property color bar_base: Qt.alpha(pywal.special.foreground, 0.2)

    // readonly property color bar_bg: pywal.special.background
    // readonly property color bar_text: pywal.special.foreground
    // readonly property color bar_accent: pywal.colors.color4

    // readonly property color text_disabled: "#737373";

    FileView {

        path: `${Paths.stringify(Paths.cache)}/wal/colors.json`
        watchChanges: true
        onFileChanged: reload()
        // Component.onCompleted: reload()

        // Parse JSON into properties above
        JsonAdapter {
            id: pywal

            // Defaults so bindings don't break before file loads
            property var special: ({ background: "#000000", foreground: "red", cursor: "#ffffff" })
            property var colors: ({ color0: "#091115", color1: "#59443B", color2: "#373C42", color3: "#3D4246",
                                    color4: "#4E4D4E", color5: "#6D5F5A", color6: "#956B5F", color7: "#c1c3c4",
                                    color8: "#58666c", color9: "#59443B", color10: "#373C42", color11: "#3D4246",
                                    color12: "#4E4D4E", color13: "#6D5F5A", color14: "#956B5F", color15: "#c1c3c4" })
        }
    }
}