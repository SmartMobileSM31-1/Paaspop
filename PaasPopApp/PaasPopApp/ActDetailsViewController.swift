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
    @IBOutlet var labelAdd: UILabel!
    @IBOutlet var labelDescription: UITextView!
    
    @IBAction func buttonAddAction(sender: UIBarButtonItem) {
        var storedTimeSlots: [TimeSlot]
        var duplicate = false
        if let storedData = NSUserDefaults.standardUserDefaults().objectForKey("favorites") as? NSData {
            storedTimeSlots = NSKeyedUnarchiver.unarchiveObjectWithData(storedData) as [TimeSlot]
            for timeSlot in storedTimeSlots {
                if self.timeSlot?.act?.title == timeSlot.act?.title {
                    duplicate = true
                }
            }
        } else {
            storedTimeSlots = [TimeSlot]()
        }

        if !duplicate {
            storedTimeSlots.append(timeSlot!)
            storedTimeSlots.sort({ (timeSlot1, timeSlot2) -> Bool in
                return timeSlot1.act?.title < timeSlot2.act?.title
            })
            let data = NSKeyedArchiver.archivedDataWithRootObject(storedTimeSlots)
            NSUserDefaults.standardUserDefaults().setObject(data, forKey: "favorites")
        }

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
        self.labelAdd.text = timeSlot?.act?.add
        var photoUrl = self.timeSlot?.act?.photo
        self.labelDescription.text = self.timeSlot?.act?.actDescription
        println("Start: \(self.timeSlot?.start) End: \(self.timeSlot?.end)")
        if (self.timeSlot != nil) {
            Alamofire.request(.GET, photoUrl!)
                .response { (request, response, data, error) in
                    if error == nil {
                        self.imageCover.image = UIImage(data: data as NSData)
                        self.imageCover.clipsToBounds = true
                    }
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
