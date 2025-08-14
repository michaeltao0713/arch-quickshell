pragma Singleton

import qs.config.Config
import Quickshell
import Quickshell.Services.Pipewire

Singleton {
    id: root

    // Get all nodes from Pipewire and sort into Sinks and Sources
    readonly property var nodes: Pipewire.nodes.values.reduce((acc, node) => {
        // Check if node is a hardware device
        if (!node.isStream){
            // Check if node is a sink
            if (node.isSink) {
                acc.sinks.push(node);
            // Check if source sends/recieves audio
            } else if (node.audio) {
                acc.sources.push(node);
            }
        }
        return acc;
    }, {
        sinks: [],
        sources: []
    });

    // Collections of Sinks and Sources
    readonly property list<PwNNode> sinks: nodes.sinks;
    readonly property list<PwNNode> sources: nodes.sources;

    // Get current Sink and Source
    readonly property PwNode currentSink: Pipewire.defaultAudioSink;
    readonly property PwNode currentSource: Pipewire.defaultAudioSource;

    // Status booleans tracking whether sink is muted and sink volume setting
    readonly property bool muted: !!currentSink?.audio?.muted;
    readonly property real volume: currentSink?.audio?.volume ?? 0;

    // Set a new volume value for the current sink
    function setVolume(newVolume: real): void {
        // Check if sink is ready and has audio capabilities
        if (currentSink?.ready && currentSink?.audio) {
            // Unmute the sink and set the volume to specified value between 0 and 1
            currentSink.audio.muted = false;
            currentSink.audio.volume = Math.max(0, Math.min(1, newVolume));
        }
    }

    // Increase the volume by a specified amount
    function incrementVolume(amount: real): void {
        setVolume(volume + (amount || Config.services.audioIncrement));
    }

    // Decrease the volume by a specified amount
    function decrementVolume(amount: real): void {
        setVolume(volume - (amount || Config.services.audioIncrement));
    }

    // Set a new sink the current sink
    function setAudioSink(newSink: PwNode): void {
        Pipewire.preferredDefaultAudioSink = newSink;
    }

    // Set a new source as the current source
    function setAudioSource(newSource: PwNode): void {
        Pipewire.preferredDefaultAudioSource = newSource;
    }

    // Watch for changes to sinks and sources
    PwObjectTracker {
        objects: [...root.sinks, ...root.sources]
    }
}