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
        
        """
        
        guard let data = jsonString.data(using: .utf8) else {
            XCTFail("Cannot transform json string to data")
            return
        }
        
        
        guard let achievement = try? JSONDecoder().decode(Achievement.self, from:data) else{
            XCTFail("Cannot decode json data")
            return
        }
        
        XCTAssertEqual(achievement.identifier, 123, "Wrong achievement identifier")
        XCTAssertEqual(achievement.name, "General", "Wrong achievement name")
        XCTAssertEqual(achievement.description, "Achievements for accomplishments throughout Central Tyria.", "Wrong achievement description")
        XCTAssertEqual(achievement.requirement, "", "Wrong achievement requirement")
    }

}
