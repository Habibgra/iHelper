//
//  CollectionViewController.swift
//  iHelper App
//
//  Created by Habib Gramondi on 27/04/2018.
//  Copyright © 2018 Habib Gramondi. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"
private var categories: [String] = ["Motito", "Noticias", "Shop", "Nosotros"]

class CollectionViewController: UICollectionViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CustomCollectionViewCell
        
        cell.setup(text: categories[indexPath.row], image: UIImage.init(named: categories[indexPath.row])!)
       
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }


}
