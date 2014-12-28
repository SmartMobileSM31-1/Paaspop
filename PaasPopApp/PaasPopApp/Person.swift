//
//  Person.swift
//  PaasPopApp
//
//  Created by Fhict on 28/12/14.
//  Copyright (c) 2014 Maiko Hermans. All rights reserved.
//

import UIKit

class Person : NSObject {
    
    var id : String = "";
    var name : String = "";
    // schedules are stored as dictionary - String being a description
    var schedules = [String : Schedule]();
    
    init(idInput : String, nameInput : String){
        self.id = idInput;
        self.name = nameInput;
    }

    
}