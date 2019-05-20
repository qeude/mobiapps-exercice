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
        let group = Group(identifier: "A4ED8379-5B6B-4ECC-B6E1-70C350C902D2", name: "Story Journal", description: "Achievements related to the story journal.", order: 3, categories: [216,171,154,224,164,226,147,209,183,187,188,203,121,122,123,104,68,100,81,83,82,71,72,70,196,144,139])
        APIService
            .getCategoriesByGroup(group: group){result in
                switch result{
                case .success(let categories):
                    XCTAssertFalse(categories.isEmpty, "categories is empty")
                    XCTAssertEqual(categories.count, group.categories.count, "Wrong number of result")
                    XCTAssertEqual(categories.first?.identifier, 216, "Wrong category identifier")
                    XCTAssertEqual(categories.first?.name, "A Star to Guide Us", "Wrong category name")
                    expectation.fulfill()
                case .failure(let error):
                    XCTFail(error.localizedDescription)

                }
                
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    /// Test to get achievements for a given category
    func testGetAchievementsByCategory(){
        let expectation = self.expectation(description: "Get achievements by category")
        let category = Category(identifier : 216, name: "A Star to Guide Us", description:"", order: 9, iconUrl :"https://render.guildwars2.com/file/29C575F5601EC9D003B80BE497077E424FA2F704/2039753.png", achievements: [4359,4342,4346,4392,4372,4358,4347,4378,4424,4401,4389,4369,4384,4393,4400,4365,4370,4343,4353,4428,4363,4418,4414,4381,4421,4341,4398,4387,4403,4433,4426,4417,4406,4394,4352,4385,4350,4390,4425,4360,4427,4371,4383,4351,4348,4419,4374,4376,4362,4345,4402,4344,4432,4420,4354,4356,4357,4366,4373,4407,4375,4349,4430,4411,4386,4380,4405,4368,4413,4434,4377])
        APIService
            .getAchievementsByCategory(category: category){ result in
                switch result{
                case .success(let achievements):
                    XCTAssertFalse(achievements.isEmpty, "achievements is empty")
                    XCTAssertEqual(achievements.count, category.achievements.count, "Wrong number of result")
                    XCTAssertEqual(achievements.first?.identifier, 4359, "Wrong achievement identifier")
                    XCTAssertEqual(achievements.first?.name, "\"A Star to Guide Us\" Mastery", "Wrong achievement name")
                    XCTAssertEqual(achievements.first?.description, "", "Wrong achievement description")
                    XCTAssertEqual(achievements.first?.requirement, "Complete all  \"A Star to Guide Us\" achievements.", "Wrong achievement requirement")
                    expectation.fulfill()
                case .failure(let error):
                    XCTFail(error.localizedDescription)

                }
        }
        waitForExpectations(timeout: 5, handler: nil)
    }

}
