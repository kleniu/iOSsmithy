//
//  WebViewController.swift
//  WebView and GET method
//
//  Created by Robert Kleniewski on 12/12/18.
//  Copyright © 2018 Robert Kleniewski. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKUIDelegate {

    var viewParameters: String = ""
    
    @IBOutlet weak var myWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("Web View did load")
        
        myWebView.uiDelegate = self
        
        if let myUrl = URL(string: "https://www.apple.com") {
            myWebView.load(URLRequest(url: myUrl))
        }
        else {
            print("The web page did not exist")
        }
        
        
    }
    

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("Web View did appear")
    }

}
