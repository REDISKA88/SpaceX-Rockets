//
//  OptionCollectionViewCell.swift
//  spaceX
//
//  Created by Aura Antilochus on 4/15/22.
//  Copyright © 2022 AANTILOC. All rights reserved.
//

import UIKit

class OptionCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var value: UILabel!
    
    @IBOutlet weak var unit: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 30
        //layer.masksToBounds = true
        // Initialization code
    }

}

