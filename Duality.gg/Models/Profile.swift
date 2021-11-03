//
//  Profile.swift
//  Duality.gg
//
//  Created by user189106 on 9/30/21.
//

import Foundation
import Firebase

// UserElement
struct UserElement: Decodable {
    let puuid, gameName, tagLine: String
    let leaderboardRank, rankedRating, numberOfWINS, competitiveTier: Int

    enum CodingKeys: String, CodingKey {
        case puuid, gameName, tagLine, leaderboardRank, rankedRating
        case numberOfWINS = "numberOfWins"
        case competitiveTier
    }
    init(gameName:String, tagLine:String, leaderboardRank: Int, rankedRating: Int,numberOfWINS:Int, competitiveTier: Int ){
        self.puuid = "1234"
        self.gameName = gameName
        self.tagLine = tagLine
        self.leaderboardRank = leaderboardRank
        self.rankedRating = rankedRating
        self.numberOfWINS = numberOfWINS
        self.competitiveTier = competitiveTier
        
    }
    init(d:DocumentSnapshot){
        self.puuid = d.documentID
        self.gameName = d.get("gameName") as? String ?? ""
        self.tagLine = d.get("tagLine") as? String ?? ""
        self.leaderboardRank = d.get("leaderboardRank") as? Int ?? 0
        self.rankedRating = d.get("rankedRating") as? Int ?? 0
        self.numberOfWINS = d.get("numberOfWins") as? Int ?? 0
        self.competitiveTier = d.get("competitiveTier") as? Int ?? 0
    }
    
}




typealias User = [UserElement]


