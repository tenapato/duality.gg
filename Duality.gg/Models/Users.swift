//
//  Users.swift
//  Duality.gg
//
//  Created by user189106 on 10/3/21.
//

import Foundation

// MARK: - AllUser
struct AllUser: Codable {
    let puuid, gameName, tagLine: String
    let leaderboardRank, rankedRating, numberOfWINS, competitiveTier: Int

    enum CodingKeys: String, CodingKey {
        case puuid, gameName, tagLine, leaderboardRank, rankedRating
        case numberOfWINS = "numberOfWins"
        case competitiveTier
    }
}

typealias AllUsers = [AllUser]
