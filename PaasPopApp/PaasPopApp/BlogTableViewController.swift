//
//  BlogTableViewController.swift
//  PaasPopApp
//
//  Created by Wouter Habets on 29-01-15.
//  Copyright (c) 2015 Maiko Hermans. All rights reserved.
//

import UIKit
import Alamofire

class BlogTableViewController: UITableViewController {

    var blogItems: [BlogItem] = [BlogItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request(.GET, "http://wouterhabets.com/blog.json")
            .response { (request, response, data, error) in
                if error == nil {
                    self.blogItems = DataHelper.getBlogItems(data as NSData)
                    self.tableView.reloadData()
                } else {
                    self.blogItems = DataHelper.getBlogItems()
                    self.tableView.reloadData()
                }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return blogItems.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("blogCell", forIndexPath: indexPath) as UITableViewCell
        
        var blogItem: BlogItem = blogItems[indexPath.row]
        cell.textLabel?.text = blogItem.title
        cell.detailTextLabel?.text = blogItem.date
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var blogDetailViewController: BlogDetailViewController = segue.destinationViewController as BlogDetailViewController
        var selectedBlogItem: BlogItem
        
        var selectedRow = self.tableView.indexPathForSelectedRow()!.row
        selectedBlogItem = blogItems[selectedRow]
        blogDetailViewController.blogItem = selectedBlogItem
    }

}
