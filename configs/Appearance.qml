pragma Singleton

import Quickshell

Singleton {
    // Bar
    readonly property int barBgHeight: 40

    // Bar Elements
    readonly property int barElementsHeight: barBgHeight - barElementsTopMargin
    readonly property int barElementsTopMargin: 4
    readonly property int barElementsSideMargin: 10
    readonly property int barElementsSpacing: 10
    readonly property int barElementRadius: barElementsHeight / 2

    readonly property int barElementsDuration: 200
    readonly property int barElementsOvershoot: 2
    readonly property double barElementsClickScale: 0.90
    readonly property double barElementsHoverScale: 1.2
    readonly property int barElementsHoverRotation: -10

    // Workspaces
    readonly property int wsActiveHeight: 24
    readonly property int wsIconSize: 22

    readonly property int wsDuration: 240
    readonly property int wsIconElevation: 1
    readonly property double wsIconHoverScale: 1.1
    readonly property double wsIconPressScale: 0.90

    // Fonts
    readonly property string barIconFontFamily: "CaskaydiaCove Nerd Font"
    readonly property int barIconFontSize: 20

    readonly property string wsIconFontFamily: "CaskaydiaCove Nerd Font"
    readonly property int wsIconFontSize: 16
}
