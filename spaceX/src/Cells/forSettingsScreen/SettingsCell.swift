//
//  SettingsCell.swift
//  spaceX
//
//  Created by Aura Antilochus on 4/15/22.
//  Copyright © 2022 AANTILOC. All rights reserved.
//

import UIKit

class SettingsCell: UITableViewCell {
    
    
    var optionName = UILabel()
    let segSize = UISegmentedControl()
    //let seg = UISegmentedControl(items: ["m", "ft"])
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
      //  let segSize = UISegmentedControl(items: ["m", "ft"])
        self.addSubview(optionName)
        self.addSubview(segSize)
        
        optionName.translatesAutoresizingMaskIntoConstraints = false
        optionName.text = "TEXT LABEL"
        optionName.textColor = .white
        optionName.font = UIFont.systemFont(ofSize: 20)
        optionName.leftAnchor.constraint(equalTo: leftAnchor, constant: self.frame.width/8).isActive = true
        optionName.topAnchor.constraint(equalTo: topAnchor, constant: self.frame.height/2).isActive = true
        
        
        segSize.translatesAutoresizingMaskIntoConstraints = false
        segSize.layer.cornerRadius = 5.0
        segSize.selectedSegmentIndex = 0
        //segSize.sendActions(for: UIControlEvents.valueChanged)

        segSize.selectedSegmentTintColor = .white
        segSize.backgroundColor = .darkGray
        
        segSize.leftAnchor.constraint(equalTo: centerXAnchor, constant: self.frame.height).isActive = true
        segSize.topAnchor.constraint(equalTo: topAnchor, constant: self.frame.height/2).isActive = true
        segSize.rightAnchor.constraint(equalTo: rightAnchor, constant: -50).isActive = true
        segSize.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30).isActive = true

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
