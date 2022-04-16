//
//  SettingsVc.swift
//  spaceX
//
//  Created by Aura Antilochus on 4/15/22.
//  Copyright © 2022 AANTILOC. All rights reserved.
//

import UIKit


class SettingsVc: UIViewController {
    
    var id = -1;
    var receiveParams: [Parameters]!
    var contextTable: UITableView!
    var contextCollection: UICollectionView!
    //weak
    let mytableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.alwaysBounceVertical = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    var settingsButton: UIButton = {
       var button = UIButton()
        button.setTitle("Закрыть", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    var titleLabel: UILabel = {
       var label = UILabel()
        label.text = "Настройки"
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 21)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        self.navigationItem.title = "Настройки"
        buttonSetup()
        labelSetup()
        tableSetup()
        settingsButton.addTarget(self, action: #selector(pressClose(sender:)), for: .touchUpInside)
        settingsButton.addTarget(self, action: #selector(buttonTouchDown(sender:)), for: .touchDown)
        settingsButton.addTarget(self, action: #selector(buttonTouchUpOutside(sender:)), for: .touchUpOutside)
        
    }
    
    func tableSetup() {
        view.addSubview(mytableView)
        mytableView.delegate = self
        mytableView.dataSource = self
        mytableView.backgroundColor = .black
        mytableView.allowsSelection = false
        mytableView.register(SettingsCell.self, forCellReuseIdentifier: "SettingsCell")
        mytableView.tableFooterView = UIView()
        NSLayoutConstraint.activate([
            mytableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            mytableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            mytableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            mytableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

    }
    
    func buttonSetup(){
        view.addSubview(settingsButton)
        settingsButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        settingsButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 7).isActive = true
        settingsButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: view.frame.width/1.5).isActive = true
    }
    
    func labelSetup() {
        view.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    self.view.frame = CGRect(x: 0, y: UIScreen.main.bounds.height/10, width: self.view.bounds.width, height: UIScreen.main.bounds.height)
        
        
        self.view.layer.cornerRadius = 30
        self.view.layer.masksToBounds = true

    }

}

extension SettingsVc: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mytableView.dequeueReusableCell(withIdentifier: "SettingsCell", for: indexPath) as! SettingsCell
        cell.backgroundColor = .black
        cell.segSize.selectedSegmentTintColor = .white
        cell.segSize.backgroundColor = .darkGray
        var height = 0
        var diameter = 0
        if receiveParams[id].height.display == .feet {
            height = 1
        }
        
        if receiveParams[id].diameter.display == .feet {
            diameter = 1
        }
//        print(receiveParams[id].diameter.display)
//        print(receiveParams[id].weight.display)
//        print(receiveParams[id].payload.display)


        switch indexPath.row {
        case 0, 1:
            cell.segHeft.removeFromSuperview()
            cell.segHeft.tag = -1
            cell.segSize.tag = indexPath.row
            if indexPath.row == 0 {
                cell.optionName.text = "Высота"
            } else { cell.optionName.text = "Диаметр"}
            cell.segSize.insertSegment(withTitle: "m", at: 0, animated: false)
            cell.segSize.insertSegment(withTitle: "ft", at: 1, animated: false)
            if indexPath.row == 0 {
                cell.segSize.selectedSegmentIndex = height
            }
            if indexPath.row == 1 {
                cell.segSize.selectedSegmentIndex = diameter
            }
            cell.segSize.addTarget(self, action: #selector(changeSizeUnints(_:)), for: .valueChanged)
            
            return cell
        case 2, 3:
            cell.segSize.removeFromSuperview()
            cell.segSize.tag = -1
            cell.segHeft.tag = indexPath.row
            if indexPath.row == 2 {
                cell.optionName.text = "Масса"
            } else { cell.optionName.text = "Полезная нагрузка"}
            cell.segHeft.insertSegment(withTitle: "kg", at: 0, animated: false)
            cell.segHeft.insertSegment(withTitle: "lb", at: 1, animated: false)
            cell.segHeft.selectedSegmentIndex = 1
            cell.segHeft.addTarget(self, action: #selector(changeHeftUnints(_:)), for: .valueChanged)
            //print(params.height, params.diameter)
        default:
            return cell
        }
        return cell
    }

           
}

extension SettingsVc {
    
    @objc func changeSizeUnints(_ sender: UISegmentedControl) {

        //case 0: height
        //case 1: diameter
        //selector [ 0 = meters, 1 = ft ]
        if  receiveParams == nil {
            print("sdfdsfds")
            return
        }
        switch sender.tag {
        case 0:
            if sender.selectedSegmentIndex == 0 {
                receiveParams[id].height.display = .meters
                print(receiveParams[id].height.display)
            } else { receiveParams[id].height.display = .feet
                 print(receiveParams[id].height.display)
            }
        case 1:
            if sender.selectedSegmentIndex == 0 {
                receiveParams[id].diameter.display = .meters
                print(receiveParams[id].diameter.display)
            } else { receiveParams[id].diameter.display = .feet
                print(receiveParams[id].diameter.display)
            }
        default:
            break
        }
        
    }
    
    @objc func changeHeftUnints(_ sender: UISegmentedControl) {
        //case 2: weight
        //case 3: payload
        //selector [ 0 = kg, 1 = lb ]
        print(id)
        if  receiveParams == nil {
                   print("sdfdsfds")
                   return
               }
        switch sender.tag {
        case 2:
            if sender.selectedSegmentIndex == 0 {
                receiveParams[id].weight.display = .kg
            } else { receiveParams[id].weight.display = .lb }
        case 3:
            if sender.selectedSegmentIndex == 0 {
                receiveParams[id].payload.display = .kg
            } else { receiveParams[id].payload.display = .lb }
        default:
            break
        }
    }
    
    @objc func pressClose(sender: UIButton){
        sender.animateButtonUp()
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "StartVc") as! StartVc

        self.dismiss(animated: true,completion: {
           // self.contextTable.reloadData()
          //  self.contextCollection.reloadData()
            self.receiveParams[self.id].optionsView?.reloadData()
            vc.reservedParams = self.receiveParams
        })
    }
    
    @objc func buttonTouchDown(sender: UIButton) {
        sender.animateButtonDown()
    }

    @objc func buttonTouchUpOutside(sender: UIButton) {
        sender.animateButtonUp()
    }
}




