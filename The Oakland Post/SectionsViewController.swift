//
//  SectionsViewController.swift
//  The Oakland Post
//
//  Created by Andrew Clissold on 7/12/14.
//  Copyright (c) 2014 Andrew Clissold. All rights reserved.
//

import UIKit

class SectionsViewController: UITableViewController {

    let titles = ["News", "Life", "Sports", "Arts & Entertainment", "Opinion", "Satire"]
    let baseURLs = [
        "News": "http://www.oaklandpostonline.com/search/?q=&t=article&l=15&d=&s=start_time&sd=desc&c[]=news,news/*&f=rss",
        "Life": "http://www.oaklandpostonline.com/search/?q=&t=article&l=15&d=&s=start_time&sd=desc&c[]=life,life/*&f=rss",
        "Sports": "http://www.oaklandpostonline.com/search/?q=&t=article&l=15&d=&s=start_time&sd=desc&c[]=sports,sports/*&f=rss",
        "Arts & Entertainment": "http://www.oaklandpostonline.com/search/?q=&t=article&l=15&d=&s=start_time&sd=desc&c[]=arts_and_entertainment,arts_and_entertainment/*&f=rss",
        "Opinion": "http://www.oaklandpostonline.com/search/?q=&t=article&l=15&d=&s=start_time&sd=desc&c[]=opinion,opinion/*&f=rss",
        "Satire": "http://www.oaklandpostonline.com/search/?q=&t=article&l=15&d=&s=start_time&sd=desc&c[]=satire,satire/*&f=rss",
    ]

    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        let section = (sender as SectionsCell).titleLabel.text
        println("Should segue with baseURL \(baseURLs[section])") // TODO
    }

    // MARK: UITableViewDataSource

    override func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }

    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell? {
        let cell = tableView.dequeueReusableCellWithIdentifier(sectionsCellID, forIndexPath: indexPath) as SectionsCell

        cell.titleLabel.text = titles[indexPath.row]

        return cell
    }

    override func tableView(tableView: UITableView!, heightForRowAtIndexPath indexPath: NSIndexPath!) -> CGFloat {
        let ownHeight = view.bounds.height
        let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.height
        let navigationBarHeight = navigationController.navigationBar.bounds.height
        let tabBarHeight = tabBarController.tabBar.frame.height

        let availableHeight = ownHeight - statusBarHeight - navigationBarHeight - tabBarHeight

        return availableHeight / CGFloat(titles.count)
    }

    override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {
        // Create an Array of each cells' index path.
        let indexPaths = (0..<titles.count).map { NSIndexPath(forRow: $0, inSection: 0) }

        tableView.beginUpdates()
        // Convince the table view to query the row heights again.
        tableView.reloadRowsAtIndexPaths(indexPaths, withRowAnimation: .Fade)
        tableView.endUpdates()
    }

}
