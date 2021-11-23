//
//  LeaderboardController.swift
//  Duality.gg
//
//  Created by user189106 on 9/29/21.
//

import Foundation


class LeaderboardController {
    
    func fetchLeaderboard(completion: @escaping (Result<Leaderboards,Error>)->Void){
        
        let urlString = "https://dgxfkpkb4zk5c.cloudfront.net/leaderboards/affinity/NA/queue/competitive/act/97b6e739-44cc-ffa7-49ad-398ba502ceb0?startIndex=0&size=10"
        let url = URL(string: urlString)!

        let task = URLSession.shared.dataTask(with: url) {(data, resp, error) in

            guard let data = data else {
                print("data was nil")
                return
            }
            guard let leaderboard = try? JSONDecoder().decode(Leaderboard.self, from: data) else {
                print("something went wrong")
                return
            }
            
            print(leaderboard)
            completion(.success([leaderboard]))
        }
        task.resume()
        
    }
    
    
    
    
    
}
