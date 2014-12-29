//
//  WebEndHandler.swift
//  PaasPopApp
//
//  Created by Fhict on 29/12/14.
//  Copyright (c) 2014 Maiko Hermans. All rights reserved.
//

import UIKit

class WebEndHandler: NSObject {
   
    // returns all timeslots
    func getTimeSlots() -> [TimeSlot]{
        var output = [TimeSlot]();
        
        return output;
    }
    
    // retrieves all timeslots associated with given schedule key / value
    // NOTE: needs to be figured out how useful this is, or whether it even fits in architecture
    func getScheduleSlots(scheduleName : String, schedule : Schedule) -> [TimeSlot]{
        var output = [TimeSlot]();
        
        return output;
    }
    
    // returns Friend object for given id
    func getFriendInfo(friendId : String) -> Friend?{
        
        return nil;
    }
    
    // takes an url, and returns an Image, ready for use
    func getPhoto(url : String) -> UIImage?{
        
        return nil;
    }
}
