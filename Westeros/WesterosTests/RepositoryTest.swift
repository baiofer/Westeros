//
//  RepositoryTest.swift
//  Westeros
//
//  Created by Fernando Jarilla on 11/7/17.
//  Copyright © 2017 Jarzasa. All rights reserved.
//

import XCTest
@testable import Westeros

class RepositoryTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLocalRepositoryCreation() {
        XCTAssertNotNil(Repository.local)
    }
    
    func testLocalRepositoryHousesCreation() {
        let houses = Repository.local.houses
        XCTAssertNotNil(houses)
        XCTAssertEqual(houses.count, 2)
        XCTAssertLessThan(houses[0], houses[1])
    }
    
}
