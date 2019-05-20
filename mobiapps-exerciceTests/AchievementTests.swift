//
//  AchievementTests.swift
//  mobiapps-exerciceTests
//
//  Created by Quentin Eude on 19/05/2019.
//  Copyright © 2019 Quentin Eude. All rights reserved.
//

import XCTest
@testable import mobiapps_exercice
class AchievementTests: XCTestCase {

    func testInitAchievement(){
        let jsonString = """
        {
          "id": 2835,
          "name": "Slippery Slubling",
          "description": "",
          "requirement": "Ensure that someone in your raid squad is holding the golden slubling so that it may witness the death of Slothasor.",
          "locked_text": "",
          "type": "Default",
          "flags": [
            "Permanent"
          ],
          "tiers": [
            {
              "count": 1,
              "points": 15
            }
          ],
          "rewards": [
            {
              "type": "Item",
              "id": 77869,
              "count": 1
            },
            {
              "type": "Mastery",
              "region": "Maguuma",
              "id": 168
            },
            {
              "type": "Title",
              "id": 238
            }
          ]
        }
        """
        
        guard let data = jsonString.data(using: .utf8) else {
            XCTFail("Cannot transform json string to data")
            return
        }
        
        
        guard let achievement = try? JSONDecoder().decode(Achievement.self, from:data) else{
            XCTFail("Cannot decode json data")
            return
        }
        
        XCTAssertEqual(achievement.identifier, 2835, "Wrong achievement identifier")
        XCTAssertEqual(achievement.name, "Slippery Slubling", "Wrong achievement name")
        XCTAssertEqual(achievement.description, "", "Wrong achievement description")
        XCTAssertEqual(achievement.requirement, "Ensure that someone in your raid squad is holding the golden slubling so that it may witness the death of Slothasor.", "Wrong achievement requirement")
    }

}
