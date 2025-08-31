pragma Singleton

import qs.utils
import Quickshell
import Quickshell.Io

Singleton {

    property alias appearance: adapter.appearance
    // property alias colors: adapter.appearance.colors

    FileView {
        path: '${Paths.stringify(Paths.config)}/shell.json'
        watchChanges: true
        onFileChanged: reload()

        JsonAdapter {
            id: adapter

            property AppearanceConfig appearance: AppearanceConfig {}
            // property ColourConfig colors: ColourConfig {}
        }
    }
}