//
//  MyPerson.swift
//  PaasPopApp
//
//  Created by Fhict on 28/12/14.
//  Copyright (c) 2014 Maiko Hermans. All rights reserved.
//

import UIKit

// unclear whether we need this, or plain "Person" suffices
class MyPerson: Person {
    
    // inserted because otherwise swift starts bitching about inits
    var dummyData : String = "";
    
    init(idInput : String, nameInput : String, dummyData : String){
        super.init(idInput : idInput, nameInput : nameInput);
        self.dummyData = dummyData;
    }
    
}
