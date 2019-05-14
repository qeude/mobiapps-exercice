//
//  Group.swift
//  mobiapps-exercice
//
//  Created by Quentin Eude on 14/05/2019.
//  Copyright © 2019 Quentin Eude. All rights reserved.
//

import Foundation

struct GroupList: Codable {
    let data : [Group]
}

struct Group: Codable {
    
    var identifier: String
    var name: String
    var description: String
    var order : Int
    var categoriesIdentifiers: [Int]
    
    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case name
        case description
        case order
        case categoriesIdentifiers = "categories"
    }
}
