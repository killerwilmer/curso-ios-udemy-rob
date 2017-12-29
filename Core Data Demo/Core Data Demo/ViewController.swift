//
//  ViewController.swift
//  Core Data Demo
//
//  Created by Wilmer Arteaga on 27/12/17.
//  Copyright © 2017 tinpu. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        /*
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
        newUser.setValue("vandamme", forKey: "username")
        newUser.setValue("mypass", forKey: "password")
        newUser.setValue(6, forKey: "age")
         // For save
        do {
            try context.save();
            print("Saved")
        } catch {
            print("There was an error")
        }
        */
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        // For querys
        //request.predicate = NSPredicate(format: "username = %@", "leonel")
        request.returnsObjectsAsFaults = false
        do {
            let results = try context.fetch(request)
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                    if let username = result.value(forKey: "username") as? String {
                        /*
                         // For delete
                         context.delete(result)
                        do {
                            try context.save()
                        } catch {
                            print("Delete failed")
                        }
                        
                         // For update
                        result.setValue("leonel", forKey: "username")
                        do {
                            try context.save()
                        } catch {
                            print("Rename failed")
                        }*/
                        print(username)
                    }
                }
            } else {
                print("No results")
            }
        } catch {
            print("Couldn't fetch results")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

