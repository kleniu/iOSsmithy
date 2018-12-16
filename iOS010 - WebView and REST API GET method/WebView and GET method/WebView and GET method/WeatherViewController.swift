//
//  WeatherViewController.swift
//  WebView and GET method
//
//  Created by Robert Kleniewski on 12/12/18.
//  Copyright © 2018 Robert Kleniewski. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {

    var viewParameters: String = ""
    @IBOutlet weak var getButton: UIButton!
    @IBOutlet weak var outputText: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("Weather View did load")
        
        outputText.text = ""
    }
    

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("Weather View did appear")
    }

    @IBAction func getButtonPressed(_ sender: UIButton) {
        print("Get Weather Data button pressed")
        
        outputText.text = "Loading ...."
        
        if let myUrl = URL(string: "https://samples.openweathermap.org/data/2.5/weather?lat=52&lon=21&appid=b6907d289e10d714a6e88b30761fae22") {
            // url is now unwrapped optional
            let myRequest = URLRequest(url: myUrl)
            
            // func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
            let myTask = URLSession.shared.dataTask(with: myRequest) {
                rawData, responce, error in
                if error != nil {
                    print("GET method error \(String(describing: error))")
                }
                else {
                    if let myRawData = rawData, let textData = String(data: myRawData, encoding: .utf8) {
                            print(textData)
                            // you can update the UI only using DispathQueue
                            DispatchQueue.main.sync {
                                self.outputText.text = textData
                            }
                    }
                }
            }
            
            // this starts the task
            myTask.resume()
        }
    }
}

/*
 let url = URL(string: "http://www.thisismylink.com/postName.php")!
 var request = URLRequest(url: url)
 request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
 request.httpMethod = "POST"
 let postString = "id=13&name=Jack"
 request.httpBody = postString.data(using: .utf8)
 let task = URLSession.shared.dataTask(with: request) { data, response, error in
 guard let data = data, error == nil else {                                                 // check for fundamental networking error
 print("error=\(error)")
 return
 }
 
 if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
 print("statusCode should be 200, but is \(httpStatus.statusCode)")
 print("response = \(response)")
 }
 
 let responseString = String(data: data, encoding: .utf8)
 print("responseString = \(responseString)")
 }
 task.resume()
 */
