//
//  CategoryTests.swift
//  mobiapps-exerciceTests
//
//  Created by Quentin Eude on 19/05/2019.
//  Copyright © 2019 Quentin Eude. All rights reserved.
//

import XCTest
@testable import mobiapps_exercice
class CategoryTests: XCTestCase {

    func testInitCategory(){
        let jsonString = """
        
        """
        
        guard let data = jsonString.data(using: .utf8) else {
            XCTFail("Cannot transform json string to data")
            return
        }
        
        
        guard let category = try? JSONDecoder().decode(Category.self, from:data) else{
            XCTFail("Cannot decode json data")
            return
        }
        
        XCTAssertEqual(category.identifier, 123, "Wrong category identifier")
        XCTAssertEqual(category.name, "General", "Wrong category name")
        XCTAssertEqual(category.description, "Achievements for accomplishments throughout Central Tyria.", "Wrong category description")
        XCTAssertEqual(category.order, 4, "Wrong category order")
        XCTAssertEqual(category.iconUrl, "" ,"Wrong category iconUrl")
    }

}
