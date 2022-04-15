//
//  Parameters.swift
//  spaceX
//
//  Created by Aura Antilochus on 4/15/22.
//  Copyright © 2022 AANTILOC. All rights reserved.
//

import Foundation

class Parameters {

   var height: String
   var diameter: String
   var weight: String
   var payload: String
    
    
    init() {
        self.height =  ""
        self.diameter = ""
        self.weight =  ""
        self.payload = ""
    }
    init(height: String, diameter: String, weight: String, payload: String) {

        self.height = height
        self.diameter = diameter
        self.weight = weight
        self.payload = payload
    }
    func setHeightFt(_ height: Double) {
        self.height = height.toString()
    }
    
    func setDiameterFt(_ diameter: Double) {
        self.diameter = diameter.toString()
    }
    
    func setWeightLb(_ weight: Int) {
        self.weight = String(weight)
    }
    
    func setPayloadLb(_ payload: Int) {
        self.payload = String(payload)
    }
}

extension Double {
    func toString() -> String {
        return String(format: "%.1f",self)
    }
}
