import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import qs.configs as Configs



Rectangle {

    QtObject {
        id: hyCache
        property var wsMap: ({}) // wsId
        property bool pending: false

        function rebuild() {
            const m = {}
            const list = Hyprland.toplevels?.values ?? []
            for (const tl of list) {
                const id = tl?.workspace?.id
                if (!id) continue
                if (!m[id]) m[id] = []
                m[id].push(tl)
            }
            wsMap = m
        }

        // Collapses burst events into 1 rebuild per frame
        function scheduleRebuild() {
            if (pending) return
            pending = true
            Qt.callLater(() => {
                             pending = false
                             rebuild()
                         })
        }

        Component.onCompleted: rebuild()
    }
    id: workspacesRoot
    
    required property bool isDarkMode
    required property int activeWorkspaceId

    property int hoveredId: 0
    property var hoveredItem: (hoveredId > 0) ? workspacesRepeater.itemAt(hoveredId - 1) : null
    property int pressedId: 0
    property var pressedItem: (pressedId > 0) ? workspacesRepeater.itemAt(pressedId - 1) : null

    Layout.preferredHeight: Configs.Appearance.barElementsHeight
    Layout.preferredWidth: workspacesRow.width + 20
    Layout.alignment: Qt.AlignVCenter
    color: isDarkMode ? Configs.Color.barElementBgDark : Configs.Color.barElementBgLight
    radius: Configs.Appearance.barElementRadius
    clip: true

    // Active Workspace
    Rectangle {
        id: activeWorkspace

        property int currentId: workspacesRoot.activeWorkspaceId
        property var targetItem: workspacesRepeater.itemAt(currentId - 1)

        x: targetItem ? (workspacesRow.x + targetItem.x) : 0
        width: targetItem ? targetItem.width : 0
        height: 22
        anchors.verticalCenter: parent.verticalCenter
        radius: 13
        color: "black"
        Behavior on x { NumberAnimation { duration: 260; easing.type: Easing.OutCubic } }
        Behavior on width { NumberAnimation { duration: 240; easing.type: Easing.OutCubic } }
    }

    // --- ICON MAP ---
    function getIcon(cls) {
        var c = (cls || "").toLowerCase()
        if (c.includes("firefox") || c.includes("zen") || c.includes("librewolf")) return "󰈹"
        if (c.includes("chromium") || c.includes("chrome") || c.includes("thorium")) return ""
        if (c.includes("brave")) return ""
        if (c.includes("qutebrowser")) return "󰖟"
        if (c.includes("kitty")) return "󰄛"
        if (c.includes("alacritty") || c.includes("foot") || c.includes("terminal") || c.includes("ghostty") || c.includes("wezterm")) return ""
        if (c.includes("code") || c.includes("codium")) return "󰨞"
        if (c.includes("sublime")) return "󰅳"
        if (c.includes("neovide") || c.includes("nvim")) return ""
        if (c.includes("idea") || c.includes("jetbrains")) return ""
        if (c.includes("pycharm")) return ""
        if (c.includes("webstorm")) return ""
        if (c.includes("clion")) return ""
        if (c.includes("android")) return "󰀴"
        if (c.includes("kate") || c.includes("texteditor")) return "󰈔"
        if (c.includes("nautilus") || c.includes("org.gnome.nautilus") || c.includes("files")) return ""
        if (c.includes("thunar") || c.includes("dolphin") || c.includes("nemo")) return ""
        if (c.includes("discord") || c.includes("vesktop")) return "󰙯"
        if (c.includes("slack")) return "󰒱"
        if (c.includes("telegram")) return ""
        if (c.includes("signal")) return "󰭹"
        if (c.includes("element")) return "󰘨"
        if (c.includes("whatsapp")) return "󰖣"
        if (c.includes("spotify")) return ""
        if (c.includes("vlc")) return "󰕼"
        if (c.includes("mpv") || c.includes("haruna") || c.includes("strawberry") || c.includes("rhythmbox") || c.includes("totem")) return ""
        if (c.includes("gimp")) return ""
        if (c.includes("inkscape")) return "󰕙"
        if (c.includes("krita")) return ""
        if (c.includes("blender")) return "󰂫"
        if (c.includes("audacity")) return "󰎈"
        if (c.includes("obs")) return ""
        if (c.includes("kdenlive")) return "󰕧"
        if (c.includes("steam")) return ""
        if (c.includes("lutris")) return "󰺵"
        if (c.includes("heroic")) return "󰊖"
        if (c.includes("prismlauncher")) return "󰍳"
        if (c.includes("writer")) return "󰈬"
        if (c.includes("calc")) return "󰧷"
        if (c.includes("impress")) return "󰈧"
        if (c.includes("libreoffice")) return "󰈙"
        if (c.includes("evince")) return "󰈦"
        if (c.includes("thunderbird")) return ""
        if (c.includes("settings") || c.includes("missioncenter")) return ""
        if (c.includes("look")) return ""
        if (c.includes("systemmonitor")) return "󰄨"
        if (c.includes("pavucontrol")) return "󰕾"
        if (c.includes("calculator")) return "󰃬"
        if (c.includes("weather")) return ""
        if (c.includes("evercal")) return "󰃭"
        if (c.includes("playing")) return "󰎄"
        if (c.includes("photos") || c.includes("org.gnome.loupe") || c.includes("imv") || c.includes("feh") || c.includes("eog") || c.includes("gthumb") || c.includes("qimgv") || c.includes("viewnior")) return ""
        if (c.includes ("swappy")) return "󰫕"

        return ""
    }

    // // Hover Workspace
    // Rectangle {
    //     id: hoverWorkspace

    //     property int currentId: workspacesRoot.activeWorkspaceId
    //     property var targetItem: workspacesRepeater.itemAt(currentId - 1)

    //     x: targetItem ? (workspacesRow.x + targetItem.x) : 0
    //     width: targetItem ? targetItem.width : 0
    //     height: 22
    //     anchors.verticalCenter: parent.verticalCenter
    //     radius: 13
    //     color: "black"
    //     Behavior on x { NumberAnimation { duration: 260; easing.type: Easing.OutCubic } }
    //     Behavior on width { NumberAnimation { duration: 240; easing.type: Easing.OutCubic } }
    // }




    Row {
        id: workspacesRow
        anchors.centerIn: parent
        spacing: 4

        Repeater {
            id: workspacesRepeater

            model: 10
            Item {
                id: wsDelegate
                property int wsId: index + 1
                property bool isActive: barRoot.activeWorkspaceId === wsId

                // --- READ FROM CACHE ---
                property var wsWindows: hyCache.wsMap[wsId] ?? []
                property int winCount: wsWindows.length
                property bool hasWindows: winCount > 0
                property bool isUrgent: wsWindows.some(tl => tl.urgent)

                width: hasWindows ? (winCount * 22 + 12) : 26
                height: 34

                HoverHandler {
                    id: wsHover
                    onHoveredChanged: {
                        if (hovered) workspacesRoot.hoveredId = wsId
                        else if (workspacesRoot.hoveredId === wsId) workspacesRoot.hoveredId = 0
                    }
                }

                y: wsPress.pressed ? 1 : ((!isActive && wsHover.hovered) ? -2 : 0)
                scale: (wsPress.pressed ? 0.96 : 1.0) * ((!isActive && wsHover.hovered) ? 1.10 : 1.0)
                Behavior on y { NumberAnimation { duration: 180; easing.type: Easing.OutCubic } }
                Behavior on scale { NumberAnimation { duration: 220; easing.type: Easing.OutBack; easing.overshoot: 1.08 } }

                Text {
                    anchors.centerIn: parent
                    visible: !wsDelegate.hasWindows
                    text: "•"
                    font.family: Configs.Appearance.barIconFontFamily; font.pixelSize: 14; lineHeight: 0.8
                    verticalAlignment: Text.AlignVCenter
                    Behavior on color { ColorAnimation { duration: 140 } }
                    color: isActive ? "#2d353b" : (wsHover.hovered ? (workspacesRoot.isDarkMode ? "#f2f2f2" : palette.accent) : (workspacesRoot.isDarkMode ? "#d5c9b2" : "#5c6a72"))
                }

                Row {
                    anchors.centerIn: parent; spacing: 0
                    visible: wsDelegate.hasWindows
                    Repeater {
                        model: wsDelegate.wsWindows
                        Item {
                            width: 22; height: 22

                            // --- ipc ---
                            property string safeClass: {
                                const o = modelData?.lastIpcObject;
                                var c = o?.class ?? "";
                                if (!c) c = o?.initialClass ?? "";
                                if (!c) c = o?.initialTitle ?? "";
                                if (!c) c = modelData?.title ?? "";
                                return String(c);
                            }

                            QtObject {
                                id: flashColor
                                property color val: barRoot.isDarkMode ? "#d5c9b2" : "#1e2326"
                                SequentialAnimation on val {
                                    running: modelData.urgent
                                    loops: Animation.Infinite
                                    ColorAnimation { to: "#e67e80"; duration: 200 }
                                    ColorAnimation { to: "#dbbc7f"; duration: 200 }
                                }
                            }
                            Text {
                                anchors.centerIn: parent
                                text: workspacesRoot.getIcon(parent.safeClass)
                                font.family: Configs.Appearance.barIconFontFamily; font.pixelSize: 18; lineHeight: 0.8
                                verticalAlignment: Text.AlignVCenter
                                Behavior on color { enabled: !modelData.urgent; ColorAnimation { duration: 140 } }
                                scale: (wsDelegate.isActive && wsHover.hovered) ? 1.25 : 1.0
                                Behavior on scale { NumberAnimation { duration: 200; easing.type: Easing.OutBack; easing.overshoot: 1.5 } }
                                color: wsDelegate.isActive ? "#2d353b" :
                                                             (modelData.urgent ? flashColor.val :
                                                                                 (wsHover.hovered ? (barRoot.isDarkMode ? "#f2f2f2" : palette.accent) :
                                                                                                    (barRoot.isDarkMode ? "#d5c9b2" : "#1e2326")))
                            }
                        }
                    }
                }
                MouseArea {
                    id: wsPress
                    anchors.fill: parent
                    hoverEnabled: true
                    onPressed: workspacesRoot.pressedId = wsId
                    onReleased: if (workspacesRoot.pressedId === wsId) workspacesRoot.pressedId = 0
                    onCanceled: if (workspacesRoot.pressedId === wsId) workspacesRoot.pressedId = 0
                    onClicked: barRoot.det("hyprctl dispatch workspace " + wsId)
                }
            }
        }
    }

}



// RowLayout {
//     id: workspacesRoot

//     required property bool isDarkMode

//     spacing: 10

//     Repeater {
//         model: Hyprland.workspaces
//         Rectangle {
//             width: 32
//             height: 24
//             color: "black"
//             radius: 3
//             // border.color: "black"
//             // border.width: 2

//             MouseArea {
//                 anchors.fill: parent
//                 onClicked: {
//                     onClicked: modelData.activate()
//                 }
//             }

//             Text {
//                 text: modelData.id
//                 color: modelData.active ? "white" : "white"
//                 anchors.centerIn: parent

//                 font.pixelSize: 12
//                 font.family: "Inter, sans-serif"
//             }
//         }
//     }
// }