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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        getFavoriteTimeSlots(true)
        tableView.reloadData()
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
        
        if force {
            for v in clockView.subviews {
                v.removeFromSuperview()
            }
            
            var circleView = CircleClockView(frame: CGRectMake(CGFloat(0), 0, CGFloat(200), CGFloat(200)))
            clockView.addSubview(circleView)
            
            for timeSlot in favoriteTimeSlots! {
                var timeSlotCercle = CircleTimeSlotView(frame: CGRectMake(CGFloat(0), 0, CGFloat(200), CGFloat(200)))
                timeSlotCercle.lineColor = timeSlot.color
                timeSlotCercle.startTime = timeSlot.getStartCGFloat()
                timeSlotCercle.endTime = timeSlot.getEndCGFloat()
                
                clockView.addSubview(timeSlotCercle)
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
        let cell = tableView.dequeueReusableCellWithIdentifier("timeSlotCell") as UITableViewCell
        
        var currentTimeSlot = getFavoriteTimeSlots(false)[indexPath.row]
        cell.textLabel?.text = currentTimeSlot.act?.title
        cell.textLabel?.textColor = currentTimeSlot.color
        
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            favoriteTimeSlots?.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            setFavoriteTimeSlots(favoriteTimeSlots!)
            getFavoriteTimeSlots(true)
        }
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if "favoriteActDetail" == segue.identifier {
            var actDetailViewController: ActDetailsViewController = segue.destinationViewController as ActDetailsViewController
            var selectedRow = tableView.indexPathForSelectedRow()?.row
            actDetailViewController.timeSlot = getFavoriteTimeSlots(false)[selectedRow!]
        }
    }
    

}
