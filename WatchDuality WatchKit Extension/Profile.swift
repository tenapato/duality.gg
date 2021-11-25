//
//  Profile.swift
//  WatchDuality WatchKit Extension
//
//  Created by user191401 on 11/23/21.
//

import Foundation

// UserElement
struct UserElement{
    let gameName: String
    let rankedRating: Int

    init(gameName:String, rankedRating:Int){
        
        self.gameName = gameName
        self.rankedRating = rankedRating
    }


}


typealias User = [UserElement]
