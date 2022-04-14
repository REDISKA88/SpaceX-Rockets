//
//  ViewUtils.swift
//  spaceX
//
//  Created by Aura Antilochus on 4/14/22.
//  Copyright © 2022 AANTILOC. All rights reserved.
//
import UIKit
import Foundation

extension StartVc {
    func convertDate(dateString: String ) -> String {
        let dateFormatter = DateFormatter(format: "yyyy-MM-dd")
        let ruDate = dateString.toDateString(dateFormatter: dateFormatter, outputFormat: "dd MMMM yyyy")
        return ruDate!
    }
    
    func customizeStartVc() {
        title = "SpaceX-Rockets"
        view.backgroundColor = .black
        navigationController?.navigationBar.barTintColor = .clear
        navigationController?.navigationBar.tintColor = .white
    }
}

extension OpenVc {
    func convertLaunchDate(dateString: String) -> String {
        let dateFormatter = DateFormatter(format: "yyyy-MM-dd'T'HH:mm:ss.SSSZ")
        if let ruDate = dateString.toDateString(dateFormatter: dateFormatter, outputFormat: "dd MMMM yyyy") { return ruDate } else { return dateString }
    }
}
