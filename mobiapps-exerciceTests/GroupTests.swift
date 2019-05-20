//
//  GroupTests.swift
//  mobiapps-exerciceTests
//
//  Created by Quentin Eude on 19/05/2019.
//  Copyright © 2019 Quentin Eude. All rights reserved.
//

import XCTest
@testable import mobiapps_exercice

final class GroupTests : XCTestCase{
    
    func testIniGroup(){
        let jsonString = """
        {
            "id": "56A82BB9-6B07-4AB0-89EE-E4A6D68F5C47",
            "name": "General",
            "description": "Achievements for accomplishments throughout Central Tyria.",
            "order": 4,
            "categories": [
                169,
                10,
                1,
                133,
                5,
                2,
                27,
                58,
                7,
                51,
                47,
                14,
                6,
                11,
                16,
                4,
                80,
                69,
                206
            ]
        }
        """
        
        guard let data = jsonString.data(using: .utf8) else {
            XCTFail("Cannot transform json string to data")
            return
        }
        
        
        guard let group = try? JSONDecoder().decode(Group.self, from:data) else{
            XCTFail("Cannot decode json data")
            return
        }
        
        XCTAssertEqual(group.identifier, "56A82BB9-6B07-4AB0-89EE-E4A6D68F5C47", "Wrong group identifier")
        XCTAssertEqual(group.name, "General", "Wrong group name")
        XCTAssertEqual(group.description, "Achievements for accomplishments throughout Central Tyria.", "Wrong group description")
        XCTAssertEqual(group.order, 4, "Wrong group order")
    }
}
