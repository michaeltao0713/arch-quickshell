pragma Singleton

import Quickshell

Singleton {

    // Radii
    readonly property int bar_radius: 10

    // Spacing
    readonly property int bar_element_margin: 16
    readonly property int bar_element_spacing: 10

    // Heights and Widths
    readonly property int bar_bg_height: 50
    readonly property int between_bar_and_screen_hori: 100
    readonly property int between_bar_and_screen_vert: 10

    readonly property int bar_element_height: bar_bg_height - between_bar_and_screen_vert - 10

    // Fonts
    // readonly property string bar_font_family: "Roboto"
    // readonly property int bar_font_size: 12
    // readonly property int bar_font_weight: Font.Bold

}