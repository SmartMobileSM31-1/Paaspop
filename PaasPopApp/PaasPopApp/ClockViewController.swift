//
//  ClockViewController.swift
//  
//
//  Created by Fhict on 26/12/14.
//
//

import UIKit


class ClockViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var clockView: UIView!
    
    var colorCounter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        var timeSlotCercle = CircleTimeSlotView(frame: CGRectMake(CGFloat(0), 0, circleWidth, circleHeight))
//        timeSlotCercle.lineColor = UIColor.blueColor()
//        timeSlotCercle.startTime = TimeSlot.timeToCGFloat("12:00")
//        timeSlotCercle.endTime = TimeSlot.timeToCGFloat("14:00")
        
        

//        clockView.addSubview(timeSlotCercle)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        getFavoriteTimeSlots(true)
        clearClock()
        tableView.reloadData()
    }
    
    func clearClock() {
        colorCounter = 0
        
        for v in clockView.subviews {
            v.removeFromSuperview()
        }
        
        var circleView = CircleClockView(frame: CGRectMake(CGFloat(0), 0, CGFloat(200), CGFloat(200)))
        clockView.addSubview(circleView)
    }
    
    var favoriteTimeSlots: [TimeSlot]?
    
    func getFavoriteTimeSlots(force: Bool) -> [TimeSlot] {
        if force {
            favoriteTimeSlots = nil
        }
        if favoriteTimeSlots == nil {
            if let storedData = NSUserDefaults.standardUserDefaults().objectForKey("favorites") as? NSData {
                favoriteTimeSlots = NSKeyedUnarchiver.unarchiveObjectWithData(storedData) as [TimeSlot]?
            } else {
                favoriteTimeSlots = [TimeSlot]()
            }
        }
        return favoriteTimeSlots!
    }
    
    func setFavoriteTimeSlots(newTimeSlots: [TimeSlot]) {
        let data = NSKeyedArchiver.archivedDataWithRootObject(newTimeSlots)
        NSUserDefaults.standardUserDefaults().setObject(data, forKey: "favorites")
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getFavoriteTimeSlots(false).count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell_inf") as UITableViewCell
        
        
        var currentTimeSlot = getFavoriteTimeSlots(false)[indexPath.row]
        cell.textLabel?.text = currentTimeSlot.act?.title
        
        if (currentTimeSlot.start != nil) && (currentTimeSlot.end != nil) {
            var currentColor = RandomColor.getColor(colorCounter)
            cell.textLabel?.textColor = currentColor
            
            var timeSlotCercle = CircleTimeSlotView(frame: CGRectMake(CGFloat(0), 0, CGFloat(200), CGFloat(200)))
            timeSlotCercle.lineColor = currentColor
            timeSlotCercle.startTime = currentTimeSlot.getStartCGFloat()
            timeSlotCercle.endTime = currentTimeSlot.getEndCGFloat()
            
            clockView.addSubview(timeSlotCercle)
            
            colorCounter++
        }
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            clearClock()
            favoriteTimeSlots?.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            setFavoriteTimeSlots(favoriteTimeSlots!)
            getFavoriteTimeSlots(true)
            self.tableView.reloadData()
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
