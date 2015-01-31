//
//  RandomColor.swift
//  PaasPopApp
//
//  Created by Wouter Habets on 31-01-15.
//  Copyright (c) 2015 Maiko Hermans. All rights reserved.
//

import UIKit

class Color {
    
    class func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    class func getRandomColor() -> UIColor{
        
        var randomRed:CGFloat = CGFloat(drand48())
        
        var randomGreen:CGFloat = CGFloat(drand48())
        
        var randomBlue:CGFloat = CGFloat(drand48())
        
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
        
    }
    
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
