//
//  ALTableViewCell.swift
//  ALProblems
//
//  Created by Jack Cox on 2/16/15.
//  Copyright (c) 2015 CapTech Consulting. All rights reserved.
//

import UIKit
import QuartzCore

class ALTableViewCell: UITableViewCell {


    @IBOutlet weak var title: UILabel?
    @IBOutlet weak var imageContent: UIImageView?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        title?.layer.borderColor = UIColor.grayColor().CGColor
        title?.layer.borderWidth = 1.0
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        print("Laying out cell \(self)")
        
        title?.preferredMaxLayoutWidth = title!.frame.size.width
        
        super.layoutSubviews()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
