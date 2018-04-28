//
//  CollectionViewController.swift
//  iHelper App
//
//  Created by Habib Gramondi on 27/04/2018.
//  Copyright © 2018 Habib Gramondi. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"
private var News: [String] = ["Motito", "Noticias", "Shop", "Nosotros"]

class CollectionViewController: UICollectionViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return News.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! NewsCollectionViewCell
        
        cell.setup(text: News[indexPath.row], image: UIImage.init(named: News[indexPath.row])!)
       
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }


}
