pragma Singleton

import Quickshell

Singleton {
    function sh(cmd) {
        return [Quickshell.env("SHELL"), "-c", cmd]
    }

    function det(cmd) {
        Quickshell.execDetached(sh(cmd))
    }
}
