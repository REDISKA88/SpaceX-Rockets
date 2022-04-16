//
//  Parameters.swift
//  spaceX
//
//  Created by Aura Antilochus on 4/15/22.
//  Copyright © 2022 AANTILOC. All rights reserved.
//

import Foundation

class Parameters {

   var height: Height
   var diameter: Diameter
   var weight: Weight
   var payload: Payload

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
        self.height = Height(meters: "", feet: "", display: .meters)
        self.diameter = Diameter(meters: "", feet: "", display: .meters)
        self.weight = Weight(lb: "", kg: "", display: .kg)
        self.payload = Payload(lb: "", kg: "", display: .kg)
    }
    
//    func setHeightFt() {
//        self.height = height.feet
//    }
//
//    func setsetHeightMeters(_ height: Double) {
//        self.height = height.toString()
//    }
//
//    func setDiameterFt(_ diameter: Double) {
//        self.diameter = diameter.toString()
//    }
//
//    func setDiameterMeters(_ diameter: Double) {
//         self.diameter = diameter.toString()
//     }
//
//    func setWeightLb(_ weight: Int) {
//        self.weight = String(weight)
//    }
//
//    func setWeightKg(_ weight: Int) {
//           self.weight = String(weight)
//       }
//
//    func setPayloadLb(_ payload: Int) {
//        self.payload = String(payload)
//    }
//
//    func setPayloadKg(_ payload: Int) {
//        self.payload = String(payload)
//    }
}

extension Double {
    func toString() -> String {
        return String(format: "%.1f",self)
    }
}
