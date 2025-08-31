import Quickshell.Io

JsonObject {
    property Colors colors: Colors {}
    property Rounding rounding: Rounding {}
    property Spacing spacing: Spacing {}
    // Padding
    // Font
    // Animation
    // Transparency

    component Colors: JsonObject {
        property string background: "#202020"
        property string foreground: "#ffffff"
        property string primary: "#3a86ff"
        property string secondary: "#ff006e"
        property string accent: "#fb5607"
        property string success: "#4caf50"
        property string warning: "#ff9800"
        property string error: "#f44336"
        property string info: "#2196f3"
    }

    component Rounding: JsonObject {
        property real scale: 1
        property int small: 12 * scale
        property int normal: 17 * scale
        property int large: 25 * scale
        property int full: 1000 * scale
    }

    component Spacing: JsonObject {
        property real scale: 1
        property int small: 7 * scale
        property int smaller: 10 * scale
        property int normal: 12 * scale
        property int larger: 15 * scale
        property int large: 20 * scale
    }
}