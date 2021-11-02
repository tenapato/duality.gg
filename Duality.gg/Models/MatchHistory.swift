//
//  MatchHistory.swift
//  Duality.gg
//
//  Created by user189106 on 10/4/21.
//

import Foundation
import Firebase
// MARK: - Match
struct Match: Decodable {
    let puuid, matchID, mapID, CharId: String
    let isRanked: Bool
    let kills, deaths, assists, score: Int
    let roundsPlayed, roundsWon: Int
    let won: Bool
    let teamID: String

    enum CodingKeys: String, CodingKey {
        case puuid
        case matchID = "matchId"
        case mapID = "mapId"
        case CharId = "CharId"
        case isRanked, kills, deaths, assists, score, roundsPlayed, roundsWon, won
        case teamID = "teamId"
    }
    init(matchId:String, mapID:String, isRanked: Bool, kills: Int, deaths: Int, assists: Int, score:Int, roundsPlayed: Int, roundsWon: Int, won: Bool, teamID: String, CharId: String ){
        self.puuid = "1234"
        self.matchID = matchId
        self.mapID = mapID
        self.isRanked = isRanked
        self.kills = kills
        self.deaths = deaths
        self.assists = assists
        self.score = score
        self.roundsPlayed = roundsPlayed
        self.roundsWon = roundsWon
        self.won = won
        self.teamID = teamID
        self.CharId = CharId
        
    }
    init(d:DocumentSnapshot){
        self.puuid = d.get("uid") as? String ?? ""
        self.matchID = d.get("matchID") as? String ?? ""
        self.mapID = d.get("mapID") as? String ?? ""
        self.isRanked = d.get("isRanked") as? Bool ?? false
        self.kills = d.get("kills") as? Int ?? 0
        self.deaths = d.get("deaths") as? Int ?? 0
        self.assists = d.get("assists") as? Int ?? 0
        self.score = d.get("score") as? Int ?? 0
        self.roundsPlayed = d.get("roundsPlayed") as? Int ?? 0
        self.roundsWon = d.get("roundsWon") as? Int ?? 0
        self.won = d.get("won") as? Bool ?? true
        self.teamID = d.get("teamID") as? String ?? ""
        self.CharId = d.get("CharId") as? String ?? ""
    }
    
}

typealias Matches = [Match]
