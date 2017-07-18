//
//  Repository.swift
//  Westeros
//
//  Created by Fernando Jarilla on 11/7/17.
//  Copyright © 2017 Jarzasa. All rights reserved.
//

import Foundation

final class Repository {
    
    static let local = LocalFactory()
    
}

protocol HouseFactory {
    
    typealias Filter = (House) -> Bool
    
    var houses: [House] { get }
    func house(named: String) -> House?
    func houses(filteredBy: Filter) -> [House]
}

final class LocalFactory: HouseFactory {
    
    func houses(filteredBy: Filter) -> [House] {
        let filtered = Repository.local.houses.filter(filteredBy)
        return filtered
    }
    
    var houses: [House] {
        get {
            //Emblemas
            let starkSigil     = Sigil(image: #imageLiteral(resourceName: "codeIsComing.png"), description: "Direwolf")
            let lannisterSigil = Sigil(image: #imageLiteral(resourceName: "lannister.jpg"), description: "Rampant Lion")
            let mormontSigil   = Sigil(image: #imageLiteral(resourceName: "mormotSigil.png"), description: "Rampant bear")
            let greyjoySigil   = Sigil(image: #imageLiteral(resourceName: "greyjoySigil.png"), description: "A golden kraken on a black field")
            let targaryenSigil = Sigil(image: #imageLiteral(resourceName: "targaryenSigil.png"), description: "A red three-headed dragon")
            let tyrellSigil    = Sigil(image: #imageLiteral(resourceName: "tyrellSigil.png"), description: "A golden rose on a green field")
            
            //URLs
            let starkURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Stark")!
            let lannisterURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Lannister")!
            let mormontURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Mormont")!
            let greyjoyURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Greyjoy")!
            let targaryenURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Targaryen")!
            let tyrellURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Tyrell")!
            
            //Casas
            let stark     = House(name: "Stark", sigil: starkSigil, words: "Winter is coming", url: starkURL)
            let lannister = House(name: "Lannister", sigil: lannisterSigil, words: "Hear me roar", url: lannisterURL)
            let mormont   = House(name: "Mormont", sigil: mormontSigil, words: "Here we stand!", url: mormontURL)
            let greyjoy   = House(name: "Greyjoy", sigil: greyjoySigil, words: "We Do Not Sow", url: greyjoyURL)
            let targaryen = House(name: "Targaryen", sigil: targaryenSigil, words: "Fire and Blood", url: targaryenURL)
            let tyrell    = House(name: "Tyrell", sigil: tyrellSigil, words: "Growing Strong", url: tyrellURL)
            
            //Personajes
            // ---- Stark ----
            let robb    = Person(name: "Robb", alias: "The young wolf", house: stark)
            let sansa   = Person(name: "Sansa", alias: "Little bird", house: stark)
            let arya    = Person(name: "Arya", house: stark)
            let brandon = Person(name: "Brandon", alias: "The winged wolf", house: stark)
            let rickon  = Person(name: "Rickon", house: stark)
            
            // ---- Lannister ----
            let tyrion = Person(name: "Tyrion", alias: "The Imp", house: lannister)
            let jaime  = Person(name: "Jaime", alias: "KingSlayer", house: lannister)
            let cersei = Person(name: "Cersei", house: lannister)
            
            // ---- Mormont ----
            let lyanna = Person(name: "Lyanna", house: mormont)
            
            // ---- Greyjoy ----
            let asha  = Person(name: "Asha", alias: "Esgred", house: greyjoy)
            let theon = Person(name: "Theon", alias: "Reek", house: greyjoy)
            let euron = Person(name: "Euron III", alias: "Crow's Eye", house: greyjoy)
            
            // ---- Targaryen ----
            let daenerys = Person(name: "Daenerys", alias: "Dragonmother", house: targaryen)
            let viserys  = Person(name: "Viserys", alias: "The Beggar King", house: targaryen)
            
            // ---- Tyrell ----
            let mace     = Person(name: "Mace", alias: "Lord Oaf", house: tyrell)
            let loras    = Person(name: "Loras", alias: "The Knight of Flowers", house: tyrell)
            let margaery = Person(name: "Margaery", alias: "Little rose", house: tyrell)
            let olenna   = Person(name: "Olenna", alias: "Queen of Thorns", house: tyrell)
            
            //Añadir los personajes a las casas
            stark.add(persons: robb, sansa, arya, brandon, rickon)
            lannister.add(persons: tyrion, cersei, jaime)
            mormont.add(person: lyanna)
            greyjoy.add(persons: asha, theon, euron)
            targaryen.add(persons: daenerys, viserys)
            tyrell.add(persons: mace, loras, margaery, olenna)
           
            //Devolver array de casas
            return [stark, lannister, mormont, greyjoy, targaryen, tyrell].sorted()
        }
    }
    
    func house(named: String) -> House? {
        for hou in houses {
            if hou.name.uppercased() == named.uppercased() {
                return hou
            }
        }
        return nil
    }
    
    /* Otra forma
     func house(named: String) -> House? {
     let house = houses.filter { $0.name.uppercased() == named.uppercased() }.first
     return house
     }
    */
    
    
    
}
