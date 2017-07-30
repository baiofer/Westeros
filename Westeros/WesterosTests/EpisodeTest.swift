//
//  EpisodeTest.swift
//  Westeros
//
//  Created by Fernando Jarilla on 28/7/17.
//  Copyright © 2017 Jarzasa. All rights reserved.
//

import XCTest
@testable import Westeros

class EpisodeTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testEpisodeExistence() {
        let season1 = Season(name: "Temporada 1", releaseDate: "09/05/2011".dateConvert())
        let episode = Episode(title: "Temporada 1", dateOfIssue: "09/05/2011".dateConvert(), season: season1)
        XCTAssertNotNil(episode)
    }
    
    func testEpisodeCustomStringConvertible() {
        let season1 = Season(name: "Temporada 1", releaseDate: "09/05/2011".dateConvert())
        let episode = Episode(title: "Winter is coming", dateOfIssue: "09/05/2011".dateConvert(), season: season1)
        let episodeString: String = episode.description
        XCTAssertEqual(episodeString, "Winter is coming. Estreno: 9 may 2011")
        XCTAssertNotEqual(episodeString, "The kingsroad. Estreno: 9 may 2011")
    }
    
    func testEpisodeEquality() {
        //Identidad
        let season1 = Season(name: "Temporada 1", releaseDate: "09/05/2011".dateConvert())
        let season2 = Season(name: "Temporada 2", releaseDate: "01/04/2012".dateConvert())
        let episode1 = Episode(title: "Winter is coming", dateOfIssue: "09/05/2011".dateConvert(), season: season1)
        let episode2 = Episode(title: "The north remembers", dateOfIssue: "01/04/2012".dateConvert(), season: season2)
        XCTAssertEqual(episode1, episode1)
        
        //Igualdad
        let season3 = Season(name: "Temporada 1", releaseDate: "09/05/2011".dateConvert())
        let episode3 = Episode(title: "Winter is coming", dateOfIssue: "09/05/2011".dateConvert(), season: season3)
        XCTAssertEqual(episode1, episode3)
        
        //Desigualdad
        XCTAssertNotEqual(episode1, episode2)
    }
    
    func testEpisodeHashable() {
        let season1 = Season(name: "Temporada 1", releaseDate: "09/05/2011".dateConvert())
        let episode1 = Episode(title: "Winter is coming", dateOfIssue: "09/05/2011".dateConvert(), season: season1)
        XCTAssertNotNil(episode1.hashValue)
    }
    
    func testEpisodeComparison() {
        let season1 = Season(name: "Temporada 1", releaseDate: "09/05/2011".dateConvert())
        let season2 = Season(name: "Temporada 2", releaseDate: "01/04/2012".dateConvert())
        let episode1 = Episode(title: "Winter is coming", dateOfIssue: "09/05/2011".dateConvert(), season: season1)
        let episode2 = Episode(title: "The north remembers", dateOfIssue: "01/04/2012".dateConvert(), season: season2)
        XCTAssertLessThan(episode1, episode2)
        XCTAssertGreaterThan(episode2, episode1)
    }
    
}
