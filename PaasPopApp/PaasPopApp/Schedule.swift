//
//  Schedule.swift
//  PaasPopApp
//
//  Created by Fhict on 28/12/14.
//  Copyright (c) 2014 Maiko Hermans. All rights reserved.
//

import UIKit

class Schedule : NSObject {
    
    var id : String = "";
    // String key being unique reference to time - no overlapping slots allowed
    var timeSlots = [String : TimeSlot]();
    
    init(idInput : String){
        self.id = idInput;
    }
    
}