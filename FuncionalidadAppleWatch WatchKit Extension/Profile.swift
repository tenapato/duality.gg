//
//  Profile.swift
//  WatchDuality WatchKit Extension
//
//  Created by user191401 on 11/23/21.
//

import Foundation

// UserElement
struct users{
    let gameName: String
    let rankedRating: String
    let tagLine: String
    
    

    init(gameName:String, rankedRating:String, tagLine:String){
        
        self.gameName = gameName
        self.rankedRating = rankedRating
        self.tagLine = tagLine
       
      
    }


}


typealias User = [users]
