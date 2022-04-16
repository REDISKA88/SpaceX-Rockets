//
//  OptionsTableViewCell.swift
//  spaceX
//
//  Created by Aura Antilochus on 4/15/22.
//  Copyright © 2022 AANTILOC. All rights reserved.
//

import UIKit

class OptionsTableViewCell: UITableViewCell {
   
    
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

        // Configure the view for the selected state
    }
    
    
//    func setCollectionViewDelegate(dataSourceDelegate: UICollectionViewDataSource & UICollectionViewDelegate, forRow row: Int) {
//        optionsArea.delegate = dataSourceDelegate
//        optionsArea.dataSource = dataSourceDelegate
//        optionsArea.tag = row
//        optionsArea.reloadData()
//    }
    
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
        //    cell.value.text = params.height
        case 1:
            cell.unit.text = "Диаметр, ft"
      //      cell.value.text = params.diameter
        case 2:
            cell.unit.text = "Масса, lb"
        //    cell.value.text = params.weight
        case 3:
            cell.unit.text = "Нагрузка, lb"
     //       cell.value.text = params.payload
        default:
            cell.unit.text = ""
            cell.value.text = ""
        }
        return cell
    }

}

