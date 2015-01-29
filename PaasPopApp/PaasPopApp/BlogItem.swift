//
//  BlogItem.swift
//  PaasPopApp
//
//  Created by Wouter Habets on 29-01-15.
//  Copyright (c) 2015 Maiko Hermans. All rights reserved.
//

import Foundation

class BlogItem {
    var title: String?
    var date: String?
    var subtitle: String?
    var text: String?
    
    init(title: String, date: String, subtitle: String, text: String) {
        self.title = title
        self.date = date
        self.subtitle = subtitle
        self.text = text
    }
    
    init(fromNSDictionary dictionary: NSDictionary) {
        self.title = dictionary["title"] as String?
        self.date = dictionary["date"] as String?
        self.subtitle = dictionary["subtitle"] as String?
        self.text = dictionary["text"] as String?
    }
    
}