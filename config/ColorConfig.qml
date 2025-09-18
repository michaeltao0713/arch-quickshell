pragma Singleton

import qs.utils
import QtQuick
import Quickshell
import Quickshell.Io

Singleton {

    // readonly property color shadow_primary: "#06060b"
    // readonly property color shadow_secondary: Qt.alpha(wal.colors.color0, 0.90)
    // readonly property color shadow_tertiary: Qt.alpha(wal.colors.color0, 0.30)

    // readonly property color bg_primary: Qt.alpha(Qt.lighter(wal.colors.color0, 1.3), 0.9)
    readonly property color bg_primary: Qt.alpha("black", 0.7)
    // readonly property color bg_secondary: Qt.alpha(wal.colors.color0, 0.92)
    // readonly property color bg_tertiary: Qt.alpha(wal.colors.color0, 0.75)
    // readonly property color bg_border: wal.colors.color5
    readonly property color bg_border_gradient_1: wal.colors.color3
    readonly property color bg_border_gradient_2: wal.colors.color5


    // readonly property color text_primary: wal.special.foreground
    // readonly property color text_secondary: wal.special.foreground
    // readonly property color text_accent: wal.special.foreground
    // readonly property color text_muted: wal.colors.color1
    // readonly property color text_info: wal.special.foreground

    readonly property color bar_shadow: Qt.alpha(wal.special.background, 0.4)
    readonly property color bar_base: Qt.alpha(wal.special.foreground, 0.6)

    readonly property color bar_element: wal.special.background
    readonly property color bar_text: wal.special.foreground
    readonly property color bar_accent: wal.colors.color3

    FileView {

        path: `${Paths.stringify(Paths.cache)}/wal/colors.json`
        watchChanges: true
        onFileChanged: reload()
        // Component.onCompleted: reload()

        // Parse JSON into properties above
        JsonAdapter {
            id: wal

            // Defaults so bindings don't break before file loads
            property var special: ({ background: "#000000", foreground: "red", cursor: "#ffffff" })
            property var colors: ({ color0: "#091115", color1: "#59443B", color2: "#373C42", color3: "#3D4246",
                                    color4: "#4E4D4E", color5: "#6D5F5A", color6: "#956B5F", color7: "#c1c3c4",
                                    color8: "#58666c", color9: "#59443B", color10: "#373C42", color11: "#3D4246",
                                    color12: "#4E4D4E", color13: "#6D5F5A", color14: "#956B5F", color15: "#c1c3c4" })
        }
    }
}