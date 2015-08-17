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
        viewUpperLeft.accessibilityIdentifier = "blue"
        views.append(viewUpperLeft)
        
        viewUpperRight = UIView()
        viewUpperRight.backgroundColor = UIColor.orangeColor()
        viewUpperRight.accessibilityIdentifier = "orange"
        views.append(viewUpperRight)
        
        viewLowerLeft = UIView()
        viewLowerLeft.backgroundColor = UIColor.redColor()
        viewLowerLeft.accessibilityIdentifier = "red"
        views.append(viewLowerLeft)
        
        viewLowerRight = UIView()
        viewLowerRight.backgroundColor = UIColor.greenColor()
        viewLowerRight.accessibilityIdentifier = "green"
        views.append(viewLowerRight)
        
    }
    
    func styleButtons() {
        var i = 1
        for view in self.views {
            view.translatesAutoresizingMaskIntoConstraints = false
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
        let horizontalConstraints1 = NSLayoutConstraint.constraintsWithVisualFormat("H:|-(10)-[upperLeft(==292)]-[upperRight(==upperLeft)]-(10)-|", options: [], metrics: nil, views: views)
        self.view.addConstraints(horizontalConstraints1)
        let horizontalConstraints2 = NSLayoutConstraint.constraintsWithVisualFormat("H:|-(10)-[lowerLeft(==upperLeft)]-[lowerRight(==upperLeft)]-(10)-|", options: [], metrics: nil, views: views)
        self.view.addConstraints(horizontalConstraints2)
        
        //Vertical constraints
        let verticalConstraints1 = NSLayoutConstraint.constraintsWithVisualFormat("V:|-(10)-[upperLeft]-[lowerLeft(==upperLeft)]-(10)-|", options: [], metrics: nil, views: views)
        self.view.addConstraints(verticalConstraints1)
        let verticalConstraints2 = NSLayoutConstraint.constraintsWithVisualFormat("V:|-(10)-[upperRight(==upperLeft)]-[lowerRight(==upperLeft)]-(10)-|", options: [], metrics: nil, views: views)
        self.view.addConstraints(verticalConstraints2)
        
        
    }


}
