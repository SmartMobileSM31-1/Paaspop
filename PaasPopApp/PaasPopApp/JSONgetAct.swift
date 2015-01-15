//
//  JSONgetAct.swift
//  PaasPopApp
//
//  Created by Fhict on 15/01/15.
//  Copyright (c) 2015 Maiko Hermans. All rights reserved.
//

import Foundation

class JSONgetAct
{
    var events: [Band] = [Band]()
    
    func updateEventsTable() {
        
        let url: NSURL(string: "www.paaspop.nl/json/getact?ID=2-many-djs&callback=api")
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url, completionHandler: {received, response, networkError -> Void in
            if (networkError != nil) {
                println("Netwerk fout: \(networkError.localizedDescription)")

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
            self.events = [Band]()
            
            for item in eventsArray {
                let event: Band = parseNSDictionary(item as NSDictionary)
                self.events.append(event)
            }
            return true
        }
        
        return false
    }
    
    func parseNSDictionary(dictionary: NSDictionary) -> Band {
        var title: String = dictionary["title"] as String
        var add: String = dictionary["add"] as String
        var url_title: String = dictionary["url_title"] as String
        var bio: String = dictionary["bio"] as String
        var photo: String = dictionary["photo"] as String
        var times: String = dictionary["short-description"] as String
        var related: String = dictionary["long-description"] as String
        var ontdek: String = dictionary["ontdek"] as String
        
        var event = Schedule(title: title, date: date, time: time, location: location, imageUrl: imageUrl, descriptionShort: descriptionShort, descriptionLong: descriptionLong)
        
        return event
    }

}