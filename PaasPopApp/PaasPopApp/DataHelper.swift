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
    
    class func getCacheDirectory() -> String {
        var paths = NSSearchPathForDirectoriesInDomains(.ApplicationSupportDirectory,.UserDomainMask, true);
        var cachePath: String = paths[0] as String
        return cachePath
    }
    
    class func getBlogItems() -> [BlogItem] {
        var storedData: NSData? = NSFileManager.defaultManager().contentsAtPath(DataHelper.getCacheDirectory() + "blog.json")
        if storedData != nil {
            println("Using cached data for Blog Items.")
            return getBlogItems(storedData!)
        } else {
            println("No cache data available.")
            return [BlogItem]()
        }
    }
    
    class func getBlogItems(data: NSData) -> [BlogItem] {
        var stored: Bool = NSFileManager.defaultManager().createFileAtPath(getCacheDirectory() + "blog.json", contents: data, attributes: nil)
        if stored {
            println("data stored")
        } else {
            println("not stored")
        }
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
    
    class func getTimeSlots() -> [TimeSlot] {
        var storedData: NSData? = NSFileManager.defaultManager().contentsAtPath(DataHelper.getCacheDirectory() + "acts.json")
        if storedData != nil {
            println("Using cached data for TimeSlots.")
            return getTimeSlots(storedData!)
        } else {
            println("No cache data available.")
            return [TimeSlot]()
        }
    }
    
    class func getTimeSlots(data: NSData) -> [TimeSlot] {
        var stored: Bool = NSFileManager.defaultManager().createFileAtPath(getCacheDirectory() + "acts.json", contents: data, attributes: nil)
        if stored {
            println("data stored")
        } else {
            println("not stored")
        }
        
        
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
