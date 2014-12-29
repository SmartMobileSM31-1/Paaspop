//
//  TimeSlot.swift
//  PaasPopApp
//
//  Created by Fhict on 28/12/14.
//  Copyright (c) 2014 Maiko Hermans. All rights reserved.
//

import UIKit

class TimeSlot : NSObject {
    
    var podium : Podium? = nil;
    var periodStart : NSDate? = nil;
    var periodEnd : NSDate? = nil;
    var band : Band? = nil;
    
    init(podium : Podium, band : Band, start : NSDate, end : NSDate){
        self.podium = podium;
        self.periodStart = start;
        self.periodEnd = end;
        self.band = band;
    }
}