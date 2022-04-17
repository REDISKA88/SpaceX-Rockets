//
//  LaunchesCell.swift
//  spaceX
//
//  Created by Aura Antilochus on 4/17/22.
//  Copyright © 2022 AANTILOC. All rights reserved.
//

import UIKit

class LaunchesCell: UITableViewCell {

    var nameLabel = UILabel()
    var dateLabel = UILabel()
    var statusImage = UIImageView()
    override func awakeFromNib() {
        super.awakeFromNib()
           // Initialization code
       }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupNameLabel()
        setupDateLabel()
        setupStatusImage()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
       }
    
    func setupNameLabel() {
        self.addSubview(nameLabel)
        nameLabel.text = "Rocket name"
        nameLabel.textColor = .white
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.minimumScaleFactor = 0.5
        nameLabel.font = UIFont.systemFont(ofSize: 25)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.leftAnchor.constraint(lessThanOrEqualTo: leftAnchor, constant: 50).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 245).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        nameLabel.topAnchor.constraint(lessThanOrEqualTo: topAnchor, constant: 20).isActive = true
    }
       
    func setupDateLabel() {
       self.addSubview(dateLabel)
       dateLabel.translatesAutoresizingMaskIntoConstraints = false
       dateLabel.text = "Date of launch"
       dateLabel.textColor = .lightGray
       dateLabel.adjustsFontSizeToFitWidth = true
       dateLabel.minimumScaleFactor = 1
       dateLabel.font = UIFont.systemFont(ofSize: 20)
       dateLabel.translatesAutoresizingMaskIntoConstraints = false
       dateLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor, constant: 0).isActive = true
       dateLabel.topAnchor.constraint(equalToSystemSpacingBelow: nameLabel.topAnchor, multiplier: 7).isActive = true
       dateLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
    }
    
    func setupStatusImage() {
        self.addSubview(statusImage)
        statusImage.translatesAutoresizingMaskIntoConstraints = false
        // statusImage.image = UIImage(named: "succsess")
        statusImage.heightAnchor.constraint(equalToConstant: CGFloat(64)).isActive = true
        statusImage.widthAnchor.constraint(equalToConstant: CGFloat(64)).isActive = true
        statusImage.leftAnchor.constraint(equalTo: leftAnchor, constant: self.bounds.width-10).isActive = true
        statusImage.topAnchor.constraint(equalTo: topAnchor, constant: self.frame.height/1.5).isActive = true
    }
}
