//
//  Friend.swift
//  PaasPopApp
//
//  Created by Fhict on 28/12/14.
//  Copyright (c) 2014 Maiko Hermans. All rights reserved.
//

import UIKit

class Friend : Person {
    
    var friendDescription : String = "";
    
    init(idInput : String, nameInput : String, descr : String){
        super.init(idInput: idInput, nameInput: nameInput);
        self.friendDescription = descr;
    }
    
}