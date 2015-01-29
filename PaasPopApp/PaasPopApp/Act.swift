//
//  Band.swift
//  PaasPopApp
//
//  Created by Fhict on 28/12/14.
//  Copyright (c) 2014 Maiko Hermans. All rights reserved.
//

import UIKit

class Act: NSObject, NSCoding {
    
    var title: String?
    var add: String?
    var urlTitle: String?
    var photo: String?
    var actDescription: String?
    
    required convenience init(coder decoder: NSCoder) {
        self.init()
        self.title = decoder.decodeObjectForKey("title") as String?
        self.add = decoder.decodeObjectForKey("add") as String?
        self.urlTitle = decoder.decodeObjectForKey("urlTitle") as String?
        self.photo = decoder.decodeObjectForKey("photo") as String?
        self.actDescription = decoder.decodeObjectForKey("description") as String?
        
    }
    
    func encodeWithCoder(coder: NSCoder) {
        coder.encodeObject(self.title, forKey: "title")
        coder.encodeObject(self.add, forKey: "add")
        coder.encodeObject(self.urlTitle, forKey: "urlTitle")
        coder.encodeObject(self.photo, forKey: "photo")
        coder.encodeObject(self.actDescription, forKey: "description")
    }
    
    override init() {
        
    }
    
    init(title: String, add: String, urlTitle: String, photo: String) {
        self.title = title
        self.add = add
        self.urlTitle = urlTitle
        self.photo = photo
        self.actDescription = ""
        
        if title == "Anouk" {
            self.actDescription = "Anouk Teeuwe (born 8 April 1975), professionally known by the mononym Anouk, is a Dutch singer-songwriter and producer. After her breakthrough in 1997 with the single \"Nobody's Wife\", she had numerous hit singles in the Dutch and Belgian charts, such as \"R U Kiddin' Me\", \"Michel\", \"Girl\", \"Lost\", \"Modern World\", \"Three Days in a Row\" and \"Woman\"."
        }
    }
    
    init(fromNSDictionary dictionary: NSDictionary) {
        self.title = dictionary["title"] as String?
        self.add = dictionary["add"] as String?
        self.urlTitle = dictionary["url_title"] as String?
        self.photo = dictionary["photo"] as String?
    }
   
}

