//
//  DetailCell.swift
//  spaceX
//
//  Created by Aura Antilochus on 4/8/22.
//  Copyright © 2022 AANTILOC. All rights reserved.
//

import UIKit

class DetailCell: UITableViewCell {

    
    @IBOutlet weak var myButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       //selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
