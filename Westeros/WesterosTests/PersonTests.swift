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
    
    var starkHouse : House!
    var starkSigil : Sigil!
    var ned        : Person!
    
    var starkImage: UIImage!
    var lannisterImage: UIImage!
    
    var lannisterSigil: Sigil!
    
    var lannisterHouse: House!
    
    var robb: Person!
    var arya: Person!
    var tyrion: Person!
    
    
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        starkSigil = Sigil(image: #imageLiteral(resourceName: "codeIsComing.png"), description: "Direwolf")
        starkHouse = House(name: "Stark", sigil: starkSigil, words: "Winter is coming!")
        ned = Person(name: "Eddard", alias: "Ned", house: starkHouse)
        
        starkImage = #imageLiteral(resourceName: "codeIsComing.png")
        lannisterImage = #imageLiteral(resourceName: "lannister.jpg")
        
        starkSigil = Sigil(image: starkImage, description: "Direwolf")
        lannisterSigil = Sigil(image: lannisterImage, description: "Rampant Lion")
        
        starkHouse = House(name: "Stark", sigil: starkSigil, words: "Winter is comming")
        lannisterHouse = House(name: "Lannister", sigil: lannisterSigil, words: "Hear me roar")
        
        robb = Person(name: "Robb", alias: "The young wolf", house: starkHouse)
        arya = Person(name: "Arya", house: starkHouse)
        tyrion = Person(name: "Tyrion", alias: "The Imp", house: lannisterHouse)
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPersonExistence(){
        XCTAssertNotNil(tyrion)
        
        let pas = Person(name: "Pas", house: starkHouse)
        XCTAssertNotNil(pas)
    }
    
    func testFullName() {
        XCTAssertEqual(tyrion.fullName, "Tyrion Lannister")
    }
    
    func testPersonEquality() {
        //Ientidad
        XCTAssertEqual(tyrion, tyrion)
        //Igualdad
        let imp = Person(name: "Tyrion", alias: "The Imp", house: lannisterHouse)
        XCTAssertEqual(imp, tyrion)
        //Desigualdad
        XCTAssertNotEqual(tyrion, arya)
        
    }
    
    
    
    
    
    
}
