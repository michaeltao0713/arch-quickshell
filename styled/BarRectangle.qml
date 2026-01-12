pragma ComponentBehavior: Bound

import QtQuick
import Qt5Compat.GraphicalEffects
import qs.configs as Configs
import "base" as Base

Base.Rectangle {
    id: root

    Item {
        anchors.fill: parent
        layer.enabled: true
        layer.smooth: true
        layer.effect: OpacityMask {
            maskSource: root
        }

        Rectangle {
            id: shimmer

            width: 44
            height: parent.height * 2
            rotation: 20
            x: -100
            y: -parent.height / 2
            color: "transparent"
            gradient: Gradient {
                GradientStop {
                    position: 0.0
                    color: "transparent"
                }
                GradientStop {
                    position: 0.5
                    color: Configs.Color.barElementShimmerColor
                }
                GradientStop {
                    position: 1.0
                    color: "transparent"
                }
            }
        }
    }

    NumberAnimation {
        id: shimmerAnimation
        target: shimmer
        property: "x"
        from: -60
        to: root.width + 60
        duration: 800
        easing.type: Easing.InOutQuad
    }

    MouseArea {
        id: clockArea
        anchors.fill: parent
        hoverEnabled: true
        onEntered: shimmerAnimation.restart()
    }

    Rectangle {
        anchors.fill: parent
        radius: height / 2
        color: Configs.Color.barElementOpacityColor
        opacity: clockArea.pressed ? 0.18 : (clockArea.containsMouse ? 0.12 : 0.0)
        Behavior on opacity {
            NumberAnimation {
                duration: 200
                easing.type: Easing.OutCubic
            }
        }
    }
}
