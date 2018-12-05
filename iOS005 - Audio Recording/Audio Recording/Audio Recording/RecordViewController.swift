//
//  RecorViewController.swift
//  Audio Recording
//
//  Created by Robert Kleniewski on 12/1/18.
//  Copyright © 2018 Robert Kleniewski. All rights reserved.
//

import UIKit
// we have to import AVFoundation. It provides AudioRecorder
import AVFoundation


class RecordViewController: UIViewController, AVAudioRecorderDelegate {

    @IBOutlet weak var startRecButton: UIButton!
    @IBOutlet weak var stopRecButton: UIButton!
    
    var audioRecorder: AVAudioRecorder!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        startRecButton.isEnabled = true
        stopRecButton.isEnabled  = false
    }

    @IBAction func startRecClicked(_ sender: Any) {
        startRecButton.isEnabled = false
        stopRecButton.isEnabled  = true
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        print("dirPath=\(dirPath)")
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        print("filepath=\(filePath?.absoluteString ?? "??")")
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSession.Category.playAndRecord, mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.defaultToSpeaker)
        
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        // we need to set this View as the Delegate of AudioRecorder
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
    
    @IBAction func stopRecClicked(_ sender: Any) {
        startRecButton.isEnabled = true
        stopRecButton.isEnabled  = false
        
        audioRecorder.stop()
        
        let session = AVAudioSession.sharedInstance()
        try! session.setActive(false)
        
    }
    
    // it will run because this VC is the delegate of AVAudioRecorder
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        
        
        if flag {
            print("Finished recording successfully")
            // as the first parameter we must specify Segue Identifier
            performSegue(withIdentifier: "fromRecordToPlay", sender: audioRecorder.url)
        }
        else {
            print("Recording was not successfull")
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "fromRecordToPlay" {
            let playVC = segue.destination as! PlayViewController
            
            let recordingUrl = sender as! URL
            playVC.recordingUrl = recordingUrl
        }
    }
}

