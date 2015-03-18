//
//  DebuggingDemoViewController.swift
//  ALProblems
//
//  Created by Jack Cox on 3/7/15.
//  Copyright (c) 2015 CapTech Consulting. All rights reserved.
//

import UIKit

class DebuggingDemoViewController: UIViewController {
    
    var viewUpperLeft:UIView!
    var viewUpperRight:UIView!
    var viewLowerLeft:UIView!
    var viewLowerRight:UIView!
    
    var views:[UIView] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.accessibilityIdentifier = "container"

        self.createButtons()
        self.styleButtons()
        
        self.placeButtons()
    }
    
    func createButtons() {
        
        viewUpperLeft = UIView()
        
        viewUpperLeft.backgroundColor = UIColor.blueColor()
        views.append(viewUpperLeft)
        
        viewUpperRight = UIView()
        viewUpperRight.backgroundColor = UIColor.orangeColor()
        views.append(viewUpperRight)
        
        viewLowerLeft = UIView()
        viewLowerLeft.backgroundColor = UIColor.redColor()
        views.append(viewLowerLeft)
        
        viewLowerRight = UIView()
        viewLowerRight.backgroundColor = UIColor.greenColor()
        views.append(viewLowerRight)
        
    }
    
    func styleButtons() {
        var i = 1
        for view in self.views {
            view.setTranslatesAutoresizingMaskIntoConstraints(false)
            view.layer.cornerRadius = 5
            //view.accessibilityIdentifier = "view-\(i)"
            i++
        }
        
    }
    
    func placeButtons() {
        
        for view in self.views {
            self.view.addSubview(view)
        }
        
        let views = Dictionary(dictionaryLiteral: ("upperLeft",viewUpperLeft),("upperRight",viewUpperRight),
            ("lowerLeft",viewLowerLeft), ("lowerRight", viewLowerRight))
        
        //Horizontal constraints
        let horizontalConstraints1 = NSLayoutConstraint.constraintsWithVisualFormat("H:|-(10)-[upperLeft][upperRight]-(10)-|", options: nil, metrics: nil, views: views)
        self.view.addConstraints(horizontalConstraints1)
        let horizontalConstraints2 = NSLayoutConstraint.constraintsWithVisualFormat("H:|-(10)-[lowerLeft]-[lowerRight]-(10)-|", options: nil, metrics: nil, views: views)
        self.view.addConstraints(horizontalConstraints2)
        
        //Vertical constraints
        let verticalConstraints1 = NSLayoutConstraint.constraintsWithVisualFormat("V:|-(10)-[upperLeft]-[lowerLeft(==upperLeft)]-(10)-|", options: nil, metrics: nil, views: views)
        self.view.addConstraints(verticalConstraints1)
        let verticalConstraints2 = NSLayoutConstraint.constraintsWithVisualFormat("V:|-(10)-[upperRight(==upperLeft)]-[lowerRight(==upperLeft)]-(10)-|", options: nil, metrics: nil, views: views)
        self.view.addConstraints(verticalConstraints2)
        
        
    }


}
