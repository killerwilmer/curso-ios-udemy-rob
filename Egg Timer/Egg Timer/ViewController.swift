//
//  ViewController.swift
//  Egg Timer
//
//  Created by Wilmer Arteaga on 20/07/17.
//  Copyright © 2017 tinpu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = Timer()
    
    var time = 210

    @IBOutlet weak var timerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func playPressed(_ sender: Any) {
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.decreaseTimer), userInfo: nil, repeats: true)
        
    }

    @IBAction func pausePressed(_ sender: Any) {
        timer.invalidate()
    }
    
    @IBAction func plusTenPressed(_ sender: Any) {
        
        time += 10
        timerLabel.text = String(time)
        
    }
    
    @IBAction func resetPressed(_ sender: Any) {
        
        time = 210
        timerLabel.text = String(time)
        
    }
    
    @IBAction func minusTenPressed(_ sender: Any) {
        
        if time > 10 {
            time -= 10
            timerLabel.text = String(time)
        }
        
    }
    
    func decreaseTimer() {
        
        if time > 0 {
            
            time -= 1
            
            timerLabel.text = String(time)
            
        } else {
            
            timer.invalidate()
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

