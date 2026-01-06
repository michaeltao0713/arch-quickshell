pragma Singleton

import Quickshell

Singleton {

    // Radii
    readonly property int bar_radius: 10
    readonly property int bar_element_radius: 8

    // Spacing
    readonly property int bar_element_margin: 16
    readonly property int bar_element_spacing: 10

    // Heights and Widths
    readonly property int bar_bg_height: 50
    readonly property int between_bar_and_screen_hori: 100
    readonly property int between_bar_and_screen_vert: 10
    readonly property int bar_element_height: bar_bg_height - between_bar_and_screen_vert - 10

    readonly property int straight_rectangle_width: 8
    readonly property int bar_icon_width: 40

    readonly property int clock_width: 130

    // Fonts
    readonly property int bar_icon_font_size: 18

    readonly property string bar_element_font_family: "CaskaydiaCove Nerd Font"
    readonly property int bar_element_font_size: 14

}