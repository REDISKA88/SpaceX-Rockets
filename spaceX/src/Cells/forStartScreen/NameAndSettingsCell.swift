//
//  NameAndSettingsCell.swift
//  spaceX
//
//  Created by Aura Antilochus on 4/15/22.
//  Copyright © 2022 AANTILOC. All rights reserved.
//

import UIKit

class NameAndSettingsCell: UITableViewCell {
    
   // var buttonTapCallback: () -> ()  = { }
    var nameLabel:UILabel!

    var settingsButton: UIButton = {
       var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "settings"), for: .normal)
        return button
    }()
    
//    @objc func didTapButton(sender: UIButton) {
//        sender.animateButtonUp()
//        buttonTapCallback()
//    }
    
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
        
        self.addSubview(settingsButton)
//        settingsButton.addTarget(self, action: #selector(didTapButton(sender:)), for: .touchUpInside)
        settingsButton.addTarget(self, action: #selector(buttonTouchDown(sender:)), for: .touchDown)
        settingsButton.addTarget(self, action: #selector(buttonTouchUpOutside(sender:)), for: .touchUpOutside)
        settingsButton.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: self.bounds.width/2).isActive = true
        settingsButton.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        settingsButton.widthAnchor.constraint(equalToConstant: self.frame.width).isActive = true
        settingsButton.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension NameAndSettingsCell  {

    @objc func buttonTouchDown(sender: UIButton) {
        sender.animateButtonDown()
    }

    @objc func buttonTouchUpOutside(sender: UIButton) {
        sender.animateButtonUp()
    }
}
