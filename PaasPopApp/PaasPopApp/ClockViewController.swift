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
    
    @IBOutlet var clockFaceView: UIImageView!
    
    @IBOutlet var clockHandView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        println("testey")
        
        var width = self.view.frame.size.width
        var height = self.view.frame.size.height
        
        println(width)
        println(height)
        
        // example how to insert image
        var img : UIImage = UIImage(named: "clockFace.png")!
        clockFaceView.image = img;
        
        
        
        let startPoint = CGPoint(x: 100, y: 100);
        clockFaceView.frame.origin = startPoint;
        let imageSize = CGSize(width: 200, height: 200)
        clockHandView = UIImageView(frame: CGRect(origin: startPoint, size: imageSize))
        self.view.addSubview(clockHandView)
        let image = drawClockHand(imageSize)
        clockHandView.image = image
        
        
    }
    
    func drawClockHand(size: CGSize) -> UIImage {
        // Setup our context
        let bounds = CGRect(origin: CGPoint.zeroPoint, size: size)
        let opaque = false
        let scale: CGFloat = 0
        UIGraphicsBeginImageContextWithOptions(size, opaque, scale)
        let context = UIGraphicsGetCurrentContext()
        
        // Setup complete, do drawing here
        CGContextSetStrokeColorWithColor(context, UIColor.redColor().CGColor)
        CGContextSetLineWidth(context, 2.0)
        
        CGContextStrokeRect(context, bounds)
        
        //example (red crossed square)
        CGContextBeginPath(context)
        CGContextMoveToPoint(context, CGRectGetMinX(bounds), CGRectGetMinY(bounds))
        CGContextAddLineToPoint(context, CGRectGetMaxX(bounds), CGRectGetMaxY(bounds))
        CGContextMoveToPoint(context, CGRectGetMaxX(bounds), CGRectGetMinY(bounds))
        CGContextAddLineToPoint(context, CGRectGetMinX(bounds), CGRectGetMaxY(bounds))
        CGContextStrokePath(context)
        
        // draws clock hand
        CGContextSetStrokeColorWithColor(context, UIColor.greenColor().CGColor);
        CGContextBeginPath(context);
        CGContextMoveToPoint(context, bounds.midX, bounds.midY);
        CGContextAddLineToPoint(context, bounds.midX, bounds.minY);
        CGContextStrokePath(context);
        
        // draws clock circle
        CGContextSetStrokeColorWithColor(context, UIColor.blueColor().CGColor);
        CGContextBeginPath(context);
        CGContextAddEllipseInRect(context, bounds);
        CGContextStrokePath(context);
        
        // Drawing complete, retrieve the finished image and cleanup
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    // returns given number of degrees expressed in radians
    func degreeToRadian(input:CGFloat)->CGFloat {
        let output = CGFloat(M_PI) * input/180;
        return output;
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
