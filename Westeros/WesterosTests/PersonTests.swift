//
//  PersonTests.swift
//  Westeros
//
//  Created by Fernando Jarilla on 6/7/17.
//  Copyright © 2017 Jarzasa. All rights reserved.
//

import XCTest
@testable import Westeros

class PersonTest: XCTestCase {
    
    var houses: [House]!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.

        houses = Repository.local.houses
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPersonExistence(){
        XCTAssertNotNil(houses[0].members)
    }
    
    func testFullName() {
        XCTAssertEqual(houses[0].members.first?.fullName, "Euron III Greyjoy")
    }
    
    func testPersonEquality() {
        //Ientidad
        XCTAssertEqual(houses[0].members.first, houses[0].members.first)
        //Igualdad
        let euron = Repository.local.house(named:"Greyjoy")?.members.first
        XCTAssertEqual(euron, houses[0].members.first)
        //Desigualdad
        XCTAssertNotEqual(houses[0].members.first, houses[1].members.first)
    }
}
