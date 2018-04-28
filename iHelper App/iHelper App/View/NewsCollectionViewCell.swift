//
//  CustomCollectionViewCell.swift
//  iHelper App
//
//  Created by Habib Gramondi on 27/04/2018.
//  Copyright © 2018 Habib Gramondi. All rights reserved.
//

import UIKit

class NewsCollectionViewCell: UICollectionViewCell {
  
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    
    func setup( text: String, image: UIImage) {
        itemLabel.text = text
        itemImage.image = image
    }
}
