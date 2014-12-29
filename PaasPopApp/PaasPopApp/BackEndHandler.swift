//
//  BackEndHandler.swift
//  PaasPopApp
//
//  Created by Fhict on 29/12/14.
//  Copyright (c) 2014 Maiko Hermans. All rights reserved.
//

import UIKit

class BackEndHandler: NSObject {
   
    // loads dictionary containing personal schedules
    func loadUserSchedules() -> [String : Schedule]{
        var output = [String : Schedule]();
        
        return output;
    }
    
    // saves a single schedule
    func saveSchedule(inputName : String, inputSchedule : Schedule){
        
    }
    
    // loads an array of friends
    func loadFriends() -> [Friend]{
        var output = [Friend]()
        
        return output;
    }
    
    // loads a dictionary of schedules associated with given friend
    func loadFriendSchedules(inputFriend : Friend) -> [String : Schedule]{
        var output = [String : Schedule]();
        
        return output;
    }
    
    // saves a schedule for given friend 
    // NOTE: should we allow people to assign schedules to friends? Could have functionality?
    func saveFriendSchedule(inputFriend : Friend, inputScheduleName : String, inputSchedule : Schedule){
        
    }
    
    
    
}
