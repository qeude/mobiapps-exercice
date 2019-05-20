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
        {
            "id": 134,
            "name": "Salvation Pass",
            "description": "",
            "order": 10,
            "icon": "https://render.guildwars2.com/file/9F5C23543CB8C715B7022635C10AA6D5011E74B3/1302679.png",
            "achievements": [
              2826,
              2835,
              2830,
              2831,
              2824,
              2832,
              2836,
              2821,
              2823
            ]
        }
        """
        
        guard let data = jsonString.data(using: .utf8) else {
            XCTFail("Cannot transform json string to data")
            return
        }
        
        
        guard let category = try? JSONDecoder().decode(Category.self, from:data) else{
            XCTFail("Cannot decode json data")
            return
        }
        
        XCTAssertEqual(category.identifier, 134, "Wrong category identifier")
        XCTAssertEqual(category.name, "Salvation Pass", "Wrong category name")
        XCTAssertEqual(category.description, "", "Wrong category description")
        XCTAssertEqual(category.order, 10, "Wrong category order")
        XCTAssertEqual(category.iconUrl, "https://render.guildwars2.com/file/9F5C23543CB8C715B7022635C10AA6D5011E74B3/1302679.png" ,"Wrong category iconUrl")
    }

}
