//
//  Person.swift
//  PaasPopApp
//
//  Created by Fhict on 28/12/14.
//  Copyright (c) 2014 Maiko Hermans. All rights reserved.
//

import UIKit

class Person: NSObject, NSCoding {
    
    var name: String?
    var schedules = [TimeSlot]()
    
    required convenience init(coder decoder: NSCoder) {
        self.init()
        self.name = decoder.decodeObjectForKey("name") as String?
        
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.name, forKey: "name")
    }
    
    override init() {
        
    }
    
    init(nameInput: String){
        self.name = nameInput
    }

    
}