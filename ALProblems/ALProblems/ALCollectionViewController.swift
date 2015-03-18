//
//  ALCollectionViewController.swift
//  ALProblems
//
//  Created by Jack Cox on 2/26/15.
//  Copyright (c) 2015 CapTech Consulting. All rights reserved.
//

import UIKit

let reuseIdentifier = "Cell"

class ALCollectionViewController: UICollectionViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var catImages:[UIImage] = []
    var labelValues:[String] = []
    
    let text = "Gummi bears muffin cotton candy lollipop. Cake pudding sweet candy gummi bears sweet biscuit tart. Lollipop tart wafer sugar plum."
    
    
    override init() {
        super.init(nibName: "ALCollectionViewController", bundle: nil)
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // generate random cat pictures and text
        let words = text.componentsSeparatedByString(" ")
        for i in 1...24 {
            catImages.append(UIImage(named: "th-\((i % 12)+1)")!)
            
            var labelValue = ""
            for j in 1...((random() % 3)+1) {
                labelValue += words[random() % words.count]
                labelValue += " "
            }
            labelValues.append(labelValue)
        }

        var layout = self.collectionView?.collectionViewLayout as UICollectionViewFlowLayout
        layout.estimatedItemSize = CGSize(width: 110, height: 50)
        
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
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as ALSelfSizingCollectionCell
    
        // Configure the cell
        cell.contentView.setTranslatesAutoresizingMaskIntoConstraints(false)
        cell.catImageView.image = self.catImages[indexPath.item]
        cell.titleLabel.text = labelValues[indexPath.item]
    
        return cell
    }
    
    
}
