//
//  LoggingViewController.swift
//  UISplitViewController
//
//  Created by Robert Kleniewski on 2/8/19.
//  Copyright © 2019 Robert Kleniewski. All rights reserved.
//

import UIKit

class LoggingViewController: UIViewController {
    private struct LogGlobals {
        var prefix = ""
        var instanceCounts = [String:Int]()
        var lastLogTime = Date()
        var identationInterval: TimeInterval = 1
        var identationString = "__"
    }
    
    private static var logGlobals = LogGlobals()
    
    private static func logPrefix(for loggingName: String) -> String {
        if logGlobals.lastLogTime.timeIntervalSinceNow < -logGlobals.identationInterval {
            logGlobals.prefix += logGlobals.identationString
            print("")
        }
        logGlobals.lastLogTime = Date()
        return logGlobals.prefix + loggingName
    }
    
    private static func bumpInstanceCount(for loggingName: String) -> Int {
        logGlobals.instanceCounts[loggingName] = (logGlobals.instanceCounts[loggingName] ?? 0) + 1
        return logGlobals.instanceCounts[loggingName]!
    }
    
    private var instanceCount: Int!
    
    var lvcLoggingName: String {
        return String(describing: type(of :self))
    }
    
    private func logLVC(_ msg: String) {
        if instanceCount == nil {
            instanceCount = LoggingViewController.bumpInstanceCount(for: lvcLoggingName)
        }
        print("\(LoggingViewController.logPrefix(for: lvcLoggingName))[\(instanceCount!)] \(msg)")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        logLVC("init(coder :) - created by InterfaceBuilder")
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName :nibNameOrNil, bundle :nibBundleOrNil)
        logLVC("init(nibName:bundle:) - create in code")
    }
    
    deinit {
        logLVC("left the heap")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        logLVC("awakeFromNib()")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logLVC("viewDidLoad()")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        logLVC("viewWillAppear(animated = \(animated))")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        logLVC("viewDidAppear(animated = \(animated))")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        logLVC("viewWillDisappear(animated = \(animated))")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        logLVC("viewDidDisappear(animated = \(animated))")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        logLVC("didReceiveMemoryWarning()")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        logLVC("viewWillLayoutSubviews() bounds.size = \(view.bounds.size)")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        logLVC("viewDidLayoutSubviews() bounds.size = \(view.bounds.size)")
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        logLVC("viewWillTransition(to :\(size) with :coordinator")
        coordinator.animate(alongsideTransition: { (context: UIViewControllerTransitionCoordinatorContext!) -> Void in
            self.logLVC("begin animate(alongsideTransition:completion:)")
        }, completion: { context -> Void in
            self.logLVC("end animate(alongsideTransition:completion:)")
            
        })
    }
    
}
