//
//  ViewController.swift
//  Back To Bach
//
//  Created by Wilmer Arteaga on 30/10/17.
//  Copyright © 2017 tinpu. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player = AVAudioPlayer()
    let audioPath = Bundle.main.path(forResource: "sheep", ofType: "mp3")
    var timer = Timer()
    
    @objc func updateScrubber() {
        scrubberSlider.value = Float(player.currentTime)
    }

    @IBAction func play(_ sender: Any) {
        player.play()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateScrubber), userInfo: nil, repeats: true)
    }
    
    @IBAction func volumeChanged(_ sender: Any) {
        player.volume = volumenSlider.value
    }
    @IBOutlet weak var volumenSlider: UISlider!
    
    @IBAction func scrubberMoved(_ sender: Any) {
        player.currentTime = TimeInterval(scrubberSlider.value)
    }
    @IBOutlet weak var scrubberSlider: UISlider!
    
    @IBAction func stop(_ sender: Any) {
        scrubberSlider.value = 0
        timer.invalidate()
        player.pause()
        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
        } catch {
            // Process error
        }
    }
    
    @IBAction func pause(_ sender: Any) {
        player.pause()
        timer.invalidate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
            scrubberSlider.maximumValue = Float(player.duration)
        } catch {
            // Process error
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

