//
//  Achievement.swift
//  mobiapps-exercice
//
//  Created by Quentin Eude on 14/05/2019.
//  Copyright © 2019 Quentin Eude. All rights reserved.
//

import Foundation

struct AchievementList : Codable {
    let data : [Achievement]
}


struct Achievement: Codable{
    var identifier: Int
    var name : String
    var description: String
    var requirement: String
    
    
    enum CodingKeys: String, CodingKey{
        case identifier = "id"
        case name
        case description
        case requirement
    }
}
