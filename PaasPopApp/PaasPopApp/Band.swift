//
//  Band.swift
//  PaasPopApp
//
//  Created by Fhict on 28/12/14.
//  Copyright (c) 2014 Maiko Hermans. All rights reserved.
//

import UIKit

class Band: NSObject {
    var name : String = "";
    var subName : String = "";
    var bandDescription : String = "";
    var photoURL : String = "";
    
    init(name : String, subName : String, bandDescription : String, photoURL : String) {
        self.name = name;
        self.subName = subName;
        self.bandDescription = bandDescription;
        self.photoURL = photoURL;
    }
   
}
