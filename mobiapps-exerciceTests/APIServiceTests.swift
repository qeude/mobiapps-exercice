//
//  APIServiceTests.swift
//  mobiapps-exerciceTests
//
//  Created by Quentin Eude on 19/05/2019.
//  Copyright © 2019 Quentin Eude. All rights reserved.
//

import XCTest
@testable import mobiapps_exercice
class APIServiceTests: XCTestCase {
    
    /// Test to get groups id from the guild wars 2 API
    func testGetAllGroupsIds(){
        let expectation = self.expectation(description: "Get groups ids")
        APIService
            .getAllGroupsIds{ result in
                switch result{
                case .success(let ids):
                    XCTAssertFalse(ids.isEmpty, "ids is empty")
                    
                    XCTAssertEqual(ids.first, "A4ED8379-5B6B-4ECC-B6E1-70C350C902D2", "Wrong identifier")
                    
                    expectation.fulfill()
                case .failure(let error):
                    XCTFail(error.localizedDescription)
                }
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    /// Test to get groups from the guild wars 2 API
    func testGetAllGroups(){
        let expectation = self.expectation(description: "Get all groups")
        APIService
            .getAllGroups{result in
                switch result{
                case .success(let groups):
                    XCTAssertFalse(groups.isEmpty, "groups is empty")
                    
                    XCTAssertEqual(groups.first?.identifier, "A4ED8379-5B6B-4ECC-B6E1-70C350C902D2", "Wrong group identifier")
                    XCTAssertEqual(groups.first?.name, "Story Journal", "Wrong group name")
                    XCTAssertEqual(groups.first?.description, "Achievements related to the story journal.", "Wrong group description")

                    expectation.fulfill()
                case .failure(let error):
                    XCTFail(error.localizedDescription)
                }
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    
    /// Test to get categories for a given group
    func testGetCategoriesByGroup(){
        let expectation = self.expectation(description: "Get categories by group")
        // TODO : Test request when API will not be down anymore
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    /// Test to get achievements for a given category
    func testGetAchievementsByCategory(){
        let expectation = self.expectation(description: "Get achievements by category")
        // TODO : Test request when API will not be down anymore
        
        waitForExpectations(timeout: 5, handler: nil)
    }

}
