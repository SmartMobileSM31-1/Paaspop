//
//  Band.swift
//  PaasPopApp
//
//  Created by Fhict on 28/12/14.
//  Copyright (c) 2014 Maiko Hermans. All rights reserved.
//

import UIKit

class Act {
    
    var title: String
    var add: String
    var urlTitle: String
    var photo: String
    
    init(title: String, add: String, urlTitle: String, photo: String) {
        self.title = title
        self.add = add
        self.urlTitle = urlTitle
        self.photo = photo
    }
    
    init(fromNSDictionary dictionary: NSDictionary) {
        self.title = dictionary["title"] as String
        self.add = dictionary["add"] as String
        self.urlTitle = dictionary["url_title"] as String
        self.photo = dictionary["photo"] as String
    }
   
}

