//
//  OptionsTableViewCell.swift
//  spaceX
//
//  Created by Aura Antilochus on 4/15/22.
//  Copyright © 2022 AANTILOC. All rights reserved.
//

import UIKit

class OptionsTableViewCell: UITableViewCell {

    @IBOutlet weak var optionsArea: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        optionsArea.delegate = self
        optionsArea.dataSource = self
        optionsArea.register(UINib(nibName: "OptionCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "OptionCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension OptionsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = optionsArea.dequeueReusableCell(withReuseIdentifier: "OptionCell", for: indexPath) as! OptionCollectionViewCell
        switch indexPath.row {
        case 0:
            cell.unit.text = "Высота, ft"
        case 1:
            cell.unit.text = "Диаметр, ft"
        case 2:
            cell.unit.text = "Масса, lb"
        case 3:
            cell.unit.text = "Нагрузка, lb"
        
        default:
            cell.unit.text = ""
        }
        return cell
    }
}

