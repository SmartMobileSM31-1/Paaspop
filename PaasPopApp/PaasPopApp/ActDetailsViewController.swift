//
//  BandDetailsViewController.swift
//  PaasPopApp
//
//  Created by Wouter Habets on 15-01-15.
//  Copyright (c) 2015 Maiko Hermans. All rights reserved.
//

import UIKit

class ActDetailsViewController: UIViewController {
    
    var timeSlot: TimeSlot?

    @IBOutlet var labelTitle: UILabel!
    @IBOutlet var labelDescription: UITextView!
    @IBOutlet var imageCover: UIImageView!
    @IBOutlet var imageBand: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelTitle.text = timeSlot?.act.title
        labelDescription.text = "No data"
        self.navigationItem.title = timeSlot?.act.title
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
//        self.navigationController?.navigationBar.shadowImage = UIImage()
//        self.navigationController?.navigationBar.translucent = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
