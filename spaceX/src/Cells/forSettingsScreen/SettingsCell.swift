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
    let segHeft = UISegmentedControl()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
//
//    @objc func changeSizeUnints(_ sender: UISegmentedControl) {
//
//    }
//
//    @objc func changeHeftUnints(_ sender: UISegmentedControl) {
//
//    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupLabel()
        setupSegSize()
        setipSegHeft()
        
//        segSize.addTarget(self, action: #selector(changeSizeUnints(_:)), for: .valueChanged)
        

        //segSize.sendActions(for: UIControlEvents.valueChanged)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
    func setupLabel() {
        
        self.addSubview(optionName)
        optionName.translatesAutoresizingMaskIntoConstraints = false
        optionName.text = "TEXT LABEL"
        optionName.textColor = .white
        optionName.font = UIFont.systemFont(ofSize: 20)
        optionName.leftAnchor.constraint(equalTo: leftAnchor, constant: self.frame.width/8).isActive = true
        optionName.topAnchor.constraint(equalTo: topAnchor, constant: self.frame.height/2).isActive = true
    }
    
    func setupSegSize() {
        
        self.addSubview(segSize)
        segSize.translatesAutoresizingMaskIntoConstraints = false
        segSize.layer.cornerRadius = 5.0
        segSize.selectedSegmentIndex = 0
        
        segSize.selectedSegmentTintColor = .white
        segSize.backgroundColor = .darkGray
        
        segSize.leftAnchor.constraint(equalTo: centerXAnchor, constant: self.frame.height).isActive = true
        segSize.topAnchor.constraint(equalTo: topAnchor, constant: self.frame.height/2).isActive = true
        segSize.rightAnchor.constraint(equalTo: rightAnchor, constant: -50).isActive = true
        segSize.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30).isActive = true
    }
    
    func setipSegHeft() {
        
        self.addSubview(segHeft)
        segHeft.translatesAutoresizingMaskIntoConstraints = false
        segHeft.layer.cornerRadius = 5.0
        segHeft.selectedSegmentIndex = 0
               //segSize.sendActions(for: UIControlEvents.valueChanged)

        segHeft.selectedSegmentTintColor = .white
        segHeft.backgroundColor = .darkGray
               
        segHeft.leftAnchor.constraint(equalTo: centerXAnchor, constant: self.frame.height).isActive = true
        segHeft.topAnchor.constraint(equalTo: topAnchor, constant: self.frame.height/2).isActive = true
        segHeft.rightAnchor.constraint(equalTo: rightAnchor, constant: -50).isActive = true
        segHeft.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30).isActive = true

    }

}
