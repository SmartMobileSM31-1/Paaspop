//
//  RandomColor.swift
//  PaasPopApp
//
//  Created by Wouter Habets on 31-01-15.
//  Copyright (c) 2015 Maiko Hermans. All rights reserved.
//

import UIKit

class RandomColor {
    
    class func getColor(i: Int) -> UIColor {
        switch i {
        case 0: return UIColor.redColor()
        case 1: return UIColor.brownColor()
        case 2: return UIColor.blueColor()
        case 3: return UIColor.yellowColor()
        case 4: return UIColor.greenColor()
        case 5: return UIColor.orangeColor()
        case 6: return UIColor.purpleColor()
        case 7: return UIColor.cyanColor()
        case 8: return UIColor.magentaColor()
        default: return UIColor.blackColor()
        }
    }
}
