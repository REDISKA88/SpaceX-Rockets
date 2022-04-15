//
//  DetailVc.swift
//  spaceX
//
//  Created by Aura Antilochus on 4/8/22.
//  Copyright © 2022 AANTILOC. All rights reserved.
//

import UIKit

class DetailVc: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @objc func back() {
        print("back")
    }
    private let myArray: NSArray = ["First","Second","Third"]
    private var myTableView: UITableView!
   // var dataController: DataController!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
       // let barHeight: CGFloat = view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
       // let displayWidth: CGFloat = self.view.frame.width
        //let displayHeight: CGFloat = self.view.frame.height
        myTableView = UITableView()
       // myTableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        myTableView.register(UINib(nibName: "infoCell", bundle: nil), forCellReuseIdentifier: "info")
        myTableView.dataSource = self
        myTableView.delegate = self
        myTableView.tableFooterView = UIView()
        self.view.addSubview(myTableView)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Num: \(indexPath.row)")
        print("Value: \(myArray[indexPath.row])")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 14
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "info", for: indexPath) as! infoCell
        cell.titleLabel.text = "Первый запуск"
        return cell
    }

}
