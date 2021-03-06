//
//  TableExtensions.swift
//  spaceX
//
//  Created by Aura Antilochus on 4/14/22.
//  Copyright © 2022 AANTILOC. All rights reserved.
//
import UIKit
import Foundation

extension StartVc: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            let currentImage = UIImage(named: "img")
            let cropImage = currentImage!.getCropRatio()
            let resultHeight: CGFloat = (tableView.frame.width / cropImage)
            return resultHeight
        case 1:
            return 80
        case 2:
            return 120
        case 14:
            return 100
        default:
            return 60
        }
    }
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let modelIndex = tableView.tag - tableViewUniqueIdFactor
        let rocketAtIndex = allRocketsv4?[modelIndex]
        let rocketParams = reservedParams[modelIndex]
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ImageViewCell") as! ImageViewCell
            let images = rocketAtIndex?.flickrImages
            //images?.shuffle()
            if let url = URL(string: images?[0] ?? "img"){
                DispatchQueue.global().async {
                    if let data = try? Data(contentsOf: url) {
                        if let image = UIImage(data: data) {
                            DispatchQueue.main.async {
                                cell.mainImageView.image = image
                            }
                        }
                    }
                }
            }
            cell.mainImageView.layer.cornerRadius = 30
            cell.mainImageView.layer.masksToBounds = true
            cell.backgroundColor = .black
            return cell

        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "NameAndSettingsCell") as! NameAndSettingsCell
            cell.selectionStyle = .none
            let font: UIFont = UIFont.boldSystemFont(ofSize: 30)
            cell.textLabel?.textColor = .white
            cell.textLabel?.font = font
            cell.textLabel?.text = rocketAtIndex?.name
            cell.backgroundColor = .black
            cell.buttonTapCallback = {
                self.pushing(currentModel: modelIndex, currentParameters: self.reservedParams)
            }
            
            return cell
            
        
            //MARK: - CollectionView
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: "OptionsTableCell", for: indexPath) as! OptionsTableViewCell
                cell.selectionStyle = .none
                cell.updateParameters()
                cell.optionsArea.tag = modelIndex
                rocketParams.optionsView = cell.optionsArea
                cell.params = rocketParams

            return cell
    
            
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "info", for: indexPath) as! infoCell
            cell.titleLabel.text = "Первый запуск"
            cell.valueLabel.text = ""
 
            let date = convertDate(dateString: (rocketAtIndex?.firstFlight)!)
            cell.unitLabel.text = date
            cell.unitLabel.font = UIFont.systemFont(ofSize: 20)
            cell.unitLabel.textColor = .white
            return cell
            
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "info", for: indexPath) as! infoCell
            cell.titleLabel.text = "Страна"
            cell.valueLabel.text = ""
            
            if rocketAtIndex?.country?.contains("Marshall Islands") == true {
                cell.unitLabel.text = "Marshall Islands"
            } else { cell.unitLabel.text = rocketAtIndex?.country }
            cell.unitLabel.font = UIFont.systemFont(ofSize: 20)
            cell.unitLabel.textColor = .white
            return cell
            
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: "info", for: indexPath) as! infoCell
            guard let cost = rocketAtIndex?.costPerLaunch else {
                cell.valueLabel.text = "UNKNOWN"
                cell.valueLabel.font = UIFont.boldSystemFont(ofSize: 20)
                cell.unitLabel.text = "$"
                return cell
            }
            
            cell.titleLabel.text = "Стоимость запуска"
            cell.valueLabel.text = String(cost)
            cell.valueLabel.font = UIFont.boldSystemFont(ofSize: 20)
            cell.unitLabel.text = "$"
            return cell
        
        case 6:
            let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellIdentifier)!
            cell.selectionStyle = .none
            cell.textLabel?.textColor = .white
            cell.backgroundColor = .black
            cell.textLabel?.text = "ПЕРВАЯ СТУПЕНЬ"
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            return cell
            
        case 7:
            let cell = tableView.dequeueReusableCell(withIdentifier: "info", for: indexPath) as! infoCell
            cell.titleLabel.text = "Количество двигателей"
            guard let engines = rocketAtIndex?.firstStage?.engines else {
                cell.valueLabel.font = UIFont.boldSystemFont(ofSize: 20)
                cell.unitLabel.text = "UNKNOWN"
                return cell
            }
            cell.valueLabel.text = String(engines)
            cell.valueLabel.font = UIFont.boldSystemFont(ofSize: 20)
            cell.unitLabel.text = "nan"
            cell.unitLabel.textColor = .clear
            return cell
        case 8:
            let cell = tableView.dequeueReusableCell(withIdentifier: "info", for: indexPath) as! infoCell
            cell.titleLabel.text = "Колличетво топлива"
            cell.valueLabel.text = String(rocketAtIndex?.firstStage?.fuelAmountTons ?? 0)
            cell.valueLabel.font = UIFont.boldSystemFont(ofSize: 20)
            cell.unitLabel.text = "ton"
            return cell
            
        case 9:
            let cell = tableView.dequeueReusableCell(withIdentifier: "info", for: indexPath) as! infoCell
            cell.titleLabel.text = "Время сгорания"
            cell.valueLabel.text = "\(rocketAtIndex?.firstStage?.burnTimeSEC ?? 0)"
            cell.valueLabel.font = UIFont.boldSystemFont(ofSize: 20)
            cell.unitLabel.text = "sec"
            return cell
            
        case 10:
            let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellIdentifier)!
            cell.textLabel?.textColor = .white
            cell.backgroundColor = .black
            cell.selectionStyle = .none
            cell.textLabel?.text = "ВТОРАЯ СТУПЕНЬ"
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            return cell
        case 11:
            let cell = tableView.dequeueReusableCell(withIdentifier: "info", for: indexPath) as! infoCell
            cell.titleLabel.text = "Количество двигателей"
            guard let engines = rocketAtIndex?.firstStage?.engines else {
                cell.valueLabel.font = UIFont.boldSystemFont(ofSize: 20)
                cell.unitLabel.text = "UNKNOWN"
                return cell
            }
            cell.valueLabel.text = String(engines)
            cell.valueLabel.font = UIFont.boldSystemFont(ofSize: 20)
            cell.unitLabel.text = "nan"
            cell.unitLabel.textColor = .clear
            return cell
        case 12:
            let cell = tableView.dequeueReusableCell(withIdentifier: "info", for: indexPath) as! infoCell
            cell.titleLabel.text = "Колличетво топлива"
            cell.valueLabel.text = String(rocketAtIndex?.secondStage?.fuelAmountTons ?? 0)
            cell.unitLabel.text = "ton"
            return cell
            
        case 13:
            let cell = tableView.dequeueReusableCell(withIdentifier: "info", for: indexPath) as! infoCell
            cell.titleLabel.text = "Время сгорания"
            cell.valueLabel.text = "\(rocketAtIndex?.secondStage?.burnTimeSEC ?? 0)"
            cell.unitLabel.text = "sec"
            return cell
            
        case 14:
            let cell = tableView.dequeueReusableCell(withIdentifier: "detail", for: indexPath) as! DetailCell

            cell.backgroundColor = .black
            
            cell.myButton.layer.cornerRadius = cell.myButton.frame.size.height/2
            cell.myButton.layer.borderWidth = 0.5
            cell.myButton.tag = modelIndex
            cell.selectionStyle = .none
            cell.myButton.addTarget(self, action: #selector(openNewViewController(sender:)), for: .touchUpInside)

    
            return cell
    
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellIdentifier)!
            cell.selectionStyle = .none
            //cell.backgroundColor = .black
            return cell
        }
        
    }
    
    func setVaulesForRocketParameters(_ rocket: SpaceXRocket?) -> Parameters {
        let params = Parameters()
        params.height.feet = rocket?.height?.feet?.toString() ?? "0"
        params.height.meters = rocket?.height?.meters?.toString() ?? "0"
        params.diameter.feet = rocket?.diameter?.feet?.toString() ?? "0"
        params.diameter.meters = rocket?.diameter?.meters?.toString() ?? "0"
        if let massKg = rocket?.mass?.kg {
           params.weight.kg = String(massKg)
        } else { params.weight.kg = "" }
        if let massLb = rocket?.mass?.lb {
            params.weight.lb = String(massLb)
        } else { params.weight.lb = "" }
        if let payloadKg = rocket?.payloadWeights?[0].kg {
            params.payload.kg = String(payloadKg) } else { params.payload.kg = "" }
        if let payloadLb = rocket?.payloadWeights?[0].lb {
            params.payload.lb = String(payloadLb) } else { params.payload.lb = "" }
        return params
    }
    
}
