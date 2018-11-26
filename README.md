# iOSsmithy
bunch of iOS tests

## iOS001 - Buttons demo
First trivial iOS app with the single view.

topics:
- single view app
- IBOutlet for interacting with UI components
- IBOutlet for button click response
- overriding app state methods: viewWillAppear, viewDidAppear, viewDidLoad
- disabling UI components with viewDidLoad
- Main.storyboard “ctrl+mouse drag” for creating IBOutlet and IBOutlet via Assistant Editor 
- Icons in Assets
- Simple AutoLayout

## iOS002 - Multiple views
Second trivial app - this time with multiple views but without passing arguments between View Controller classes.

topic:
- multiple views using UINavigationController added by Editor->Embed In->Navigation Controller menu item.
- root view controller as the first screen of the app
- connect root view controller button to child view controller via “show” _segue_ (simple but no args passing)
- changing the name of the initial View Controller by:
 1. change the name of the source code swift file from “ViewController.swift” to “RootViewController.swift”
 2. change in the comments “ViewController.swift” to “RootViewController.swift”
 3. refactor->rename class name from - it will change to new name in the story board, see: identity inspector
- assigning the new class source code file for newly created views
 1. New->File (iOS, Cocoa Touch Class) + do not select “create XIB file” + subclass of UIViewController
 2. Using “Identity Inspector” change class name to the new class
