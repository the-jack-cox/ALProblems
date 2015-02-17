//
//  HuggingViewController.swift
//  ALProblems
//
//  Created by Jack Cox on 1/12/15.
//  Copyright (c) 2015 CapTech Consulting. All rights reserved.
//

import UIKit

class HuggingViewController: UIViewController {

    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var rightHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func sliderChanged(sender: AnyObject) {
        
        if let slider = sender as? UISlider {
            heightConstraint?.constant = CGFloat(slider.value)
            rightHeightConstraint.constant = CGFloat(slider.value)
        }
    }
    
}