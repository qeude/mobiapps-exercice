//
//  Category.swift
//  mobiapps-exercice
//
//  Created by Quentin Eude on 14/05/2019.
//  Copyright © 2019 Quentin Eude. All rights reserved.
//

import Foundation

struct Category : Codable{
    var identifier: Int
    var name: String
    var description: String
    var order : Int
    var iconUrl : String
    var achievements: [Int]
    
    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case name
        case description
        case order
        case iconUrl = "icon"
        case achievements
    }
    
}
