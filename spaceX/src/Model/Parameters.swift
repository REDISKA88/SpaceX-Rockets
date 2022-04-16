//
//  Parameters.swift
//  spaceX
//
//  Created by Aura Antilochus on 4/15/22.
//  Copyright © 2022 AANTILOC. All rights reserved.
//
import UIKit
import Foundation

class Parameters {

   var height: Height
   var diameter: Diameter
   var weight: Weight
   var payload: Payload
    
   var optionsView: UICollectionView? = nil
    enum Displayed {
        case feet
        case meters
        case lb
        case kg
    }
    
    struct Height {
        var meters: String = ""
        var feet: String = ""
        var display: Displayed = .feet
    }
    
    struct Diameter {
        var meters: String = ""
        var feet: String = ""
        var display: Displayed = .feet
    }
    
    struct Weight {
        var lb: String = ""
        var kg: String = ""
        var display: Displayed = .lb
    }
    
    struct Payload {
        var lb: String = ""
        var kg: String = ""
        var display: Displayed = .lb
    }
    
    
    init() {
        self.height = Height(meters: "", feet: "", display: .feet)
        self.diameter = Diameter(meters: "", feet: "", display: .feet)
        self.weight = Weight(lb: "", kg: "", display: .lb)
        self.payload = Payload(lb: "", kg: "", display: .lb)
    }
    
}

extension Double {
    func toString() -> String {
        return String(format: "%.1f",self)
    }
}
