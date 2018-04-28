//
//  CustomCollectionViewCell.swift
//  iHelper App
//
//  Created by Habib Gramondi on 27/04/2018.
//  Copyright © 2018 Habib Gramondi. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
  
    @IBOutlet weak var theLabel: UILabel!
    func setup(with text: String) {
        theLabel.text = "Test"
    }
}
