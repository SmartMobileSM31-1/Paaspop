//
//  ClockEditTableViewController.swift
//  PaasPopApp
//
//  Created by Wouter Habets on 03-01-15.
//  Copyright (c) 2015 Maiko Hermans. All rights reserved.
//

import UIKit

class ClockEditTableViewController: UITableViewController, UISearchBarDelegate, UISearchDisplayDelegate {
    
    // Contains all time slots
    var timeSlots: [TimeSlot] = DemoData.getTimeSlots()
    
    // Contains the search results
    var filteredTimeSlots: [TimeSlot] = [TimeSlot]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var bandDetailViewController: BandDetailsViewController = segue.destinationViewController as BandDetailsViewController
        var selectedIndex = self.tableView.indexPathForSelectedRow()!.row
        var selectedTimeSlot = timeSlots[selectedIndex]
        bandDetailViewController.timeSlot = selectedTimeSlot
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
        let cell = self.tableView.dequeueReusableCellWithIdentifier("bandCell", forIndexPath: indexPath) as UITableViewCell
        
        var timeSlot: TimeSlot
        
        // Check if the user is searching
        if tableView == self.searchDisplayController!.searchResultsTableView {
            timeSlot = filteredTimeSlots[indexPath.row]
        } else {
            timeSlot = timeSlots[indexPath.row]
        }
        
        cell.textLabel.text = timeSlot.band?.name
        cell.detailTextLabel?.text = timeSlot.podium?.description
        
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
            let stringMatch = timeSlot.band?.name.lowercaseString.rangeOfString(searchText)
            return (stringMatch != nil) // && categoryMatch
        })
    }
    
}
