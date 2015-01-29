//
//  AddFriendViewController.swift
//  PaasPopApp
//
//  Created by Wouter Habets on 29-01-15.
//  Copyright (c) 2015 Maiko Hermans. All rights reserved.
//

import UIKit

class AddFriendViewController: UIViewController {

    var friends: [Person]?
    
    @IBAction func addFriendAction(sender: UIBarButtonItem) {
        var f: [Person] = getFriends()
        f.append(Person(nameInput: textFieldName.text))
        setFriends(f)
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func getFriends() -> [Person] {
        if friends == nil {
            if let storedData = NSUserDefaults.standardUserDefaults().objectForKey("friends") as? NSData {
                friends = NSKeyedUnarchiver.unarchiveObjectWithData(storedData) as [Person]?
            } else {
                friends = [Person]()
            }
        }
        return friends!
    }
    
    func setFriends(newFriends: [Person]) {
        println("setFriends")
        for friend in newFriends {
            println("\(friend.name)")
        }
        let data = NSKeyedArchiver.archivedDataWithRootObject(newFriends)
        NSUserDefaults.standardUserDefaults().setObject(data, forKey: "friends")
    }
    
    @IBOutlet var textFieldName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
