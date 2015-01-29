//
//  ClockViewController.swift
//  
//
//  Created by Fhict on 26/12/14.
//
//

import UIKit


class ClockViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var lblDigitalClock: UILabel!
    
    @IBOutlet var clockFaceView: UIImageView!
    
    @IBOutlet var clockHandView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        self.getTimeFromStart();

        // Do any additional setup after loading the view.
        println("testey")
        
        var width = self.view.frame.size.width
        var height = self.view.frame.size.height
        
        println(width)
        println(height)
        
        // example how to insert image
//        var img : UIImage = UIImage(named: "clockFace.png")!
//        clockFaceView.image = img;
        
        let imgWidth : CGFloat = 250;
        let imgHeight : CGFloat = 250;
        
        var screen : CGRect = UIScreen.mainScreen().bounds;
        var leftBound = screen.midX - (imgWidth / 2);
        
        
        let startPoint = CGPoint(x: leftBound, y: 100);
        clockFaceView.frame.origin = startPoint;
        let imageSize = CGSize(width: imgWidth, height: imgHeight)
        clockHandView = UIImageView(frame: CGRect(origin: startPoint, size: imageSize))
        self.view.addSubview(clockHandView)
        let image = drawClockHand(imageSize)
        clockHandView.image = image
        
        */
    }
    /*
    func drawClockHand(size: CGSize) -> UIImage {
        // Setup our context
        let bounds = CGRect(origin: CGPoint.zeroPoint, size: size)
        let opaque = false
        let scale: CGFloat = 0
        UIGraphicsBeginImageContextWithOptions(size, opaque, scale)
        let context = UIGraphicsGetCurrentContext()
        
        let baseSize = size.height;
        
        // Setup complete, do drawing here
        CGContextSetStrokeColorWithColor(context, UIColor.redColor().CGColor)
        CGContextSetLineWidth(context, 2.0)
        
        CGContextStrokeRect(context, bounds)
        
//        //example (red crossed square)
//        CGContextBeginPath(context)
//        CGContextMoveToPoint(context, CGRectGetMinX(bounds), CGRectGetMinY(bounds))
//        CGContextAddLineToPoint(context, CGRectGetMaxX(bounds), CGRectGetMaxY(bounds))
//        CGContextMoveToPoint(context, CGRectGetMaxX(bounds), CGRectGetMinY(bounds))
//        CGContextAddLineToPoint(context, CGRectGetMinX(bounds), CGRectGetMaxY(bounds))
//        CGContextStrokePath(context)
        
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
        
        // draws rotated line
        CGContextSetStrokeColorWithColor(context, UIColor.yellowColor().CGColor);
        CGContextBeginPath(context);
        
        
        CGContextTranslateCTM(context, bounds.midX, bounds.midY);
        CGContextRotateCTM(context, degreeToRadian(-73));
        CGContextMoveToPoint(context, bounds.midX, bounds.midY);
        CGContextAddLineToPoint(context, bounds.midX, bounds.minY);
        CGContextTranslateCTM(context, -bounds.midX, -bounds.midY);
        CGContextStrokePath(context);
        
        var boundary : CGFloat = 15;
        
        var smallBounds : CGRect = CGRect(origin: CGPointMake(boundary, boundary), size: CGSize(width: baseSize - 2 * boundary, height: baseSize - 2 * boundary));
        CGContextSetStrokeColorWithColor(context, UIColor.blueColor().CGColor);
        CGContextBeginPath(context);
        CGContextAddEllipseInRect(context, smallBounds);
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
    
    // Returns how much time has elapsed since festival start
    func getTimeFromStart()->Double {
        let date = NSDate()
        let startSecondsFromEpoch : Double = 1428069600;
        let startDate = NSDate(timeIntervalSince1970: startSecondsFromEpoch);
        let nowFromEpoch = date.timeIntervalSince1970;
        println(round(nowFromEpoch));
        
        return round(nowFromEpoch - startSecondsFromEpoch);
    }
*/
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    var favoriteTimeSlots: [TimeSlot]?
    
    func getFavoriteTimeSlots() -> [TimeSlot] {
        if favoriteTimeSlots == nil {
            if let storedData = NSUserDefaults.standardUserDefaults().objectForKey("favorites") as? NSData {
                favoriteTimeSlots = NSKeyedUnarchiver.unarchiveObjectWithData(storedData) as [TimeSlot]?
            } else {
                favoriteTimeSlots = [TimeSlot]()
            }
        }
        return favoriteTimeSlots!
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getFavoriteTimeSlots().count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell_inf") as UITableViewCell
        cell.textLabel?.text = getFavoriteTimeSlots()[indexPath.row].act?.title
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            favoriteTimeSlots?.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
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
