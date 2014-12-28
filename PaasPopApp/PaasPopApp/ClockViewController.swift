//
//  ClockViewController.swift
//  
//
//  Created by Fhict on 26/12/14.
//
//

import UIKit

class ClockViewController: UIViewController {

    @IBOutlet var lblDigitalClock: UILabel!
    
    @IBOutlet var imgvClockImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        println("testey")
        
        var width = self.view.frame.size.width
        var height = self.view.frame.size.height
        
        println(width)
        println(height)
        
        var image : UIImage = UIImage(named: "clockFace.png")!
        imgvClockImage.image = image;
        
        
        UIGraphicsBeginImageContext(self.view.frame.size)
        var rect : CGRect = CGRectMake(0.0, 0.0, 200, 200);
        var contextRef = UIGraphicsGetCurrentContext();
        
        
        CGContextSetLineWidth(contextRef, 2.0);
        CGContextSetStrokeColorWithColor(contextRef, UIColor.blackColor().CGColor);
        CGContextFillEllipseInRect(contextRef, rect);
        CGContextAddEllipseInRect(contextRef, rect);
        
        image.drawInRect(rect)
        
        println("post testey")
        
        var centerPt : CGPoint = CGPointMake(width / 2, height / 2);
        CGContextBeginPath(contextRef)
        CGContextAddArc(contextRef, centerPt.x, centerPt.y, 100.0, 0, CGFloat(M_2_PI), 0);
        CGContextStrokePath(contextRef);
        UIGraphicsEndImageContext();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
