//
//  CircleView.swift
//  PaasPopApp
//
//  Created by Wouter Habets on 31-01-15.
//  Copyright (c) 2015 Maiko Hermans. All rights reserved.
//

import UIKit

class CircleClockView: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
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
        CGContextSetLineWidth(context, 1.0);
        
        // Set the circle outerline-colour
        Color.UIColorFromRGB(0xfedb46).set()
        
        // Create Circle
        CGContextAddArc(context, (frame.size.width)/2, frame.size.height/2, 50, 0.0, CGFloat(M_PI * 2.0), 1)
        
        // Draw
        CGContextStrokePath(context);

    }
    
    func degreeToRadian(input:CGFloat)->CGFloat {
        let output = CGFloat(M_PI) * input/180;
        return output;
    }

}
