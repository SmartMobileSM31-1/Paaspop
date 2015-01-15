//
//  BandDetailsViewController.swift
//  PaasPopApp
//
//  Created by Wouter Habets on 15-01-15.
//  Copyright (c) 2015 Maiko Hermans. All rights reserved.
//

import UIKit

class BandDetailsViewController: UIViewController {
    
    var timeSlot: TimeSlot?

    @IBOutlet var labelTitle: UILabel!
    @IBOutlet var labelDescription: UITextView!
    @IBOutlet var imageCover: UIImageView!
    @IBOutlet var imageBand: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelTitle.text = timeSlot?.band?.name
        labelDescription.text = timeSlot?.band?.description
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
