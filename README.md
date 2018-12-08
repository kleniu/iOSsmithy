# iOSsmithy
bunch of iOS tests

## iOS006 - Timers, NavBar and ToolBar
Test of Timer associated with ControllerView. Single View application with ToolBar on the bottom and NavBar on the top.

topics:
 - “Navigation Bar” (UINavigationBar) - provides navigation mechanism just below status bar. It can have Title and navigation items as “Bar Button Item” (UIBarButtonItem)
 - “Bar Button Item” (UIBarButtonItem) - push button that can be added to NavBar and ToolBar
 - “Toolbar” (UIToolbar) - bar on the bottom of the view
 - “Flexible space” - handful for auto adjust the space between buttons on the ToolBar
 - Timer.scheduledTimer to count tics 

## iOS005 - Audio Recording
Test audio recording and playback with speed and pitch modifications. 

topics:
- AVFoundation for audio recording and playback
- creating extensions for the existing classes
- enums 
- action methods for several buttons

## iOS004 - StackViews and dialogs
Test of common alert dialogs and demo of StackViews

topics:
- Vertical and Horizontal StackViews
- StackViews attribute inspector: Alignment=fill Distribution=Fill Equally
- _UIAlertAction_ _UIAlertController_ _present_ sequence to display alerts
- UIAlertAction.Style: default, cancel, destructive
- UIAlertController.Style: alert, actionSheet


## iOS003 - Multiple views with args
Similar to iOS002 but this time with passing arguments between View Controller classes.

topic:
- multiple views using UINavigationController added by Editor->Embed In->Navigation Controller menu item. *never ever use other method to add navigation controller*
- some test with UITextField and on screen keyboard show/hide procedure
- create segue to be controlled via code by removing segue from storyboard and creating the new one dragging from one view controller to destination view controller (pick “show” and don’t forget to name it using tribute inspector)
- trigger segue in code with *performSeque* and customize code in *prepare* method

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

