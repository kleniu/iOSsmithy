//
//  PlayViewControllerExtension.swift
//  Audio Recording
//
//  Created by Robert Kleniewski on 12/2/18.
//  Copyright © 2018 Robert Kleniewski. All rights reserved.
//

import UIKit
import AVFoundation

// this extends existing PlayViewController class
extension PlayViewController: AVAudioPlayerDelegate {
    
    struct Alerts {
        static let PlayFailedTitle   = "Play failed"
        static let PlayFailedMessage = "Cannot play the recorded sample"
        static let PlayFailedButton  = "Dismiss"
        // audio file errors
        static let AudioFileErrorTitle   = "Audio File Error"
        static let AudioFileErrorMessage = "Error: "
        static let AudioFileButton       = "Dismiss"
        // audio engine errors
        static let AudioEngineErrorTitle   = "Audio Engine Error"
        static let AudioEngineErrorMessage = "Error: "
        static let AudioEngineButton       = "Dissmiss"
    }
    
    enum PlayingState {
        case playing
        case notPlaying
    }
    
    func showAlert(title: String, message: String, buttonText: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonText, style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func setupAudio() {
        do {
            // uncomment to simulate error
            // recordingUrl.appendPathComponent("test")
            /// print("DEBUG \(recordingUrl.absoluteString)")
            recordingFile = try AVAudioFile(forReading: recordingUrl as URL)
        } catch {
            showAlert(title: Alerts.AudioFileErrorTitle,  message: Alerts.AudioFileErrorMessage + String(describing: error), buttonText: Alerts.AudioFileButton)
        }
    }
    
    func playSound(rate: Float? = nil, pitch: Float? = nil, echo: Bool = false, reverb: Bool = false) {
        
        // initialize audio engine components
        audioEngine = AVAudioEngine()
        
        // node for playing audio
        audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attach(audioPlayerNode)
        
        // node for adjusting rate/pitch
        let changeRatePitchNode = AVAudioUnitTimePitch()
        if let pitch = pitch {
            changeRatePitchNode.pitch = pitch
        }
        if let rate = rate {
            changeRatePitchNode.rate = rate
        }
        audioEngine.attach(changeRatePitchNode)
        
        // node for echo
        let echoNode = AVAudioUnitDistortion()
        echoNode.loadFactoryPreset(.multiEcho1)
        audioEngine.attach(echoNode)
        
        // node for reverb
        let reverbNode = AVAudioUnitReverb()
        reverbNode.loadFactoryPreset(.cathedral)
        reverbNode.wetDryMix = 50
        audioEngine.attach(reverbNode)
        
        // connect nodes
        if echo == true && reverb == true {
            connectAudioNodes(audioPlayerNode, changeRatePitchNode, echoNode, reverbNode, audioEngine.outputNode)
        } else if echo == true {
            connectAudioNodes(audioPlayerNode, changeRatePitchNode, echoNode, audioEngine.outputNode)
        } else if reverb == true {
            connectAudioNodes(audioPlayerNode, changeRatePitchNode, reverbNode, audioEngine.outputNode)
        } else {
            connectAudioNodes(audioPlayerNode, changeRatePitchNode, audioEngine.outputNode)
        }
        
        // schedule to play and start the engine!
        audioPlayerNode.stop()
        audioPlayerNode.scheduleFile(recordingFile, at: nil) {
            
            var delayInSeconds: Double = 0
            
            if let lastRenderTime = self.audioPlayerNode.lastRenderTime, let playerTime = self.audioPlayerNode.playerTime(forNodeTime: lastRenderTime) {
                
                if let rate = rate {
                    delayInSeconds = Double(self.recordingFile.length - playerTime.sampleTime) / Double(self.recordingFile.processingFormat.sampleRate) / Double(rate)
                } else {
                    delayInSeconds = Double(self.recordingFile.length - playerTime.sampleTime) / Double(self.recordingFile.processingFormat.sampleRate)
                }
            }
            
            // schedule a stop timer for when audio finishes playing
            self.stopTimer = Timer(timeInterval: delayInSeconds, target: self, selector: #selector(PlayViewController.stopAudio), userInfo: nil, repeats: false)
            RunLoop.main.add(self.stopTimer!, forMode: RunLoop.Mode.default)
        }
        
        do {
            try audioEngine.start()
        } catch {
            showAlert(title: Alerts.AudioEngineErrorTitle, message: Alerts.AudioEngineErrorMessage + String(describing: error), buttonText: Alerts.AudioEngineButton)
            return
        }
        
        // play the recording!
        audioPlayerNode.play()
    }
    
    func connectAudioNodes(_ nodes: AVAudioNode...) {
        for x in 0..<nodes.count-1 {
            audioEngine.connect(nodes[x], to: nodes[x+1], format: recordingFile.processingFormat)
        }
    }
    
    @objc func stopAudio() {
        
        if let audioPlayerNode = audioPlayerNode {
            audioPlayerNode.stop()
        }
        
        if let stopTimer = stopTimer {
            stopTimer.invalidate()
        }
        
        configureButtons(.notPlaying)
        
        if let audioEngine = audioEngine {
            audioEngine.stop()
            audioEngine.reset()
        }
    }
    
    
    // MARK: UI methods
    func configureButtons(_ playState: PlayingState) {
        switch(playState) {
        case .playing:
            enablePlayButtons(false)
            playStopButton.isEnabled = true
        case .notPlaying:
            enablePlayButtons(true)
            playStopButton.isEnabled = false
        }
    }
    
    func enablePlayButtons(_ enabled: Bool) {
        speedSlowButton.isEnabled   = enabled
        speedNormalButton.isEnabled = enabled
        speedFastButton.isEnabled   = enabled
        pitchLowButton.isEnabled    = enabled
        pitchNormalButton.isEnabled = enabled
        pitchHighButton.isEnabled   = enabled
    }
  
}
