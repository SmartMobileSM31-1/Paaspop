//
//  BlogDetailViewController.swift
//  PaasPopApp
//
//  Created by Wouter Habets on 29-01-15.
//  Copyright (c) 2015 Maiko Hermans. All rights reserved.
//

import UIKit

class BlogDetailViewController: UIViewController {

    var blogItem: BlogItem?
    
    @IBOutlet var labelTitle: UILabel!
    @IBOutlet var labelSubtitle: UILabel!
    @IBOutlet var labelDateTime: UILabel!
    @IBOutlet var labelText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelTitle.text = blogItem?.title
        labelSubtitle.text = blogItem?.subtitle
        labelDateTime.text = blogItem?.date
        labelText.text = blogItem?.text
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
