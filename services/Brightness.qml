pragma Singleton
pragma ComponentBehavior: Bound

import qs.components.misc //=======================
import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root

    property list<var> ddcMonitors: []
    readonly property list<Monitor> monitors: variants.instances
    property bool appleDisplayPresent: false

    // Returns Monitor object associated with given ShellScreen
    function getMonitorForScreen(screen: ShellScreen): var {
        return monitors.find(m => m.modelData === screen);
    }

    // Increase the brightness of the currently focused monitor in Hyprland
    function increaseBrightness(): void {
        const focusedName = Hyprland.focusedMonitor.name;
        const monitor = monitors.find(m => focusedName === m.modelData.name);
        if (monitor)
        monitor.setBrightness(monitor.brightness + 0.1);
    }

    // Decrease the brightness of the currently focused monitor in Hyprland
    function decreaseBrightness(): void {
        const focusedName = Hyprland.focusedMonitor.name;
        const monitor = monitors.find(m => focusedName === m.modelData.name);
        if (monitor)
        monitor.setBrightness(monitor.brightness - 0.1);
    }

    // Clear and run DDC detection when monitor list changes
    reloadableId: "brightness"

    onMonitorsChanged: {
        ddcMonitors = [];
        ddcProc.running = true;
    }

    // Create a Monitor object for every ShellScreen
    Variants {
        id: variants

        model: Quickshell.screens

        Monitor {}
    }

    // Process for detecting Apple Display
    Process {
        running: true
        command: ["sh", "-c", "asdbctl get"] // To avoid warnings if asdbctl is not installed
        stdout: StdioCollector {
            onStreamFinished: root.appleDisplayPresent = text.trim().length > 0
        }
    }

    // Process for detecting DDC monitors
    Process {
        id: ddcProc

        command: ["ddcutil", "detect", "--brief"]
        stdout: StdioCollector {
            onStreamFinished: root.ddcMonitors = text.trim().split("\n\n").filter(d => d.startsWith("Display ")).map(d => ({
                                                                                                                               model: d.match(/Monitor:.*:(.*):.*/)[1],
                                                                                                                               busNum: d.match(/I2C bus:[ ]*\/dev\/i2c-([0-9]+)/)[1]
                                                                                                                           }))
        }
    }

    // Global shortcuts for brightness control
    CustomShortcut {
        name: "brightnessUp"
        description: "Increase brightness"
        onPressed: root.increaseBrightness()
    }

    CustomShortcut {
        name: "brightnessDown"
        description: "Decrease brightness"
        onPressed: root.decreaseBrightness()
    }

    // Monitor object definition
    component Monitor: QtObject {
        id: monitor

        required property ShellScreen modelData
        readonly property bool isDdc: root.ddcMonitors.some(m => m.model === modelData.model)
        readonly property string busNum: root.ddcMonitors.find(m => m.model === modelData.model)?.busNum ?? ""
        readonly property bool isAppleDisplay: root.appleDisplayPresent && modelData.model.startsWith("StudioDisplay")
        property real brightness
        property real queuedBrightness: NaN

        // Read current brightness from monitor
        readonly property Process initProc: Process {
            stdout: StdioCollector {
                onStreamFinished: {
                    if (monitor.isAppleDisplay) {
                        const val = parseInt(text.trim());
                        monitor.brightness = val / 101;
                    } else {
                        const [, , , cur, max] = text.split(" ");
                        monitor.brightness = parseInt(cur) / parseInt(max);
                    }
                }
            }
        }

        // 500ms delay before applying brightness changes
        readonly property Timer timer: Timer {
            interval: 500
            onTriggered: {
                if (!isNaN(monitor.queuedBrightness)) {
                    monitor.setBrightness(monitor.queuedBrightness);
                    monitor.queuedBrightness = NaN;
                }
            }
        }

        // Set the brightness
        function setBrightness(value: real): void {
            value = Math.max(0, Math.min(1, value));
            const rounded = Math.round(value * 100);
            if (Math.round(brightness * 100) === rounded)
            return;

            if (isDdc && timer.running) {
                queuedBrightness = value;
                return;
            }

            brightness = value;

            if (isAppleDisplay)
            Quickshell.execDetached(["asdbctl", "set", rounded]);
            else if (isDdc)
            Quickshell.execDetached(["ddcutil", "-b", busNum, "setvcp", "10", rounded]);
            else
            Quickshell.execDetached(["brightnessctl", "s", `${rounded}%`]);

            if (isDdc)
            timer.restart();
        }

        // Initialize brightness for the monitor
        function initBrightness(): void {
            if (isAppleDisplay)
            initProc.command = ["asdbctl", "get"];
            else if (isDdc)
            initProc.command = ["ddcutil", "-b", busNum, "getvcp", "10", "--brief"];
            else
            initProc.command = ["sh", "-c", "echo a b c $(brightnessctl g) $(brightnessctl m)"];

            initProc.running = true;
        }

        onBusNumChanged: initBrightness()
        Component.onCompleted: initBrightness()
    }
}