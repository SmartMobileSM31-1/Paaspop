//
//  BandDetailsViewController.swift
//  PaasPopApp
//
//  Created by Wouter Habets on 15-01-15.
//  Copyright (c) 2015 Maiko Hermans. All rights reserved.
//

import UIKit
import Alamofire

class ActDetailsViewController: UIViewController {
    
    var timeSlot: TimeSlot?

    @IBOutlet var labelTitle: UILabel!
    @IBOutlet var imageCover: UIImageView!
    @IBOutlet var imageBand: UIImageView!
    @IBOutlet var labelDescription: UITextView!
    @IBOutlet var buttonAdd: UIBarButtonItem!
    
    @IBAction func buttonAddAction(sender: UIBarButtonItem) {
        buttonAdd.image = UIImage(named: "StarFilled")
        var duplicate = false
        var storedTimeSlots: [TimeSlot]
        if let storedData = NSUserDefaults.standardUserDefaults().objectForKey("favorites") as? NSData {
            storedTimeSlots = NSKeyedUnarchiver.unarchiveObjectWithData(storedData) as [TimeSlot]
            for var i = 0; i < storedTimeSlots.count; i++ {
                if self.timeSlot?.act?.title == storedTimeSlots[i].act?.title {
                    println("is duplicate")
                    storedTimeSlots.removeAtIndex(i)
                    buttonAdd.image = UIImage(named: "Star")
                    duplicate = true
                    break
                }
            }
        } else {
            storedTimeSlots = [TimeSlot]()
        }

        if !duplicate {
            storedTimeSlots.append(timeSlot!)
        }
            storedTimeSlots.sort({ (timeSlot1, timeSlot2) -> Bool in
                return timeSlot1.act?.title < timeSlot2.act?.title
            })
            let data = NSKeyedArchiver.archivedDataWithRootObject(storedTimeSlots)
            NSUserDefaults.standardUserDefaults().setObject(data, forKey: "favorites")

    }
    
//    override func viewWillAppear(animated: Bool) {
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
//        self.navigationController?.navigationBar.shadowImage = UIImage()
//        self.navigationController?.navigationBar.translucent = true
//    }
//    
//    override func viewWillDisappear(animated: Bool) {
//        self.navigationController?.navigationBar.setBackgroundImage(nil, forBarMetrics: UIBarMetrics.Default)
//        self.navigationController?.navigationBar.shadowImage = nil
//        self.navigationController?.navigationBar.translucent = false
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelTitle.text = timeSlot?.act?.title
        self.navigationItem.title = timeSlot?.act?.title
        var photoUrl = self.timeSlot?.act?.photo
        self.labelDescription.text = self.timeSlot?.act?.actDescription
        println("Start: \(self.timeSlot?.start) End: \(self.timeSlot?.end)")
        if self.timeSlot?.act?.add != nil {
            self.labelDescription.text = (self.timeSlot?.act?.add)! + "\n\n"
        }
        if (self.timeSlot != nil) {
            Alamofire.request(.GET, photoUrl!)
                .response { (request, response, data, error) in
                    if error == nil {
                        self.imageCover.image = UIImage(data: data as NSData)
                        self.imageCover.clipsToBounds = true
                    }
            }
            let apiKey = "WUVZJBODI4TAKAJMJ"
            var actString: String = (self.timeSlot?.act?.title)!
            var formattedAct: String = actString.stringByReplacingOccurrencesOfString(" ", withString: "+", options: NSStringCompareOptions.LiteralSearch, range: nil)
            var apiUrl = NSURL(string: "http://developer.echonest.com/api/v4/artist/biographies?api_key=\(apiKey)&name=\(formattedAct)&format=json&results=1&start=0&license=cc-by-sa")!
            println("\(apiUrl)")
            Alamofire.request(.GET, apiUrl)
                .response { (request, response, data, error) in
                    if error == nil {
                        var bioString: String = DataHelper.getBioFromData(data as NSData)
                        self.labelDescription.text! += bioString
                    }
            }
        }
        
        
        if let storedData = NSUserDefaults.standardUserDefaults().objectForKey("favorites") as? NSData {
            var storedTimeSlots = NSKeyedUnarchiver.unarchiveObjectWithData(storedData) as [TimeSlot]
            for timeSlot in storedTimeSlots {
                if self.timeSlot?.act?.title == timeSlot.act?.title {
                    buttonAdd.image = UIImage(named: "StarFilled")
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
