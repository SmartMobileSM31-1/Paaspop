//
//  FriendsTableViewController.swift
//  PaasPopApp
//
//  Created by Wouter Habets on 29-01-15.
//  Copyright (c) 2015 Maiko Hermans. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController {

    var friends: [Person]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var f: [Person] = getFriends(true)
    }
    
    override func viewDidAppear(animated: Bool) {
        getFriends(true)
        self.tableView.reloadData()
    }
    
    func getFriends(force: Bool) -> [Person] {
        if force {
            friends = nil
        }
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getFriends(false).count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("friendCell") as UITableViewCell
        cell.textLabel?.text = getFriends(false)[indexPath.row].name
        return cell
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            friends?.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            setFriends(friends!)
            getFriends(true)
        }
    }
}
