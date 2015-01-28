//
//  DemoData.swift
//  PaasPopApp
//
//  Created by Wouter Habets on 03-01-15.
//  Copyright (c) 2015 Maiko Hermans. All rights reserved.
//

import Foundation
/*
class DemoData {
    class func getTimeSlots() -> [TimeSlot] {
        var timeSlots: [TimeSlot] = [TimeSlot]()
        for index in 0...15 {
            timeSlots.append(getTimeSlot(index, podiumId: index))
        }
        return timeSlots
    }
    
    class func getTimeSlot(bandId: Int, podiumId: Int) -> TimeSlot {
        var timeSlot: TimeSlot
        var band: Band = getBand(bandId)
        var podium: Podium = Podium()
        
        timeSlot = TimeSlot(podium: podium, band: band, start: NSDate(), end: NSDate())
        
        return timeSlot
    }
    
    class func getBand(id: Int) -> Band {
        switch id {
        case 0: return Band(name: "Against Me!", subName: "", bandDescription: "", photoURL: "")
        case 1: return Band(name: "Anouk", subName: "", bandDescription: "", photoURL: "")
        case 2: return Band(name: "Best of Foo", subName: "", bandDescription: "", photoURL: "")
        case 3: return Band(name: "The Bloody Beetroots", subName: "", bandDescription: "", photoURL: "")
        case 4: return Band(name: "Blues Pills", subName: "", bandDescription: "", photoURL: "")
        case 5: return Band(name: "Buraka Som Sistema", subName: "", bandDescription: "", photoURL: "")
        case 6: return Band(name: "Cho", subName: "", bandDescription: "", photoURL: "")
        case 7: return Band(name: "Colin Cloud", subName: "", bandDescription: "", photoURL: "")
        case 8: return Band(name: "The Cool Quest", subName: "", bandDescription: "", photoURL: "")
        case 9: return Band(name: "Dave Clarke", subName: "", bandDescription: "", photoURL: "")
        case 10: return Band(name: "The Dirty Daddies", subName: "", bandDescription: "", photoURL: "")
        case 11: return Band(name: "Dotan", subName: "", bandDescription: "", photoURL: "")
        case 12: return Band(name: "Dotan", subName: "", bandDescription: "", photoURL: "")
        case 13: return Band(name: "Fiddler's Green", subName: "", bandDescription: "", photoURL: "")
        case 14: return Band(name: "Fresku", subName: "", bandDescription: "", photoURL: "")
        case 15: return Band(name: "The Gentle Storm", subName: "", bandDescription: "", photoURL: "")
        default: return Band(name: "The Gentle Storm", subName: "", bandDescription: "", photoURL: "")
        }
    }
}
*/