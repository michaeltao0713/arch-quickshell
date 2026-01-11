pragma Singleton

import QtQuick
import Quickshell
import qs.configs as Configs
import "../Colors.js" as Colors

Singleton {

    property var colors: Configs.Settings.isDarkMode ? Colors.darkColors : Colors.lightColors

    // Bar Elements
    readonly property color barElementBg: Qt.alpha(colors["on-background"], 0.2)


    // Workspaces
    readonly property color wsActiveColor: Qt.alpha(colors["tertiary"], 0.7)

    readonly property color wsHoverEdgeColor: Qt.alpha(colors["primary-fixed"], 0.5)
    readonly property color wsHoverMiddleColor: Qt.alpha(colors["primary-fixed"], 0.7) // idk

    readonly property color wsIconActiveColor: colors["background"]
    readonly property color wsIconHoverColor: colors["source-color"]
    readonly property color wsIconInactiveColor: colors["on-background"]
    readonly property color wsIconUrgentColor1: "#e67e80"
    readonly property color wsIconUrgentColor2: "#dbbc7f"


}
