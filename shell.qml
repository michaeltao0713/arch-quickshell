//@ pragma UseQApplication

import "modules/bar"
// import QtQuick
import Quickshell

ShellRoot{
    // Lazy Load the Bar component on every screen
    LazyLoader { active: true; component:
        Variants {
            model: Quickshell.screens

            Bar {
                modelData: modelData
            }
        }
    }
}