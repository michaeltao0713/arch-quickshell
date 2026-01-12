import QtQuick
import Quickshell.Hyprland

QtObject {
    id: hyCache

    property var wsMap: ({}) // wsId
    property bool pending: false

    function rebuild() {
        const m = {}
        
        const list = Hyprland.toplevels?.values ?? []
        for (const tl of list) {
            const id = tl?.workspace?.id
            if (!id)
                continue
            if (!m[id])
                m[id] = []
            m[id].push(tl)
        }
        wsMap = m
    }

    // Collapses burst events into 1 rebuild per frame
    function scheduleRebuild() {
        if (pending)
            return
        pending = true
        Qt.callLater(() => {
            pending = false
            rebuild()
        })
    }
    
    Component.onCompleted: rebuild()
}
