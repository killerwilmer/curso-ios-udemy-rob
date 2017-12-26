//
//  ViewController.swift
//  Audio Player
//
//  Created by Wilmer Arteaga on 39/10/17.
//  Copyright © 2017 tinpu. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player = AVAudioPlayer()

    @IBAction func play(_ sender: AnyObject) {
        
        player.play()
        
    }
    
    @IBAction func pause(_ sender: AnyObject) {
        
        player.pause()
        
    }
    
    @IBAction func sliderMoved(_ sender: AnyObject) {
        
        player.volume = slider.value
        
    }
    
    @IBOutlet var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let audioPath = Bundle.main.path(forResource: "sheep", ofType: "mp3") // Bundle.main().pathForResource("sheep", ofType: "mp3") is now Bundle.main.path(forResource: "sheep", ofType: "mp3")
        
        do {
            
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
            player.play()
            
            
            
        } catch {
            
            // Process any errors
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

