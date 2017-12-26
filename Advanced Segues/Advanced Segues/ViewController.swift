//
//  ViewController.swift
//  Advanced Segues
//
//  Created by Wilmer Arteaga on 15/10/17.
//  Copyright © 2017 tinpu. All rights reserved.
//

import UIKit

let globalVariable = "Wilmer"

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var activeRow = 0
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        cell.textLabel?.text = "Row \(indexPath.row)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        activeRow = indexPath.row
        performSegue(withIdentifier: "toSecondViewController", sender: nil)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondViewController" {
            let secondViewController = segue.destination as! SecondViewController
            secondViewController.activeRow = activeRow
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

