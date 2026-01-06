import qs.config
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    id: root

    property date currentDate: new Date()

    readonly property int currMonth: currentDate.getMonth()
    readonly property int currYear: currentDate.getFullYear()

    implicitWidth: 300
    implicitHeight: 350

    // Middle click to go to today
    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.MiddleButton
        onClicked: root.currentDate = new Date()
        
        onWheel: function(wheel) {
            if (wheel.angleDelta.y > 0)
                root.currentDate = new Date(root.currYear, root.currMonth - 1, 1);
            else if (wheel.angleDelta.y < 0)
                root.currentDate = new Date(root.currYear, root.currMonth + 1, 1);
        }
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 16
        spacing: 12

        // Month navigation header
        RowLayout {
            Layout.fillWidth: true
            spacing: 8

            // Previous month button
            Rectangle {
                width: 32
                height: 32
                radius: 16
                color: prevMouseArea.containsMouse ? ColorConfig.bar_accent : "transparent"

                MouseArea {
                    id: prevMouseArea
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                    onClicked: root.currentDate = new Date(root.currYear, root.currMonth - 1, 1)
                }

                Text {
                    anchors.centerIn: parent
                    text: "󰅁"  // chevron left
                    font.family: AppearanceConfig.bar_element_font_family
                    font.pixelSize: 16
                    color: ColorConfig.bar_text
                }
            }

            // Month/Year display
            Item {
                Layout.fillWidth: true
                height: 32

                Rectangle {
                    anchors.fill: parent
                    radius: 16
                    color: monthMouseArea.containsMouse ? ColorConfig.bar_accent : "transparent"
                }

                MouseArea {
                    id: monthMouseArea
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                    enabled: {
                        const now = new Date();
                        return !(root.currMonth === now.getMonth() && root.currYear === now.getFullYear());
                    }
                    onClicked: root.currentDate = new Date()
                }

                Text {
                    anchors.centerIn: parent
                    text: grid.locale.monthName(root.currMonth) + " " + root.currYear
                    font.family: AppearanceConfig.bar_element_font_family
                    font.pixelSize: 16
                    font.weight: Font.Medium
                    color: ColorConfig.bar_text
                }
            }

            // Next month button
            Rectangle {
                width: 32
                height: 32
                radius: 16
                color: nextMouseArea.containsMouse ? ColorConfig.bar_accent : "transparent"

                MouseArea {
                    id: nextMouseArea
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                    onClicked: root.currentDate = new Date(root.currYear, root.currMonth + 1, 1)
                }

                Text {
                    anchors.centerIn: parent
                    text: "󰅂"  // chevron right
                    font.family: AppearanceConfig.bar_element_font_family
                    font.pixelSize: 16
                    color: ColorConfig.bar_text
                }
            }
        }

        // Days of week header
        Row {
            Layout.fillWidth: true
            Layout.preferredHeight: 30

            Repeater {
                model: 7
                Rectangle {
                    width: (root.width - 32) / 7
                    height: 30
                    
                    Text {
                        anchors.centerIn: parent
                        text: grid.locale.dayName(index === 0 ? 0 : index, Locale.ShortFormat)
                        font.family: AppearanceConfig.bar_element_font_family
                        font.pixelSize: 12
                        font.weight: Font.Medium
                        color: (index === 0 || index === 6) ? ColorConfig.bg_border_gradient_2 : ColorConfig.bar_text
                    }
                }
            }
        }

        // Calendar grid
        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true

            MonthGrid {
                id: grid
                anchors.fill: parent
                
                month: root.currMonth
                year: root.currYear
                locale: Qt.locale()

                delegate: Rectangle {
                    required property var model
                    
                    width: grid.width / 7
                    height: grid.height / 6
                    
                    color: model.today ? ColorConfig.bar_accent : "transparent"
                    radius: model.today ? width / 2 : 0
                    
                    Text {
                        anchors.centerIn: parent
                        text: model.day
                        font.family: AppearanceConfig.bar_element_font_family
                        font.pixelSize: 14
                        font.weight: model.today ? Font.Bold : Font.Normal
                        color: {
                            if (model.today) return "white"
                            const dayOfWeek = model.date.getDay();
                            if (dayOfWeek === 0 || dayOfWeek === 6) return ColorConfig.bg_border_gradient_2
                            return ColorConfig.bar_text
                        }
                        opacity: model.month === grid.month ? 1.0 : 0.4
                    }
                }
            }
        }
    }
}