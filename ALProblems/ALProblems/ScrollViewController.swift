//
//  FirstViewController.swift
//  ALProblems
//
//  Created by Jack Cox on 1/12/15.
//  Copyright (c) 2015 CapTech Consulting. All rights reserved.
//

import UIKit

class ScrollViewController: UIViewController {

    @IBOutlet weak var firstLabel: UILabel?
    
    let newText = "Gummi bears muffin cotton candy lollipop. Cake pudding sweet candy gummi bears sweet biscuit tart. Lollipop tart wafer sugar plum."
    

    @IBAction func addMoreText(sender: AnyObject) {
        self.firstLabel?.text = (self.firstLabel?.text ?? "") + self.newText
    }

}

