//
//  ALAnchorViewController.swift
//  ALProblems
//
//  Created by Jack Cox on 6/23/15.
//  Copyright © 2015 CapTech Consulting. All rights reserved.
//

import UIKit

class ALAnchorViewController: UIViewController {

    var red,blue,green,yellow : UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        red = UIView()
        red?.backgroundColor = UIColor.redColor()
        red?.translatesAutoresizingMaskIntoConstraints = false
        
        blue = UIView()
        blue?.backgroundColor = UIColor.blueColor()
        blue?.translatesAutoresizingMaskIntoConstraints = false
        
        green = UIView()
        green?.backgroundColor = UIColor.greenColor()
        green?.translatesAutoresizingMaskIntoConstraints = false
        
        yellow = UIView()
        yellow?.backgroundColor = UIColor.yellowColor()
        yellow?.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(red!)
        self.view.addSubview(blue!)
        self.view.addSubview(green!)
        self.view.addSubview(yellow!)
        
        self.arrangeViews()
    }

    func arrangeViews() {
        
        let margin = self.view.layoutMarginsGuide
        
        // layout out the first 2 colored blocks horizontally
        red?.leadingAnchor.constraintEqualToAnchor(margin.leadingAnchor).active = true
        red?.trailingAnchor.constraintEqualToAnchor(blue?.leadingAnchor).active = true
        blue?.trailingAnchor.constraintEqualToAnchor(margin.trailingAnchor).active = true
        
        // layout the 2nd 2 colored blocks horisontally
        green?.leadingAnchor.constraintEqualToAnchor(margin.leadingAnchor).active = true
        green?.trailingAnchor.constraintEqualToAnchor(yellow?.leadingAnchor).active = true
        yellow?.trailingAnchor.constraintEqualToAnchor(margin.trailingAnchor).active = true
        
        // red and blue tied to the top
        red?.topAnchor.constraintEqualToAnchor(margin.topAnchor).active = true
        blue?.topAnchor.constraintEqualToAnchor(margin.topAnchor).active = true
        
        // green and and yellow tied to the bottom of red and blue
        green?.topAnchor.constraintEqualToAnchor(red?.bottomAnchor).active = true
        yellow?.topAnchor.constraintEqualToAnchor(blue?.bottomAnchor).active = true
        
        // green and yellow tied to the bottom of the view
        green?.bottomAnchor.constraintEqualToAnchor(margin.bottomAnchor).active = true
        yellow?.bottomAnchor.constraintEqualToAnchor(margin.bottomAnchor).active = true
        
        
        // all views the same width
        red?.widthAnchor.constraintEqualToAnchor(blue?.widthAnchor).active = true
        red?.widthAnchor.constraintEqualToAnchor(green?.widthAnchor).active = true
        red?.widthAnchor.constraintEqualToAnchor(yellow?.widthAnchor).active = true
        
        // all views the same height
        red?.heightAnchor.constraintEqualToAnchor(blue?.heightAnchor).active = true;
        red?.heightAnchor.constraintEqualToAnchor(green?.heightAnchor).active = true;
        red?.heightAnchor.constraintEqualToAnchor(yellow?.heightAnchor).active = true;
    }


}
