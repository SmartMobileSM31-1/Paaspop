//
//  JSONgetBlog.swift
//  PaasPopApp
//
//  Created by Fhict on 15/01/15.
//  Copyright (c) 2015 Maiko Hermans. All rights reserved.
//

import Foundation

class JSONgetBlog
{
    var events: [Schedule] = [Schedule]()
    
    func updateEventsTable() {
        
        let url: NSURL(string: "www.paaspop.nl/json/getblog?callback=api")
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url, completionHandler: {received, response, networkError -> Void in
            if (networkError != nil) {
                println("Netwerk fout: \(networkError.localizedDescription)")
                //                var alert = UIAlertController(title: "Verbindings fout", message: "Er kon geen verbinding worden gemaakt met de server.", preferredStyle: UIAlertControllerStyle.Alert)
                //                alert.addAction(UIAlertAction(title: "Sluiten", style: UIAlertActionStyle.Default, handler: nil))
                //                self.presentViewController(alert, animated: true, completion: nil)
            } else {
                if (self.cacheManager.update(received)) {
                    self.events = self.cacheManager.getEvents()
                }
            }
            
            dispatch_async(dispatch_get_main_queue(), {
                self.events = self.cacheManager.getEvents()
                self.eventsTableView!.reloadData()
                if (self.didSwipeDown) {
                    self.refreshControl.endRefreshing()
                    self.didSwipeDown = false
                }
            })
            
        })
        
        task.resume()
    }
    
    private func parseEvents(data: NSData) -> Bool {
        var error: NSError?
        let jsonData = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &error) as NSDictionary
        
        if (error == nil) {
            
            let eventsArray: NSArray = jsonData["events"] as NSArray
            self.events = [Schedule]()
            
            for item in eventsArray {
                let event: Schedule = parseNSDictionary(item as NSDictionary)
                self.events.append(event)
            }
            return true
        }
        
        return false
    }
    
    func parseNSDictionary(dictionary: NSDictionary) -> Schedule {
        var title: String = dictionary["title"] as String
        var date: String = dictionary["date"] as String
        var time: String = dictionary["time"] as String
        var location: String = dictionary["location"] as String
        var imageUrl: String = dictionary["image-url"] as String
        var descriptionShort: String = dictionary["short-description"] as String
        var descriptionLong: String = dictionary["long-description"] as String
        
        var event = Schedule(title: title, date: date, time: time, location: location, imageUrl: imageUrl, descriptionShort: descriptionShort, descriptionLong: descriptionLong)
        
        return event
    }

}