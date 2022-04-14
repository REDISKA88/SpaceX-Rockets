//
//  Network.swift
//  spaceX
//
//  Created by Aura Antilochus on 4/12/22.
//  Copyright © 2022 AANTILOC. All rights reserved.
//
import UIKit
import Foundation

class Manager {
    
    static let shared = Manager()
    static let urlRocket = "https://api.spacexdata.com/v4/rockets"
    static let urlLaunch = "https://api.spacexdata.com/v4/launches"
    
        func requestRockets(completion: @escaping (SpaceXRockets) -> Void) {
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

    func requestLaunches(urlString: String, completion: @escaping (Launches?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if error != nil {
                    print("error")
                    completion(nil)
                    return
                }
                guard let data = data else { return }
                do {
                    let decoder = JSONDecoder()
                   // decoder.dateDecodingStrategy = .iso8601
                    let launches = try decoder.decode(Launches.self, from: data)
                    completion(launches)
                } catch let jsonError {
                    print("Fail to decode JSON", jsonError)
                    completion(nil)
                }
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
