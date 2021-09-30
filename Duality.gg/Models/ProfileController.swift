//
//  ProfileController.swift
//  Duality.gg
//
//  Created by user189106 on 9/30/21.
//

import Foundation

class ProfileController{
    func fetchUser(completion: @escaping (Result<User,Error>)->Void){
        var urlComponents = URLComponents(string: "http://martinmolina.com.mx/202113/tc2024/equipo6/user.json")!

        let task = URLSession.shared.dataTask(with: urlComponents.url!) { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            if let data = data{
                do{
                    let user = try? jsonDecoder.decode(User.self, from: data)
                    completion(.success(user!))
                }
                catch{
                    completion(.failure(error))
                }
            }
            else {
                completion(.failure(error as! Error))
            }
            
        }

        task.resume()
    
    }
    
    
}



