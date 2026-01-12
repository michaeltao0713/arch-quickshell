pragma Singleton

import QtQuick
import Quickshell
import qs.configs as Configs
import "../Colors.js" as Colors

Singleton {
    // Set colors based on dark mode setting
    readonly property var colors: Configs.Settings.isDarkMode ? Colors.darkColors : Colors.lightColors

    // Hub
    readonly property color hubIconColor: Configs.Settings.isDarkMode ? "#89b4fa" : "#1e66f5"

    // Bar Elements
    readonly property color barElementBg: Qt.alpha(colors["on-background"], 0.2)

    readonly property color barElementShimmerColor: Qt.alpha(colors["on-background"], 0.2)
    readonly property color barElementOpacityColor: colors["on-background"]

    // Workspaces
    readonly property color wsBgActiveColor: Qt.alpha(colors["tertiary"], 0.8)
    readonly property color wsBgHoverColor: Qt.alpha(colors["secondary"], 0.8)

    readonly property color wsIconActiveColor: colors["source-color"]
    readonly property color wsIconHoverColor: colors["source-color"]
    readonly property color wsIconInactiveColor: colors["on-background"]

    readonly property color wsIconUrgentColor1: "#e67e80"
    readonly property color wsIconUrgentColor2: "#dbbc7f"

    // Fonts
    readonly property color barTextColor: colors["on-background"]
}
