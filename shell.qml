import "modules/bar"
import Quickshell

ShellRoot{



    // Lazy Load the Bar component on every screen
    LazyLoader { active: true; component:
        Variants {
            model: Quickshell.screens

            Bar {
                modelData: model
            }
        }
    }



    
}