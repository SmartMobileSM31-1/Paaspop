//
//  PaaspopNavBar.swift
//  PaasPopApp
//
//  Created by Wouter Habets on 04-02-15.
//  Copyright (c) 2015 Paaspop. All rights reserved.
//

import UIKit

class PaaspopNavBar {
    class func setup(navigationController: UINavigationController) {
        navigationController.navigationBar.tintColor = Color.UIColorFromRGB(0xfedb46)
        navigationController.navigationBar.barTintColor = Color.UIColorFromRGB(0xff7f00)
        var titleFont: UIFont = UIFont(name: "American Captain", size: 21)!
        let titleDict: [NSObject : AnyObject] = [NSForegroundColorAttributeName: Color.UIColorFromRGB(0xfedb46), NSFontAttributeName: titleFont]
        navigationController.navigationBar.titleTextAttributes = titleDict
    }
}
