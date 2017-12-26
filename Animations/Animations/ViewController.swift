//
//  ViewController.swift
//  Animations
//
//  Created by Wilmer Arteaga on 7/10/17.
//  Copyright © 2017 tinpu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var counter = 1
    var isAnimating = false
    var timer = Timer()
    
    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var button: UIButton!
    
    @objc func animate() {
        
        imagen.image = UIImage(named: "frame_\(counter)_delay-0.1s.gif")
        
        counter += 1
        
        if counter == 6 {
            counter = 0
        }
        
    }
    
    @IBAction func next(_ sender: Any) {
        
        if isAnimating {
            timer.invalidate()
            button.setTitle("Start Animation", for: [])
            isAnimating = false
        } else  {
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.animate), userInfo: nil, repeats: true)
            button.setTitle("Stop Animation", for: [])
            isAnimating = true
        }

    }
    
    @IBAction func fadeIn(_ sender: Any) {
        imagen.alpha = 0
        UIView.animate(withDuration: 1, animations: {
            self.imagen.alpha = 1
        })
    }
    
    @IBAction func slideIn(_ sender: Any) {
        imagen.center = CGPoint(x: imagen.center.x - 500, y: imagen.center.y)
        UIView.animate(withDuration: 2, animations: {
            self.imagen.center = CGPoint(x: self.imagen.center.x + 500, y: self.imagen.center.y)
        })
    }
    
    @IBAction func grow(_ sender: Any) {
        imagen.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        UIView.animate(withDuration: 1, animations: {
            self.imagen.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

