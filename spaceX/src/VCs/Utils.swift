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
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.barTintColor = .clear
        navigationController?.navigationBar.tintColor = .white
    }
    
//    @objc func pressClose(sender: UIButton){
//        sender.animateButtonUp()
//        self.dismiss(animated: true, completion: nil)
//    }
//
//    @objc func buttonTouchDown(sender: UIButton) {
//        sender.animateButtonDown()
//    }
//
//    @objc func buttonTouchUpOutside(sender: UIButton) {
//        sender.animateButtonUp()
//    }
}

extension OpenVc {
    func convertLaunchDate(dateString: String) -> String {
        let dateFormatter = DateFormatter(format: "yyyy-MM-dd'T'HH:mm:ss.SSSZ")
        if let ruDate = dateString.toDateString(dateFormatter: dateFormatter, outputFormat: "dd MMMM yyyy") { return ruDate } else { return dateString }
    }
}

extension UIView {

func animateButtonDown() {

    UIView.animate(withDuration: 0.1, delay: 0.0, options: [.allowUserInteraction, .curveEaseIn], animations: {
        self.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
    }, completion: nil)
}

func animateButtonUp() {

    UIView.animate(withDuration: 0.1, delay: 0.0, options: [.allowUserInteraction, .curveEaseOut], animations: {
        self.transform = CGAffineTransform.identity
    }, completion: nil)
    
    }
}
