//
//  ViewController.swift
//  learn-sqlite
//
//  Created by Samrith Yoeun on 5/27/18.
//  Copyright © 2018 samrith. All rights reserved.
//

import UIKit
import SQLite

class ViewController: UIViewController {
    
    var database : Connection!
    let table = Table("tblPhoneBook")
    let id = Expression<Int>("id")

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        do {
            let database = try Connection(Bundle.main.path(forResource: "contact", ofType: "sqlite")!)
                
            self.database = database
            for user in try database.prepare(table) {
                print("id: \(user[id])")
            }
            
        }catch {
            print(error)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  

}



