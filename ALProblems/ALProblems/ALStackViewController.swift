//
//  ALStackViewController.swift
//  ALProblems
//
//  Created by Jack Cox on 6/22/15.
//  Copyright © 2015 CapTech Consulting. All rights reserved.
//

import UIKit

class ALStackViewController: UIViewController {

    @IBOutlet weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func addItem(sender: AnyObject) {
        let items = stackView.arrangedSubviews.count
        
        let label = UILabel()
        label.text = "Label \(items)"
        
        self.stackView.insertArrangedSubview(label, atIndex: items-1)
    }

    @IBAction func removeItem(sender: AnyObject) {
        let items = stackView.arrangedSubviews.count
        
        if (items > 1) { // don't delete the last one
            let viewToRemove = stackView.arrangedSubviews[items-2]
            self.stackView.removeArrangedSubview(viewToRemove)
            viewToRemove.removeFromSuperview()
        }
        
    }
    @IBAction func goCrazy(sender: AnyObject) {
        for _ in 1...50 {
            self.addItem(sender)
        }
    }
}
