//
//  ALCollectionViewController.swift
//  ALProblems
//
//  Created by Jack Cox on 2/26/15.
//  Copyright (c) 2015 CapTech Consulting. All rights reserved.
//

import UIKit
import QuartzCore

let reuseIdentifier = "Cell"

class ALCollectionViewController: UICollectionViewController {
    
    var catImages:[UIImage] = []
    var labelValues:[String] = []
    
    let text = "Gummi bears muffin cotton candy lollipop. Cake pudding sweet candy gummi bears sweet biscuit tart. Lollipop tart wafer sugar plum."
    
    
    init() {
        super.init(nibName: "ALCollectionViewController", bundle: nil)
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // generate random cat pictures and text
        let words = text.componentsSeparatedByString(" ")
        for i in 1...100 {
            let rand = arc4random_uniform(3)
            switch rand {
            case 0:
                catImages.append(UIImage(named: "apple_small")!)
                break
            case 1:
                catImages.append(UIImage(named: "apple_medium")!)
                break
            case 2:
                catImages.append(UIImage(named: "apple_large")!)
                break
            default:
                break
            }
            //catImages.append(UIImage(named: "th-\((i % 12)+1)")!)
            
            var labelValue = "\(i):"
            for _ in 1...((random() % 3)+1) {
                labelValue += words[random() % words.count]
                labelValue += " "
            }
            labelValues.append(labelValue)
        }

        let layout = self.collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        layout.estimatedItemSize = CGSize(width: 174, height: 90)
        
        // Register cell classes
        self.collectionView!.registerNib(UINib(nibName: "ALSelfSizingCollectionCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        // Do any additional setup after loading the view.
        
        self.collectionView!.reloadData()
    }
    

    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
        self.collectionView!.reloadData()
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.catImages.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! ALSelfSizingCollectionCell
    
        // Configure the cell
        //cell.contentView.setTranslatesAutoresizingMaskIntoConstraints(false)
        cell.catImageView?.image = self.catImages[indexPath.item]
        cell.titleLabel?.text = labelValues[indexPath.item]

        cell.catImageView?.layer.borderColor = UIColor.blueColor().CGColor
        cell.catImageView?.layer.borderWidth = 1.0

        cell.titleLabel?.layer.borderColor = UIColor.blueColor().CGColor
        cell.titleLabel?.layer.borderWidth = 1.0
    
        return cell
    }
    
    
}
