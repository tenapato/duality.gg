//
//  Profile.swift
//  Duality.gg
//
//  Created by user189106 on 9/30/21.
//

import Foundation


// UserElement
struct UserElement: Codable {
    let puuid, gameName, tagLine: String
    let leaderboardRank, rankedRating, numberOfWINS, competitiveTier: Int

    enum CodingKeys: String, CodingKey {
        case puuid, gameName, tagLine, leaderboardRank, rankedRating
        case numberOfWINS = "numberOfWins"
        case competitiveTier
    }
}

typealias User = [UserElement]


