//
//  ClockEditTableViewController.swift
//  PaasPopApp
//
//  Created by Wouter Habets on 03-01-15.
//  Copyright (c) 2015 Maiko Hermans. All rights reserved.
//

import UIKit
import Alamofire

class ClockEditTableViewController: UITableViewController, UISearchBarDelegate, UISearchDisplayDelegate {
    
    // Contains all time slots
    var timeSlots: [TimeSlot] = [TimeSlot]()
    
    // Contains the search results
    var filteredTimeSlots: [TimeSlot] = [TimeSlot]()
    
    override func viewDidLoad() {
        
//        timeSlots = DataHelper.getTimeSlots()
        Alamofire.request(.GET, "http://wouterhabets.com/acts.json")
            .response { (request, response, data, error) in
                if error == nil {
                    self.timeSlots = DataHelper.getTimeSlots(data as NSData)
                    self.tableView.reloadData()
                } else {
                    self.timeSlots = DataHelper.getTimeSlots()
                    self.tableView.reloadData()
                }
        }
        
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var actDetailViewController: ActDetailsViewController = segue.destinationViewController as ActDetailsViewController
        var selectedTimeSlot: TimeSlot
        
        if self.tableView == self.searchDisplayController!.searchResultsTableView {
            var selectedIndex = self.tableView.indexPathForSelectedRow()!.row
            selectedTimeSlot = filteredTimeSlots[selectedIndex]
        } else {
            var selectedIndex = self.tableView.indexPathForSelectedRow()!.row
            selectedTimeSlot = timeSlots[selectedIndex]
        }
        
        actDetailViewController.timeSlot = selectedTimeSlot
    }
    
    // Return the amount of cells to display
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count: Int
        
        // Check if the user is searching
        if tableView == self.searchDisplayController!.searchResultsTableView {
            count = filteredTimeSlots.count
        } else {
            count = timeSlots.count
        }
        
        return count
    }
    
    // Fill cells with data
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("actCell", forIndexPath: indexPath) as UITableViewCell
        
        var timeSlot: TimeSlot
        
        // Check if the user is searching
        if tableView == self.searchDisplayController!.searchResultsTableView {
            timeSlot = filteredTimeSlots[indexPath.row]
        } else {
            timeSlot = timeSlots[indexPath.row]
        }
        
        cell.textLabel?.text = timeSlot.act?.title
        
        return cell
    }
    
    func searchDisplayController(controller: UISearchDisplayController!, shouldReloadTableForSearchString searchString: String!) -> Bool {
        self.filterContentForSearchText(searchString)
        return true
    }
    
    func searchDisplayController(controller: UISearchDisplayController!, shouldReloadTableForSearchScope searchOption: Int) -> Bool {
        self.filterContentForSearchText(self.searchDisplayController!.searchBar.text)
        return true
    }
    
    func filterContentForSearchText(searchText: String) {
        self.filteredTimeSlots = self.timeSlots.filter({( timeSlot: TimeSlot) -> Bool in
            
            // Optional scope search code
            // let categoryMatch = (scope == "All") || (band.category == scope)
            let stringMatch = timeSlot.act?.title?.lowercaseString.rangeOfString(searchText)
            return (stringMatch != nil) // && categoryMatch
        })
    }
    
}
