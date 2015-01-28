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
//        var storedList: [TimeSlot]? = NSUserDefaults.standardUserDefaults().objectForKey("favorites") as? [TimeSlot]
//        if storedList == nil {
//            storedList = [TimeSlot]()
//        }
//        storedList?.append(self.timeSlot!)
//        NSUserDefaults.standardUserDefaults().setObject(storedList as NSDictionary, forKey: "favorites")

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelTitle.text = timeSlot?.act.title
        self.navigationItem.title = timeSlot?.act.title
        self.labelAdd.text = timeSlot?.act.add
        
        var photoUrl = self.timeSlot?.act.photo
        
        if (self.timeSlot != nil) {
            Alamofire.request(.GET, photoUrl!)
                .response { (request, response, data, error) in
                    self.imageCover.image = UIImage(data: data as NSData)
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
