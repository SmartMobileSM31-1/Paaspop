//
//  CircleTimeSlotView.swift
//  PaasPopApp
//
//  Created by Wouter Habets on 31-01-15.
//  Copyright (c) 2015 Maiko Hermans. All rights reserved.
//

import UIKit

class CircleTimeSlotView: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    var startTime: CGFloat?
    var endTime: CGFloat?
    var lineColor: UIColor?
    var slotLayer: Int?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clearColor()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func drawRect(rect: CGRect) {
        // Get the Graphics Context
        var context = UIGraphicsGetCurrentContext();
        
        // Set the circle outerline-width
        CGContextSetLineWidth(context, 5.0);
        
        if lineColor == nil {
            println("Color is nil")
            lineColor = UIColor.redColor()
        }
        
        lineColor!.set()
        
        if (startTime == nil) || (endTime == nil) {
            println("Time is nil")
            startTime = CGFloat(0)
            endTime = CGFloat(0)
        }
        
        var lineWidth = 80
        if slotLayer != nil {
            switch slotLayer! {
            case 0: lineWidth = 80
            case 1: lineWidth = 85
            case 2: lineWidth = 90
            case 3: lineWidth = 95
            default: lineWidth = 80
            }
        }
        
        CGContextAddArc(context, (frame.size.width)/2, frame.size.height/2,  CGFloat(lineWidth), startTime!, endTime!, 0)
        CGContextStrokePath(context)
        
    }
    
    func degreeToRadian(input:CGFloat)->CGFloat {
        let output = CGFloat(M_PI) * input/180;
        return output;
    }
    
}
