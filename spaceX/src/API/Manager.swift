//
//  Network.swift
//  spaceX
//
//  Created by Aura Antilochus on 4/12/22.
//  Copyright © 2022 AANTILOC. All rights reserved.
//

import Foundation

class Manager {
    
    static let shared = Manager()
    static let urlRocket = "https://api.spacexdata.com/v4/rockets"
    
        func getRockets (completion: @escaping (SpaceXRockets) -> Void) {
            URLSession.shared.dataTask(with: URL(string: Manager.urlRocket)!) { (data, response, error) in
                
                if let data = data, let rockets = try? JSONDecoder().decode(SpaceXRockets.self, from: data) {
                    DispatchQueue.main.async {
                        completion(rockets)
                    }
                    
                 } else {
                    completion([])
                }
                   }.resume()
    }




}
  /*
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let data = data, let users = try? JSONDecoder().decode(Users.self, from: data) {
                    completion(users)
                 } else {
                    completion([])
                }
            }
            task.resume()
        }
    }

 */
            
            /*
    class func parseGeneralModel(){
        URLSession.shared.dataTask(with: URL(string: urlRocket)!) { (data, response, error) in

            guard let response = response as? HTTPURLResponse else {
                print("HTTPURLResponse error")
                return
            }

            guard 200 ... 299 ~= response.statusCode else {
                print("Status Code error \(response.statusCode)")
                return
            }

            guard let data = data else {
                print("No Data")
                return
            }

            let rockets = try! JSONDecoder().decode(SpaceXRockets.self, from: data)
            print(rockets)
            
        }.resume()
    }
    
    
    
    
*/
