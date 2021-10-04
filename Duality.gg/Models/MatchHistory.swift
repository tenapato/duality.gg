//
//  MatchHistory.swift
//  Duality.gg
//
//  Created by user189106 on 10/4/21.
//

import Foundation

// MARK: - Match
struct Match: Codable {
    let puuid, matchID, mapID: String
    let isRanked: Bool
    let kills, deaths, assists, score: Int
    let roundsPlayed, roundsWon: Int
    let won: Bool
    let teamID: String

    enum CodingKeys: String, CodingKey {
        case puuid
        case matchID = "matchId"
        case mapID = "mapId"
        case isRanked, kills, deaths, assists, score, roundsPlayed, roundsWon, won
        case teamID = "teamId"
    }
}

typealias Matches = [Match]
