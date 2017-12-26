//
//  ViewController.swift
//  Menu Bars
//
//  Created by Wilmer Arteaga on 20/07/17.
//  Copyright © 2017 tinpu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.processTimer), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func processTimer() {
        
        print("A second has passed!")
        
    }

    @IBAction func cameraPressed(_ sender: Any) {
        
        timer.invalidate()
        print("Camera pressed")
        
    }

}

