//
//  OptionsTableViewCell.swift
//  spaceX
//
//  Created by Aura Antilochus on 4/15/22.
//  Copyright © 2022 AANTILOC. All rights reserved.
//

import UIKit

class OptionsTableViewCell: UITableViewCell{
   
    //!!
    func updateParameters() {
        optionsArea.reloadData()
    }
    var params: Parameters!
    @IBOutlet weak var optionsArea: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        optionsArea.delegate = self
        optionsArea.dataSource = self
        optionsArea.register(UINib(nibName: "OptionCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "OptionCell")
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

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
            if params.height.display == .feet {
                cell.unit.text = "Высота, ft"
                cell.value.text = params.height.feet
            } else {
                cell.unit.text = "Высота, m"
                cell.value.text = params.height.meters
            }
        case 1:
            if params.diameter.display == .feet {
                cell.unit.text = "Диаметр, ft"
                cell.value.text = params.diameter.feet
            } else {
                cell.unit.text = "Диаметр, m"
                cell.value.text = params.diameter.meters
            }
        case 2:
            if params.weight.display == .lb {
                cell.unit.text = "Масса, lb"
                cell.value.text = params.weight.lb
            } else {
                cell.unit.text = "Масса, kg"
                cell.value.text = params.weight.kg
            }
        case 3:
            if params.payload.display == .lb {
                cell.unit.text = "Нагрузка, lb"
                cell.value.text = params.payload.lb
            } else {
                cell.unit.text = "Нагрузка, kg"
                cell.value.text = params.payload.kg
            }
            
        default:
            cell.unit.text = ""
            cell.value.text = ""
        }
        return cell
    }
    
}

