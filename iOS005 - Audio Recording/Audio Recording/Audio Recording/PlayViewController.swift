//
//  PlayViewController.swift
//  Audio Recording
//
//  Created by Robert Kleniewski on 12/1/18.
//  Copyright © 2018 Robert Kleniewski. All rights reserved.
//

import UIKit
import AVFoundation

class PlayViewController: UIViewController {
    // buttons
    @IBOutlet weak var speedSlowButton: UIButton!
    @IBOutlet weak var speedNormalButton: UIButton!
    @IBOutlet weak var speedFastButton: UIButton!
    @IBOutlet weak var pitchLowButton: UIButton!
    @IBOutlet weak var pitchNormalButton: UIButton!
    @IBOutlet weak var pitchHighButton: UIButton!
    @IBOutlet weak var playStopButton: UIButton!
    // switches
    @IBOutlet weak var echoSwitch: UISwitch!
    @IBOutlet weak var reverbSwitch: UISwitch!
    
    
    enum ButtonType: Int { case speedSlow = 0, speedNormal, speedFast, pitchLow, pitchNormal, pitchHigh }
    
    
    var recordingUrl: URL!
    var recordingFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("url=\(recordingUrl?.absoluteString ?? "??")")
        // this method comes from the class extension
        setupAudio()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        echoSwitch.setOn(false, animated: true)
        reverbSwitch.setOn(false, animated: true)
        configureButtons(.notPlaying)
    }

    @IBAction func playButtonsClicked(_ sender: UIButton) {
        print("one of the play button pressed")
        configureButtons(.playing)
        
        switch(ButtonType(rawValue: sender.tag)!) {
        case .speedSlow:
            playSound(rate: 0.3, echo: echoSwitch.isOn, reverb: reverbSwitch.isOn)
        case .speedNormal:
            playSound(rate: 1.0, echo: echoSwitch.isOn, reverb: reverbSwitch.isOn)
        case .speedFast:
            playSound(rate: 1.7, echo: echoSwitch.isOn, reverb: reverbSwitch.isOn)
        case .pitchLow:
            playSound(pitch: -1000, echo: echoSwitch.isOn, reverb: reverbSwitch.isOn)
        case .pitchNormal:
            playSound(pitch: 0, echo: echoSwitch.isOn, reverb: reverbSwitch.isOn)
        case .pitchHigh:
            playSound(pitch: 1000, echo: echoSwitch.isOn, reverb: reverbSwitch.isOn)
        }
    }
    
    @IBAction func stopButtonClicked(_ sender: Any) {
        print("stop button pressed")
        configureButtons(.notPlaying)
        stopAudio()
    }
    
    
    
}
