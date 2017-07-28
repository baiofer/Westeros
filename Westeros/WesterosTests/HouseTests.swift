//
//  HouseTests.swift
//  Westeros
//
//  Created by Fernando Jarilla on 6/7/17.
//  Copyright © 2017 Jarzasa. All rights reserved.
//

import XCTest
@testable import Westeros

class HouseTests: XCTestCase {
    var houses: [House]!
    
    override func setUp() {
        super.setUp()
        houses = Repository.local.houses 
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testHouseExistence() {
        XCTAssertNotNil(houses[0])
    }
    
    func testSigilExistence() {
        XCTAssertNotNil(houses[1].sigil)
        XCTAssertNotNil(houses[0].sigil)
    }
    
    func testAddPersons() {
        XCTAssertEqual(houses[1].count, 3)
    }
    
    func testHouseEquality() {
        //Identidad
        XCTAssertEqual(houses[1], houses[1])
        
        //Igualdad
        let jinxed = Repository.local.house(named: "Stark")
        XCTAssertEqual(jinxed, houses[6])
        
        //Desigualdad
        XCTAssertNotEqual(houses[1], houses[0])
    }
    
    func testHashable() {
        XCTAssertNotNil(houses[1].hashValue)
    }
    
    func testHouseComparison() {
        XCTAssertLessThan(houses[0], houses[1])
    }
        
}




















