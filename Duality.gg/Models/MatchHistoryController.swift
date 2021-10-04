//
//  MatchHistoryController.swift
//  Duality.gg
//
//  Created by user189106 on 10/4/21.
//

import Foundation

class MatchHistoryController{
    func fetchMatches(completion: @escaping (Result<Matches,Error>)->Void){
        var urlComponents = URLComponents(string: "http://martinmolina.com.mx/202113/tc2024/equipo6/matches.json")!

        let task = URLSession.shared.dataTask(with: urlComponents.url!) { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            if let data = data{
                do{
                    let match = try? jsonDecoder.decode(Matches.self, from: data)
                    completion(.success(match!))
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
