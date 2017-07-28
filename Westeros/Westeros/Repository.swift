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
            let starkSigil     = Sigil(image: #imageLiteral(resourceName: "stark.png"), description: "Direwolf")
            let lannisterSigil = Sigil(image: #imageLiteral(resourceName: "lannister.png"), description: "Rampant Lion")
            let mormontSigil   = Sigil(image: #imageLiteral(resourceName: "mormotSigil.png"), description: "Rampant bear")
            let greyjoySigil   = Sigil(image: #imageLiteral(resourceName: "greyjoySigil.png"), description: "A golden kraken on a black field")
            let targaryenSigil = Sigil(image: #imageLiteral(resourceName: "targaryenSigil.png"), description: "A red three-headed dragon")
            let tyrellSigil    = Sigil(image: #imageLiteral(resourceName: "tyrellSigil.png"), description: "A golden rose on a green field")
            let arrynSigil     = Sigil(image: #imageLiteral(resourceName: "Arryn.png"), description: "As high as honor")
            let tullySigil     = Sigil(image: #imageLiteral(resourceName: "Tully.png"), description: "Familly, Duty, Honor")
            let baratheonSigil = Sigil(image: #imageLiteral(resourceName: "Baratheon.png"), description: "Ours in the fury")
            let martellSigil   = Sigil(image: #imageLiteral(resourceName: "Martell.png"), description: "Unbowed, Unbont, Unbroken")
            
            //URLs
            let starkURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Stark")!
            let lannisterURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Lannister")!
            let mormontURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Mormont")!
            let greyjoyURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Greyjoy")!
            let targaryenURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Targaryen")!
            let tyrellURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Tyrell")!
            let arrynURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Arryn")!
            let tullyURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Tully")!
            let baratheonURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Baratheon")!
            let martellURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Martell")!
            
            
            
            //Casas
            let stark     = House(name: "Stark", sigil: starkSigil, words: "Winter is coming", url: starkURL)
            let lannister = House(name: "Lannister", sigil: lannisterSigil, words: "Hear me roar", url: lannisterURL)
            let mormont   = House(name: "Mormont", sigil: mormontSigil, words: "Here we stand!", url: mormontURL)
            let greyjoy   = House(name: "Greyjoy", sigil: greyjoySigil, words: "We Do Not Sow", url: greyjoyURL)
            let targaryen = House(name: "Targaryen", sigil: targaryenSigil, words: "Fire and Blood", url: targaryenURL)
            let tyrell    = House(name: "Tyrell", sigil: tyrellSigil, words: "Growing Strong", url: tyrellURL)
            let arryn     = House(name: "Arryn", sigil: arrynSigil, words: "As High as Honor", url: arrynURL)
            let tully     = House(name: "Tully", sigil: tullySigil, words: "Familly, Duty, Honor", url: tullyURL)
            let baratheon = House(name: "Baratheon", sigil: baratheonSigil, words: "Ours in the fury", url: baratheonURL)
            let martell   = House(name: "Martell", sigil: martellSigil, words: "Unbowed, Unbont, Unbroken", url: martellURL)
            
            //Personajes
            // ---- Stark ----
            let robb    = Person(name: "Robb", alias: "The young wolf", house: stark)
            let sansa   = Person(name: "Sansa", alias: "Little bird", house: stark)
            let arya    = Person(name: "Arya", house: stark)
            let brandon = Person(name: "Brandon", alias: "The winged wolf", house: stark)
            let rickon  = Person(name: "Rickon", house: stark)
            let eddard  = Person(name: "Eddard", house: stark)
            let catelyn = Person(name: "Catelyn", house: stark)
            
            // ---- Lannister ----
            let tyrion = Person(name: "Tyrion", alias: "The Imp", house: lannister)
            let jaime  = Person(name: "Jaime", alias: "KingSlayer", house: lannister)
            let cersei = Person(name: "Cersei", house: lannister)
            
            // ---- Mormont ----
            let lyanna = Person(name: "Lyanna", house: mormont)
            let jorah  = Person(name: "Jorah", alias: "Andal", house: mormont)
            
            // ---- Greyjoy ----
            let asha  = Person(name: "Asha", alias: "Esgred", house: greyjoy)
            let theon = Person(name: "Theon", alias: "Reek", house: greyjoy)
            let euron = Person(name: "Euron III", alias: "Crow's Eye", house: greyjoy)
            let balon = Person(name: "Balon", alias: "Brave", house: greyjoy)
            
            // ---- Targaryen ----
            let daenerys = Person(name: "Daenerys", alias: "Dragonmother", house: targaryen)
            let viserys  = Person(name: "Viserys", alias: "The Beggar King", house: targaryen)
            let rhaegar  = Person(name: "Rhaegar", alias: "Silver Prince", house: targaryen)
            
            // ---- Tyrell ----
            let mace     = Person(name: "Mace", alias: "Lord Oaf", house: tyrell)
            let loras    = Person(name: "Loras", alias: "The Knight of Flowers", house: tyrell)
            let margaery = Person(name: "Margaery", alias: "Little rose", house: tyrell)
            let olenna   = Person(name: "Olenna", alias: "Queen of Thorns", house: tyrell)
            
            // ---- Martell ----
            let oberyn   = Person(name: "Oberyn", alias: "Red Viper", house: martell)
            
            // ---- Barhateon ----
            let stannis  = Person(name: "Stannis", alias: "King at the Wall", house: baratheon)
            let renly    = Person(name: "Renly", alias: "King in the South", house: baratheon)
            let joffrey  = Person(name: "Joffrey", alias: "Illborn", house: baratheon)
            
            //Añadir los personajes a las casas
            stark.add(persons: robb, sansa, arya, brandon, rickon, eddard, catelyn)
            lannister.add(persons: tyrion, cersei, jaime)
            mormont.add(persons: lyanna, jorah)
            greyjoy.add(persons: asha, theon, euron, balon)
            targaryen.add(persons: daenerys, viserys, rhaegar)
            tyrell.add(persons: mace, loras, margaery, olenna)
            martell.add(person: oberyn)
            baratheon.add(persons: stannis, renly, joffrey)
           
            //Devolver array de casas
            return [stark, lannister, mormont, greyjoy, targaryen, tyrell, martell, baratheon, tully, arryn].sorted()
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
