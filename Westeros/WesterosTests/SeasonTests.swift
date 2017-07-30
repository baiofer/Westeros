//
//  SeasonTests.swift
//  Westeros
//
//  Created by Fernando Jarilla on 28/7/17.
//  Copyright © 2017 Jarzasa. All rights reserved.
//

import XCTest
@testable import Westeros

class SeasonTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSeasonExistence() {
        let season = Season(name: "Temporada 1", releaseDate: "09/05/2011".dateConvert())
        XCTAssertNotNil(season)
    }
    
    func testSeasonCustomStringConvertible() {
        let season = Season(name: "Temporada 1", releaseDate: "09/05/2011".dateConvert())
        let seasonString: String = season.description
        XCTAssertEqual(seasonString, "Temporada 1. Comienzo: 9 may 2011")
        XCTAssertNotEqual(seasonString, "Temporada 2. Comienzo: 9 may 2011")
    }
    
    func testSeasonEquality() {
        //Identidad
        let season1 = Season(name: "Temporada 1", releaseDate: "09/05/2011".dateConvert())
        let season2 = Season(name: "Temporada 2", releaseDate: "01/04/2012".dateConvert())
        XCTAssertEqual(season1, season1)
        
        //Igualdad
        let season3 = Season(name: "Temporada 1", releaseDate: "09/05/2011".dateConvert())
        XCTAssertEqual(season1, season3)
        
        //Desigualdad
        XCTAssertNotEqual(season1, season2)
    }
    
    func testSeasonHashable() {
        let season1 = Season(name: "Temporada 1", releaseDate: "09/05/2011".dateConvert())
        XCTAssertNotNil(season1.hashValue)
    }
    
    func testSeasonComparison() {
        let season1 = Season(name: "Temporada 1", releaseDate: "09/05/2011".dateConvert())
        let season2 = Season(name: "Temporada 2", releaseDate: "01/04/2012".dateConvert())
        XCTAssertLessThan(season1, season2)
        XCTAssertGreaterThan(season2, season1)
    }
    
    func testAddEpisodeToSeason() {
        let season1 = Season(name: "Temporada 1", releaseDate: "09/05/2011".dateConvert())
        let episode1 = Episode(title: "Winter is coming", dateOfIssue: "09/05/2011".dateConvert(), season: season1)
        season1.add(episode: episode1)
        XCTAssertEqual(season1.count, 1)
    }
    
    func testAddEpisodesToSeason() {
        let season1 = Season(name: "Temporada 1", releaseDate: "09/05/2011".dateConvert())
        let episode1 = Episode(title: "Winter is coming", dateOfIssue: "09/05/2011".dateConvert(), season: season1)
        let episode2 = Episode(title: "The Kingsroad", dateOfIssue: "16/05/2011".dateConvert(), season: season1)
        season1.add(episodes: episode1, episode2)
        XCTAssertEqual(season1.count, 2)
    }
    
    func testSeasonsOrdered() {
        let seasons = Repository.local.seasons
        XCTAssertEqual(seasons, seasons.sorted())
    }
}
