//
//  CollectionViewController.swift
//  iHelper App
//
//  Created by Habib Gramondi on 27/04/2018.
//  Copyright © 2018 Habib Gramondi. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 200
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        
        let r1 = CGFloat(arc4random_uniform(255))
        let r2 = CGFloat(arc4random_uniform(255))
        let r3 = CGFloat(arc4random_uniform(255))
        let color = UIColor(red: r1/255.0,
                            green: r2/255.0,
                            blue: r3/255.0,
                            alpha: 1.0)
        
        if let customCell = cell as? CustomCollectionViewCell {
            cell.backgroundColor = color
            customCell.setup(with: "\(r1):\(r2):\(r3)")
        }
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }


}
