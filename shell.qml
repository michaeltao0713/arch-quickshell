//@ pragma UseQApplication

import Quickshell
import "modules/bar" as Bar

ShellRoot{
    id: root

    Variants {
        model: Quickshell.screens

        // Separate scope for each screen variant. Individual Bar and Hub instances.
        Scope {
            id: variant

            property var modelData

            Bar.Bar {
                screen: variant.modelData
            }
        }
    }
}