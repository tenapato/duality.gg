//
//  Leaderboard.swift
//  Duality.gg
//
//  Created by user189106 on 9/29/21.
//

import Foundation
// MARK: - Leaderboard
struct Leaderboard: Codable {
    let affinity, actID: String
    let players: [Player]
    let totalPlayers, immortalStartingPage, immortalStartingIndex, topTierRRThreshold: Int
    let tierDetails: [String: TierDetail]
    let startIndex: Int
    let query: String

    enum CodingKeys: String, CodingKey {
        case affinity
        case actID = "actId"
        case players, totalPlayers, immortalStartingPage, immortalStartingIndex, topTierRRThreshold, tierDetails, startIndex, query
    }
}

// MARK: - Player
struct Player: Codable {
    let puuid, gameName, tagLine: String
    let leaderboardRank, rankedRating, numberOfWINS, competitiveTier: Int

    enum CodingKeys: String, CodingKey {
        case puuid, gameName, tagLine, leaderboardRank, rankedRating
        case numberOfWINS = "numberOfWins"
        case competitiveTier
    }
}

// MARK: - TierDetail
struct TierDetail: Codable {
    let rankedRatingThreshold, startingPage, startingIndex: Int
}

typealias Leaderboards = [Leaderboard]
