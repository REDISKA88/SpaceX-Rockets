//
//  SelectorForPushButton.swift
//  spaceX
//
//  Created by Aura Antilochus on 4/14/22.
//  Copyright © 2022 AANTILOC. All rights reserved.
//
import UIKit
import Foundation

extension StartVc {
    @objc func openNewViewController(sender:UIButton) {
        let openvc = OpenVc()
        let currentModel = sender.tag
        if let rocketId = allRocketsv4?[currentModel].id {
            for now in allLaunches! {
                if let id = now.rocket {
                    if id.hashValue == rocketId.hashValue {
                        if openvc.currentSpaceshipLaunches == nil {
                            openvc.currentSpaceshipLaunches = [SpaceXLaunches]()
                            openvc.currentSpaceshipLaunches.append(now)
                        } else {
                            openvc.currentSpaceshipLaunches.append(now) }
                    }
                }
            }
        }
        if let currentRocketName = allRocketsv4?[currentModel].name {
            openvc.rocketName = currentRocketName
        }
        if openvc.currentSpaceshipLaunches == nil {
            openvc.currentSpaceshipLaunches = [SpaceXLaunches(rocket: Rocket(rawValue: "empty"), success: false, name: "Ожидаем запуск", id: "0")]
        }
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white,
                              NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 20)]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        self.navigationController?.pushViewController(openvc, animated: true)
    }
}
