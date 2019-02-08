# iOSsmithy
bunch of iOS tests

## iOS014 - UISplitViewController sample
Boilerplate for multiple Detail Windows in SPlit View

topics:
- NavigationController for setting title in DetailWindows
- works on all type of devices iPhone/iPad

## iOS013 - UITabBarController, UISplitViewController, UINavigationController
Preparing app for displaying on iPhones and iPads with SplitViewController. Master view is populated by TableView and the Detail view shows only when item from master view has been clicked.

topics:
 - TabBarController over SplitViewController over NavigationController
 - passing Model objects (by reference) between ViewControllers
 - refreshing TableView from master by Detailed View Controller
 - starting up with MasterView on iPhones by using splitViewController(UISplitViewController: UIViewController: UIViewController) method
 - using preferredDisplayMode to show master on iPads

## iOS012 - Multitouch
Creating custom View, Controller and Model. Custom View has rounded corners and single sub view based on UILabel. Custom View responses on Tap, Pinch and Swipe gestures. 

topics:
- clipping the view to get rounded corners in code using UIBezierPath
- clipping subviews to stay in bounds of parent view using clipsToBounds property of parent view
- responding to swipe gestures using code only - UISwipeGestureRecognizer
- responding to Tap and Pinch gestures using storyboard and @IBAction

## iOS011 - Drawing and custom views
Using UIView to build custom view for: drawing lines and arcs with Bezier path, placing subviews like UILabel, drawing Images. Some minor code examples describing error handling. Preparing custom views to be displayed on storyboard. Adding attributes to be changed directly from the storyboard.

topics:
- drawing using Code Graphics (CG) within the context, plus adding stroke and fill color
- set "Content Mode" attribute to redraw - to force redraw when bounds are changed eg. by switching to landscape
- forcing  redraw shapes on change class properties using “didSet”
- clipping view for rounded corners with “addClip”
- defining attributed strings (attributes: alignment and font)
- placing sub views like UILabel in the UIView
- extension for CGPoint just to make additional method “offsetBy”
- “traitCollectionDidChange” example - trait called when bounds of font size (trait) has been changed 
- draw an image without using subViews directly within UIView
- Storyboard integration using @IBDesignable and @IBInspectable
- drawing images in Storyboard

## iOS010 - WebView and REST API GET method
WebViewKit for displaying Web content. Simple GET and POST methods.

topics:
- using tuples in the array to select segue when TableView Cell is pressed
- usage of URLRequest to set HTTP header, httpMethod 
- creating task for async http request (URLSession.shared.dataTask)  
- updating UI elements in async task using DispatchQueue.main.sync

## iOS009 - Simple ToDo list
Dynamic modification of TableView lists. Customized buttons with rounded corners. Deletion of ListView items by swapping cell left. 

topics:
- Custom buttons: Inspectors->Identity Inspector->User defined Runtime Atibutes (layer.cornerRadius=10; clipsToBounds=true)
- enable delete by adding func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {…}

## iOS008 - User Defaults as permanent data storage
User Defaults to store data from custom class. 

topics:
- Text Field keyboard - is not enough to show the keyboard when using simulator - enable it in the menu
- using UserDefaults to store: Bool, Float and String values

## iOS007 - Simple TableView and Sliders
Simple TableView to show lines of text, adopting protocols, response to click on cell.

topics:
- “Table View” (UITableView) - wen placing on the view set all constraints: up, down, left and right
- “Table View” must have single one (prototype) cell (UITableViewCell) - Create it increasing “Prototype Cells” attribute. DON’T forget to set “identifier” in the attribute inspector.    
- ctrl+Drag from “Table View” to “View Controller” and choose _outlets_ : “dataSource” and “delegate”
- create outlet for TableView in your code
- in the class definition _adopt_ UITableViewDataSource and UITableViewDelegate _protocol_


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
- some test with UITextField and on screen keyboard show/hide procedure - Edit Box Keyboard
- using Simulator dont forget to enable software keyboard: Hardware->Keyboard->Toggle Software Keyboard
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

