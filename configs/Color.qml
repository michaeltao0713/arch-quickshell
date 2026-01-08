pragma Singleton

import QtQuick
import Quickshell
import "../Colors.js" as Colors

Singleton {

    // Bar Elements
    readonly property color barElementBgDark: Qt.alpha(Colors.darkColors["on-background"], 0.3)
    readonly property color barElementBgLight: Qt.alpha(Colors.lightColors["on-background"], 0.3)
}

