pragma Singleton

import Quickshell

Singleton {

    // Heights and Widths
    readonly property int barBgHeight: 40

    readonly property int barElementsHeight: barBgHeight - barElementsTopMargin

    // readonly property int between_bar_and_screen_hori: 100
    // readonly property int between_bar_and_screen_vert: 10
    // readonly property int bar_element_height: bar_bg_height - between_bar_and_screen_vert - 10

    // readonly property int straight_rectangle_width: 8
    // readonly property int bar_icon_width: 40

    // readonly property int clock_width: 130

    // Margins and Spacings
    readonly property int barElementsTopMargin: 4
    readonly property int barElementsSideMargin: 10
    readonly property int barElementsSpacing: 10


    // Radii
    readonly property int barElementRadius: barElementsHeight / 2
    // readonly property int bar_element_radius: 8

    
    // Animations
    readonly property int barElementsDuration: 200
    readonly property int barElementsOvershoot: 2

    readonly property double barElementsClickScale: 0.90

    readonly property double barElementsHoverScale: 1.2
    readonly property int barElementsHoverRotation: -10

    // Fonts
    readonly property int barIconFontSize: 20
    readonly property string barIconFontFamily: "CaskaydiaCove Nerd Font"

    readonly property int barElementsFontSize: 16

}