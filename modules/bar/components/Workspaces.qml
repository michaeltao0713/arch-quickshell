pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import qs.configs as Configs
import qs.styled as Styled
import qs.utils as Utils

Rectangle {
    id: wsRoot

    required property int activeWsId
    required property var hyCache

    property int hoveredId: 0
    property var hoveredItem: (hoveredId > 0) ? wsRepeater.itemAt(hoveredId - 1) : null
    property int pressedId: 0
    property var pressedItem: (pressedId > 0) ? wsRepeater.itemAt(pressedId - 1) : null

    Layout.alignment: Qt.AlignVCenter
    Layout.preferredHeight: Configs.Appearance.barElementsHeight
    Layout.preferredWidth: wsRow.width + 30
    radius: Configs.Appearance.barElementRadius
    color: Configs.Color.barElementBg
    clip: true

    // Active Workspace BG
    Rectangle {
        property var targetItem: wsRepeater.itemAt(wsRoot.activeWsId - 1)

        anchors.verticalCenter: parent.verticalCenter
        x: targetItem ? (wsRow.x + targetItem.x) : 0
        height: Configs.Appearance.wsActiveHeight
        width: targetItem ? targetItem.width : 0
        radius: height / 2
        color: Configs.Color.wsBgActiveColor

        Behavior on x {
            NumberAnimation {
                duration: Configs.Appearance.wsDuration
                easing.type: Easing.OutCubic
            }
        }
        Behavior on width {
            NumberAnimation {
                duration: Configs.Appearance.wsDuration
                easing.type: Easing.OutCubic
            }
        }
    }

    // Hover Workspace BG
    Rectangle {
        property var targetItem: wsRoot.hoveredItem

        anchors.verticalCenter: parent.verticalCenter
        x: targetItem ? (wsRow.x + targetItem.x) : 0
        height: Configs.Appearance.wsActiveHeight
        width: targetItem ? targetItem.width : 0
        radius: height / 2
        color: Configs.Color.wsBgHoverColor
        visible: wsRoot.hoveredId > 0 && wsRoot.hoveredId !== wsRoot.activeWsId
        opacity: visible ? 1 : 0

        Behavior on x {
            NumberAnimation {
                duration: Configs.Appearance.wsDuration
                easing.type: Easing.OutCubic
            }
        }
        Behavior on width {
            NumberAnimation {
                duration: Configs.Appearance.wsDuration
                easing.type: Easing.OutCubic
            }
        }
        Behavior on opacity {
            NumberAnimation {
                duration: Configs.Appearance.wsDuration
                easing.type: Easing.OutCubic
            }
        }
    }

    Row {
        id: wsRow

        anchors.centerIn: parent
        spacing: 2

        Repeater {
            id: wsRepeater

            model: 12
            Item {
                id: wsDelegate

                required property int index
                property int wsId: index + 1
                property bool isActive: wsRoot.activeWsId === wsId

                // --- READ FROM CACHE ---
                property var wsWindows: wsRoot.hyCache.wsMap[wsId] ?? []
                property int winCount: wsWindows.length
                property bool hasWindows: winCount > 0
                property bool isUrgent: wsWindows.some(tl => tl.urgent)

                y: wsPress.pressed ? Configs.Appearance.wsIconElevation : ((!isActive && wsHover.hovered) ? -Configs.Appearance.wsIconElevation : 0)
                width: hasWindows ? (winCount * 22 + 12) : height
                height: 34
                scale: (wsPress.pressed ? Configs.Appearance.wsIconPressScale : 1) * ((!isActive && wsHover.hovered) ? Configs.Appearance.wsIconHoverScale : 1)

                Behavior on y {
                    NumberAnimation {
                        duration: Configs.Appearance.wsDuration
                        easing.type: Easing.OutCubic
                    }
                }
                Behavior on scale {
                    NumberAnimation {
                        duration: Configs.Appearance.wsDuration
                        easing.type: Easing.OutCubic
                    }
                }

                HoverHandler {
                    id: wsHover

                    onHoveredChanged: {
                        if (hovered)
                            wsRoot.hoveredId = wsDelegate.wsId;
                        else if (wsRoot.hoveredId === wsDelegate.wsId)
                            wsRoot.hoveredId = 0;
                    }
                }

                // Empty Workspace Dot
                Styled.BarIconText {
                    anchors.centerIn: parent
                    verticalAlignment: Text.AlignVCenter
                    visible: !wsDelegate.hasWindows
                    text: "•"
                    lineHeight: 0.8
                    color: wsDelegate.isActive ? Configs.Color.wsIconActiveColor : (wsHover.hovered ? Configs.Color.wsIconHoverColor : Configs.Color.wsIconInactiveColor)
                }

                // Workspace Windows Icons
                Row {
                    anchors.centerIn: parent
                    visible: wsDelegate.hasWindows
                    Repeater {
                        model: wsDelegate.wsWindows
                        Item {
                            id: itemRoot

                            required property var modelData

                            width: Configs.Appearance.wsIconSize
                            height: Configs.Appearance.wsIconSize

                            // Urgent Color Animation
                            QtObject {
                                id: urgentColorAnimation

                                property color urgentColor: Configs.Color.wsIconInactiveColor
                                SequentialAnimation on urgentColor {
                                    running: itemRoot.modelData.urgent
                                    loops: Animation.Infinite
                                    ColorAnimation {
                                        to: Configs.Color.wsIconUrgentColor1
                                        duration: 400
                                    }
                                    ColorAnimation {
                                        to: Configs.Color.wsIconUrgentColor2
                                        duration: 400
                                    }
                                }
                            }

                            Styled.BarIconText {
                                anchors.centerIn: parent
                                verticalAlignment: Text.AlignVCenter
                                text: Utils.Icons.getIcon(itemRoot.modelData)
                                lineHeight: 0.8
                                color: wsDelegate.isActive ? Configs.Color.wsIconActiveColor : (itemRoot.modelData.urgent ? urgentColorAnimation.urgentColor : (wsHover.hovered ? Configs.Color.wsIconHoverColor : Configs.Color.wsIconInactiveColor))
                                scale: (wsDelegate.isActive && wsHover.hovered) ? 1.3 : 1
                            }
                        }
                    }
                }

                MouseArea {
                    id: wsPress

                    anchors.fill: parent
                    hoverEnabled: true
                    onPressed: wsRoot.pressedId = wsDelegate.wsId
                    onReleased: if (wsRoot.pressedId === wsDelegate.wsId)
                        wsRoot.pressedId = 0
                    onCanceled: if (wsRoot.pressedId === wsDelegate.wsId)
                        wsRoot.pressedId = 0
                    onClicked: Utils.Commands.det("hyprctl dispatch workspace " + wsDelegate.wsId)
                }
            }
        }
    }
}
