//
//  LeaderboardController.swift
//  Duality.gg
//
//  Created by user189106 on 9/29/21.
//

import Foundation


class LeaderboardController {
    
    func fetchLeaderboard(completion: @escaping (Result<Leaderboards,Error>)->Void){
        
        var urlComponents = URLComponents(string: "http://martinmolina.com.mx/202113/tc2024/equipo6/leaderboard.json")!


        let task = URLSession.shared.dataTask(with: urlComponents.url!) { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            if let data = data{
                do{
                    let leaderboard = try? jsonDecoder.decode(Leaderboards.self, from: data)
                    completion(.success(leaderboard!))
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
