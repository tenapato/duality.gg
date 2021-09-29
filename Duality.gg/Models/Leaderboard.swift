//
//  Leaderboard.swift
//  Duality.gg
//
//  Created by user189106 on 9/29/21.
//

import Foundation
// Leaderboard
struct Leaderboard: Codable {
    let actID: String
    let players: [Player]

    enum CodingKeys: String, CodingKey {
        case actID = "actId"
        case players
    }
}

// Player
struct Player: Codable {
    let puuid, gameName, tagLine: String
    let leaderboardRank, rankedRating, numberOfWINS, competitiveTier: Int

    enum CodingKeys: String, CodingKey {
        case puuid, gameName, tagLine, leaderboardRank, rankedRating
        case numberOfWINS = "numberOfWins"
        case competitiveTier
    }
}

typealias Leaderboards = [Leaderboard]
