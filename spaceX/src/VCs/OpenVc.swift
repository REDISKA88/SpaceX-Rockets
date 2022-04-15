//
//  OpenVc.swift
//  spaceX
//
//  Created by Aura Antilochus on 4/8/22.
//  Copyright © 2022 AANTILOC. All rights reserved.
//

import UIKit

class OpenVc: UITableViewController {
    
    //var dataController: DataController
    var rocketName: String!
    var currentSpaceshipLaunches: [SpaceXLaunches]!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self,
        forCellReuseIdentifier: "cell")
        view.backgroundColor = .black
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
       // self.navigationItem.rightBarButtonItem = self.editButtonItem

        self.navigationItem.title = rocketName
        tableView.register(UINib(nibName: "RocketLaunches", bundle: nil), forCellReuseIdentifier: "launchCell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return currentSpaceshipLaunches.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
    {
        let verticalPadding: CGFloat = 10

        let maskLayer = CALayer()
        maskLayer.cornerRadius = 25
        maskLayer.backgroundColor = UIColor.black.cgColor
        maskLayer.frame = CGRect(x: cell.bounds.origin.x+10, y:
        cell.bounds.origin.y, width: cell.bounds.width-20, height:
        cell.bounds.height).insetBy(dx: 0, dy: verticalPadding/2)
        cell.layer.mask = maskLayer
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "launchCell", for: indexPath) as! RocketLaunches
    /*
        let font: UIFont = UIFont.boldSystemFont(ofSize: 30)
        cell.textLabel?.textColor = .white
        cell.textLabel?.font = font
     */
        
        if currentSpaceshipLaunches[0].id == "0" {
            cell.nameLabel.text = currentSpaceshipLaunches[0].name
            cell.dateLabel.text = ""
            cell.statusImage.image = UIImage(named: "wait")
            return cell
        }
        
        let instanceAtLaunch = currentSpaceshipLaunches[indexPath.row]
        
        cell.nameLabel.text = instanceAtLaunch.name
        if let date = instanceAtLaunch.date {
            cell.dateLabel.text = convertLaunchDate(dateString: date)
        } else { cell.dateLabel.text = "" }
        if instanceAtLaunch.success == true {
            cell.statusImage.image = UIImage(named: "success")
        } else { cell.statusImage.image = UIImage(named: "fail") }
        
        return cell
    }
}

