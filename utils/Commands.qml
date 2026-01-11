pragma Singleton

import Quickshell

Singleton {
    function sh(cmd) {
        return ["bash", "-c", cmd]
        // change "bash" to "fish" or other shell if needed
    }

    function det(cmd) {
        Quickshell.execDetached(sh(cmd))
    }
}