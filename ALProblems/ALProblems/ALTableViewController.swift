//
//  ALTableViewController.swift
//  ALProblems
//
//  Created by Jack Cox on 2/16/15.
//  Copyright (c) 2015 CapTech Consulting. All rights reserved.
//

import UIKit

class ALTableViewController: UITableViewController {

    var catImages:[UIImage] = []
    var labelValues:[String] = []
    
     let newText = "Gummi bears muffin cotton candy lollipop. Cake pudding sweet candy gummi bears sweet biscuit tart. Lollipop tart wafer sugar plum."
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.automaticallyAdjustsScrollViewInsets = true
        self.tabBarController?.automaticallyAdjustsScrollViewInsets = true
        
        tableView.estimatedRowHeight = 100.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
        self.tableView.registerNib(UINib(nibName: "ALTableViewCell", bundle: nil), forCellReuseIdentifier: "ALTableViewCell")
        
        // generate random cat pictures and text
        let words = newText.componentsSeparatedByString(" ")
        for i in 1...12 {
            catImages.append(UIImage(named:"th-\(i)")!)
            
            var labelValue = ""
            for j in 1...((random() % 30)+1) {
                labelValue += words[random() % words.count]
                labelValue += " "
            }
            labelValues.append(labelValue)
        }
        
        self.tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return catImages.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ALTableViewCell", forIndexPath: indexPath) as ALTableViewCell

        // Configure the cell...
        
        cell.imageContent?.image = self.catImages[indexPath.row]
        cell.title?.text = labelValues[indexPath.row]
        return cell
    }
}
