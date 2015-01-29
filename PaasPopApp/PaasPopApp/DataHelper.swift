//
//  DataHelper.swift
//  PaasPopApp
//
//  Created by Wouter Habets on 22-01-15.
//  Copyright (c) 2015 Maiko Hermans. All rights reserved.
//

import Foundation
import Alamofire

class DataHelper {
    
    class func getBlogItems(data: NSData) -> [BlogItem] {
        var blogItemsData: NSData = data
        var blogItems: [BlogItem]
        blogItems = blogItemsParseData(blogItemsData)
        return blogItems
    }
    
    class func blogItemsParseData(data: NSData) -> [BlogItem] {
        var returnData: [BlogItem] = [BlogItem]()
        var error: NSError?
        let jsonData = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &error) as NSDictionary
        
        if error == nil {
            let blogItemsArray: NSArray = jsonData["news"] as NSArray
            for blogItem in blogItemsArray {
                returnData.append(BlogItem(fromNSDictionary: blogItem as NSDictionary))
            }
        }
        return returnData
    }
    
    class func getTimeSlots(data: NSData) -> [TimeSlot] {
        var timeSlotsData: NSData = data
        
        var timeSlots: [TimeSlot]
        
        timeSlots = timeSlotsParseData(timeSlotsData)
        
        
        return timeSlots
    }
    
    class func timeSlotsParseData(data: NSData) -> [TimeSlot] {
        var returnData: [TimeSlot]
        var error: NSError?
        let jsonData = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &error) as NSDictionary
        
        var timeSlots: [TimeSlot] = [TimeSlot]()
        
        if (error == nil) {
            
            let actsArray: NSArray = jsonData["acts"] as NSArray
            
            for act in actsArray {
                timeSlots.append(TimeSlot(fromNSDictionary: act as NSDictionary))
            }
        }
        
        return timeSlots
    }
}
