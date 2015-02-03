//
//  FriendDetailViewController.swift
//  PaasPopApp
//
//  Created by Wouter Habets on 29-01-15.
//  Copyright (c) 2015 Maiko Hermans. All rights reserved.
//

import UIKit

class FriendDetailViewController: UIViewController, UITableViewDelegate {

    var fav: [String] = [String]()
    var friend: Person?
    @IBOutlet var labelName: UILabel!
    @IBOutlet var imageCover: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.imageCover.clipsToBounds = true
        
        if(friend?.name == "Geert")
        {
            fav = ["Anouk", "Ares", "Best of Foo", "Blues Pills"]
        }
        else if(friend?.name == "Maiko")
        {
            fav=["Broederliefde", "Cho", "dEUS", "Dotan"]
        }
        else if(friend?.name == "Wouter")
        {
            fav=["Colin Cloud", "Anouk", "Fresku", "I Am Kloot"]
        }
        else if(friend?.name == "Tijn")
        {
            fav=["Ares", "Broederliefde", "Fresku", "Henry van Loon"]
        }
        else
        {
            fav=["Liptease", "July Talk", "Joris Voorn", "Jett Rebel"]
        }
        
        // Do any additional setup after loading the view.
        labelName.text = friend?.name
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int
    {
        return self.fav.count
    }
    
    func tableView(tableView: UITableView!,
        cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!
    {
        let cell:UITableViewCell = UITableViewCell(style:UITableViewCellStyle.Default, reuseIdentifier:"cell")
        cell.textLabel?.text = fav[indexPath.row]
        
        return cell
    }

}
