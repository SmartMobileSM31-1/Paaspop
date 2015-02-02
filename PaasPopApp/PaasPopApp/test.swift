//
//  test.swift
//  PaasPopApp
//
//  Created by Fhict on 02/02/15.
//  Copyright (c) 2015 Paaspop. All rights reserved.
//

import Foundation
import UIKit
import RSBarcodes

class test:RSCodeReaderViewController
{
override func viewDidLoad() {
    super.viewDidLoad()
    
    self.focusMarkLayer.strokeColor = UIColor.redColor().CGColor
    
    self.cornersLayer.strokeColor = UIColor.yellowColor().CGColor
    
    self.tapHandler = { point in
        println(point)
    }
    
    self.barcodesHandler = { barcodes in
        for barcode in barcodes {
            println(barcode)
        }
    }
}
}