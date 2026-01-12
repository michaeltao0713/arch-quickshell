pragma Singleton

import Quickshell

Singleton {
    // Bar
    readonly property int barBgHeight: 40

    // Bar Elements
    readonly property int barElementsHeight: barBgHeight - barElementsTopMargin
    readonly property int barElementsMinWidth: barElementsHeight
    readonly property int barElementsTopMargin: 4
    readonly property int barElementsSideMargin: 10
    readonly property int barElementsSpacing: 10
    readonly property int barElementRadius: barElementsHeight / 2

    readonly property int barElementsDuration: 200
    readonly property double barElementsOvershoot: 2
    readonly property double barElementsClickScale: 0.96
    readonly property double barElementsHoverScale: 1.2
    readonly property int barElementsHoverRotation: -10  

    // Workspaces
    readonly property int wsActiveHeight: 24
    readonly property int wsIconSize: 22

    readonly property int wsDuration: 240
    readonly property double wsOvershoot: 2
    readonly property int wsIconElevation: 1
    readonly property double wsIconHoverScale: 1.1
    readonly property double wsIconPressScale: 0.90

    // Fonts
    readonly property int hubIconFontSize: 16

    readonly property string barTextFont: "Manrope"

    readonly property string wsIconFontFamily: "CaskaydiaCove Nerd Font"
    readonly property int wsIconFontSize: 12
}
