//
//  NameAndSettingsCell.swift
//  spaceX
//
//  Created by Aura Antilochus on 4/15/22.
//  Copyright © 2022 AANTILOC. All rights reserved.
//

import UIKit

class NameAndSettingsCell: UITableViewCell {
    
    var nameLabel:UILabel!
    var settings:UIButton = {
       var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "settings"), for: .normal)
        return button
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(settings)
        
        settings.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: self.bounds.width/2).isActive = true
        settings.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        settings.widthAnchor.constraint(equalToConstant: self.frame.width).isActive = true
        settings.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
