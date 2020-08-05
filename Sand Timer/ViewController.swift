//
//  ViewController.swift
//  Sand Timer
//
//  Created by Lucy on 03/08/2020.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var RemainingTimeLabel: UILabel!
    
    let sandTimer = ["blue": 1*60, "green": 5*60, "red": 10*60]
    var timer = Timer()
    var secondsRemaining = 60
    var player: AVAudioPlayer!
    
    @IBAction func colorSelected(_ sender: UIButton) {
        
        timer.invalidate()
        let color = sender.currentTitle!
        secondsRemaining = sandTimer[color]!
        
    timer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector: #selector(updateTimer), userInfo:nil, repeats: true)
    }

     @objc func updateTimer() {
        if secondsRemaining > 0 {
        RemainingTimeLabel.text = "\(secondsRemaining) seconds!"
        secondsRemaining -= 1
        } else {
            timer.invalidate()
            RemainingTimeLabel.text = "DONE!"
            
        
        let url = Bundle.main.url(forResource: "alarm", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
            
        }
    }
}

