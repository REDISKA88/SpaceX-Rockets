//
//  SettingsVc.swift
//  spaceX
//
//  Created by Aura Antilochus on 4/15/22.
//  Copyright © 2022 AANTILOC. All rights reserved.
//

import UIKit

class SettingsVc: UIViewController {

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
        switch indexPath.row {
        case 0, 1:
            if indexPath.row == 0 {
                cell.optionName.text = "Высота"
            } else { cell.optionName.text = "Диаметр"}
            cell.segSize.insertSegment(withTitle: "m", at: 0, animated: false)
            cell.segSize.insertSegment(withTitle: "ft", at: 1, animated: false)
            cell.segSize.selectedSegmentIndex = 1
            return cell
        case 2, 3:
            if indexPath.row == 2 {
                cell.optionName.text = "Масса"
            } else { cell.optionName.text = "Полезная нагрузка"}
            cell.segSize.insertSegment(withTitle: "kg", at: 0, animated: false)
            cell.segSize.insertSegment(withTitle: "lb", at: 1, animated: false)
            cell.segSize.selectedSegmentIndex = 1
        default:
            return cell
        }
        return cell
    }

           
}

       

    


extension SettingsVc  {
    @objc func segmentAction(_ segmentedControl: UISegmentedControl) {
        switch (segmentedControl.selectedSegmentIndex) {
        case 0:
            break // Uno
        case 1:
            break // Dos
        case 2:
            break // Tres
        default:
            break
        }
    }
    
    @objc private func filterApply(segment: UISegmentedControl) -> Void {
        switch segment.selectedSegmentIndex {
        case 1:
           break // Uno
        case 2:
             break // Dos
        case 3:
             break // Dos
        default:
             break // Dos
        }
    }
    @objc func pressClose(sender: UIButton){
        sender.animateButtonUp()
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func buttonTouchDown(sender: UIButton) {
        sender.animateButtonDown()
    }

    @objc func buttonTouchUpOutside(sender: UIButton) {
        sender.animateButtonUp()
    }
}




