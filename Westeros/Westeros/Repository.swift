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
    typealias FilterSeason = (Season) -> Bool
    
    var houses: [House] { get }
    var seasons: [Season] { get }
    func house(named: String) -> House?
    func houses(filteredBy: Filter) -> [House]
    func seasons(filteredBy: FilterSeason) -> [Season]
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
    
    func seasons(filteredBy: FilterSeason) -> [Season] {
        let filtered = Repository.local.seasons.filter(filteredBy)
        return filtered
    }
    
    var seasons: [Season] {
        get {
            //Temporadas
            let t1 = Season(name: "Season 1", releaseDate: "09/05/2011".dateConvert())
            let t2 = Season(name: "Season 2", releaseDate: "01/04/2012".dateConvert())
            let t3 = Season(name: "Season 3", releaseDate: "31/03/2013".dateConvert())
            let t4 = Season(name: "Season 4", releaseDate: "06/04/2014".dateConvert())
            let t5 = Season(name: "Season 5", releaseDate: "12/04/2015".dateConvert())
            let t6 = Season(name: "Season 6", releaseDate: "24/04/2016".dateConvert())
            let t7 = Season(name: "Season 7", releaseDate: "16/07/2017".dateConvert())
            
            
            //Episodios SEASON 1
            let e101 = Episode(title: "Winter is coming", dateOfIssue: "09/05/2011".dateConvert(), season: t1, sinopsis: "Jon Arryn, the Hand of the King, is dead. King Robert Baratheon plans to ask his oldest friend, Eddard Stark, to take Jon's place. Across the sea, Viserys Targaryen plans to wed his sister to a nomadic warlord in exchange for an army.", image: #imageLiteral(resourceName: "e101.jpg"))
            let e102 = Episode(title: "The kingsroad", dateOfIssue: "16/05/2011".dateConvert(), season: t1, sinopsis: "While Bran recovers from his fall, Ned takes only his daughters to King's Landing. Jon Snow goes with his uncle Benjen to the Wall. Tyrion joins them.", image: #imageLiteral(resourceName: "e102.jpg"))
            let e103 = Episode(title: "Lord Snow", dateOfIssue: "23/05/2011".dateConvert(), season: t1, sinopsis: "Lord Stark and his daughters arrive at King's Landing to discover the intrigues of the king's realm.", image: #imageLiteral(resourceName: "e103.jpg"))
            let e104 = Episode(title: "Cripples, Bastards and Broken Things", dateOfIssue: "30/05/2011".dateConvert(), season: t1, sinopsis: "Eddard investigates Jon Arryn's murder. Jon befriends Samwell Tarly, a coward who has come to join the Night's Watch.", image: #imageLiteral(resourceName: "e104.jpg"))
            let e105 = Episode(title: "The wolf and the lion", dateOfIssue: "06/06/2011".dateConvert(), season: t1, sinopsis: "Catelyn has captured Tyrion and plans to bring him to her sister, Lysa Arryn, at the Vale, to be tried for his, supposed, crimes against Bran. Robert plans to have Daenerys killed, but Eddard refuses to be a part of it and quits.", image: #imageLiteral(resourceName: "e105.jpg"))
            let e106 = Episode(title: "A golden crown", dateOfIssue: "13/06/2011".dateConvert(), season: t1, sinopsis: "While recovering from his battle with Jaime, Eddard is forced to run the kingdom while Robert goes hunting. Tyrion demands a trial by combat for his freedom. Viserys is losing his patience with Drogo.", image: #imageLiteral(resourceName: "e106.jpg"))
            let e107 = Episode(title: "You win or you die", dateOfIssue: "20/06/2011".dateConvert(), season: t1, sinopsis: "Robert has been injured while hunting and is dying. Jon and the others finally take their vows to the Night's Watch. A man, sent by Robert, is captured for trying to poison Daenerys. Furious, Drogo vows to attack the Seven Kingdoms.", image:#imageLiteral(resourceName: "e107.jpg"))
            let e108 = Episode(title: "The pointy end", dateOfIssue: "27/06/2011".dateConvert(), season: t1, sinopsis: "Eddard and his men are betrayed and captured by the Lannisters. When word reaches Robb, he plans to go to war to rescue them. The White Walkers attack the Wall. Tyrion returns to his father with some new friends.", image: #imageLiteral(resourceName: "e108.jpg"))
            let e109 = Episode(title: "Baelor", dateOfIssue: "04/07/2011".dateConvert(), season: t1, sinopsis: "Robb goes to war against the Lannisters. Jon finds himself struggling on deciding if his place is with Robb or the Night's Watch. Drogo has fallen ill from a fresh battle wound. Daenerys is desperate to save him.", image: #imageLiteral(resourceName: "e109.jpg"))
            let e110 = Episode(title: "Fire and blood", dateOfIssue: "11/07/2011".dateConvert(), season: t1, sinopsis: "With Ned dead, Robb vows to get revenge on the Lannisters. Jon must officially decide if his place is with Robb or the Night's Watch. Daenerys says her final goodbye to Drogo.", image: #imageLiteral(resourceName: "e110.jpg"))
            
            //Episodios SEASON 2
            let e201 = Episode(title: "The nord remembers", dateOfIssue: "01/04/2012".dateConvert(), season: t2, sinopsis: "Tyrion arrives at King's Landing to take his father's place as Hand of the King. Stannis Baratheon plans to take the Iron Throne for his own. Robb tries to decide his next move in the war. The Night's Watch arrive at the house of Craster.", image: #imageLiteral(resourceName: "e201.jpg"))
            let e202 = Episode(title: "The nigth lands", dateOfIssue: "08/04/2012".dateConvert(), season: t2, sinopsis: "Arya makes friends with Gendry. Tyrion tries to take control of the Small Council. Theon arrives at his home, Pyke, in order to persuade his father into helping Robb with the war. Jon tries to investigate Craster's secret.", image: #imageLiteral(resourceName: "e202.jpg"))
            let e203 = Episode(title: "What is dead may never die", dateOfIssue: "15/04/2012".dateConvert(), season: t2, sinopsis: "Tyrion tries to see who he can trust in the Small Council. Catelyn visits Renly to try and persuade him to join Robb in the war. Theon must decide if his loyalties lie with his own family or with Robb.", image: #imageLiteral(resourceName: "e203.jpg"))
            let e204 = Episode(title: "Garden of bones", dateOfIssue: "22/04/2012".dateConvert(), season: t2, sinopsis: "Lord Baelish arrives at Renly's camp just before he faces off against Stannis. Daenerys and her company are welcomed into the city of Qarth. Arya, Gendry, and Hot Pie find themselves imprisoned at Harrenhal.", image: #imageLiteral(resourceName: "e204.jpg"))
            let e205 = Episode(title: "The gost of Harrenhal", dateOfIssue: "29/04/2012".dateConvert(), season: t2, sinopsis: "Tyrion investigates a secret weapon that King Joffrey plans to use against Stannis. Meanwhile, as a token for saving his life, Jaqen H'ghar offers to kill three people that Arya chooses.", image: #imageLiteral(resourceName: "e205.jpg"))
            let e206 = Episode(title: "The old gods and the new", dateOfIssue: "06/05/2012".dateConvert(), season: t2, sinopsis: "Theon seizes control of Winterfell. Jon captures a wildling, named Ygritte. The people of King's Landing begin to turn against King Joffrey. Daenerys looks to buy ships to sail for the Seven Kingdoms.", image: #imageLiteral(resourceName: "e206.jpg"))
            let e207 = Episode(title: "A man without honor", dateOfIssue: "13/05/2012".dateConvert(), season: t2, sinopsis: "Bran and Rickon have escaped Winterfell. Theon tries to hunt them down. Daenerys' dragons have been stolen. Jon travels through the wilderness with Ygritte as his prisoner. Sansa has bled and is now ready to have Joffrey's children.", image: #imageLiteral(resourceName: "e207.jpg"))
            let e208 = Episode(title: "The prince of Winterfell", dateOfIssue: "20/05/2012".dateConvert(), season: t2, sinopsis: "Stannis is just days from King's Landing. Tyrion prepares for his arrival. Jon and Qhorin are taken prisoner by the wildlings. Catelyn is arrested for releasing Jaime. Arya, Gendry, and Hot Pie plan to escape from Harrenhal.", image: #imageLiteral(resourceName: "e208.jpg"))
            let e209 = Episode(title: "Blackwater", dateOfIssue: "27/05/2012".dateConvert(), season: t2, sinopsis: "Stannis Baratheon's fleet and army arrive at King's Landing and the battle for the city begins. Cersei plans for her and her children's future.", image: #imageLiteral(resourceName: "e209.jpg"))
            let e210 = Episode(title: "Valar Morghulis", dateOfIssue: "03/06/2012".dateConvert(), season: t2, sinopsis: "Joffrey puts Sansa aside for Margaery Tyrell. Robb marries Talisa Maegyr. Jon prepares to meet Mance Rayder. Arya says farewell to Jaqen H'ghar. Daenerys tries to rescue her dragons.", image: #imageLiteral(resourceName: "e210.jpg"))
            
            //Episodios SEASON 3
            let e301 = Episode(title: "Valar Dohaeris", dateOfIssue: "31/03/2013".dateConvert(), season: t3, sinopsis: "Jon is brought before Mance Rayder, the King Beyond the Wall, while the Night's Watch survivors retreat south. In King's Landing, Tyrion asks for his reward. Littlefinger offers Sansa a way out.", image: #imageLiteral(resourceName: "e301.jpg"))
            let e302 = Episode(title: "Dark wings, dark words", dateOfIssue: "07/04/2013".dateConvert(), season: t3, sinopsis: "Bran and company meet Jojen and Meera Reed. Arya, Gendry, and Hot Pie meet the Brotherhood. Jaime travels through the wilderness with Brienne. Sansa confesses her true feelings about Joffery to Margaery.", image: #imageLiteral(resourceName: "e302.jpg"))
            let e303 = Episode(title: "Walk of punishment", dateOfIssue: "14/04/2013".dateConvert(), season: t3, sinopsis: "Robb and Catelyn arrive at Riverrun for Lord Hoster Tully's funeral. Tywin names Tyrion the new Master of Coin. Arya says goodbye to Hot Pie. The Night's Watch returns to Craster's. Brienne and Jaime are taken prisoner.", image: #imageLiteral(resourceName: "e303.jpg"))
            let e304 = Episode(title: "And now his watch is ended", dateOfIssue: "21/04/2013".dateConvert(), season: t3, sinopsis: "Jaime mopes over his lost hand. Cersei is growing uncomfortable with the Tyrells. The Night's Watch is growing impatient with Craster. Daenerys buys the Unsullied.", image: #imageLiteral(resourceName: "e304.jpg"))
            let e305 = Episode(title: "Kissed by fire", dateOfIssue: "28/04/2013".dateConvert(), season: t3, sinopsis: "Robb's army is falling apart. Jaime reveals a story, to Brienne, that he has never told anyone. Jon breaks his vows. The Hound is granted his freedom. The Lannisters hatch a new plan.", image: #imageLiteral(resourceName: "e305.jpg"))
            let e306 = Episode(title: "The climb", dateOfIssue: "05/05/2013".dateConvert(), season: t3, sinopsis: "Jon and the wildlings scale the Wall. The Brotherhood sells Gendry to Melisandre. Robb does what he can to win back the Freys. Tyrion tells Sansa about their engagement.", image: #imageLiteral(resourceName: "e306.jpg"))
            let e307 = Episode(title: "The bear and the maiden fair", dateOfIssue: "12/05/2013".dateConvert(), season: t3, sinopsis: "Jon and the wildlings travel south of the Wall. Talisa tells Robb that she's pregnant. Arya runs away from the Brotherhood. Daenerys arrives at Yunkai. Jaime leaves Brienne behind at Harrenhal.", image: #imageLiteral(resourceName: "e307.jpg"))
            let e308 = Episode(title: "Second sons", dateOfIssue: "19/05/2013".dateConvert(), season: t3, sinopsis: "Daenerys tries to persuade the Second Sons to join her against Yunkai. Stannis releases Davos from the dungeons. Sam and Gilly are attacked by a White Walker. Sansa and Tyrion wed.", image: #imageLiteral(resourceName: "e308.jpg"))
            let e309 = Episode(title: "The rains of Castamere", dateOfIssue: "02/06/2013".dateConvert(), season: t3, sinopsis: "Robb and Catelyn arrive at the Twins for the wedding. Jon is put to the test to see where his loyalties truly lie. Bran's group decides to split up. Daenerys plans an invasion of Yunkai.", image: #imageLiteral(resourceName: "e309.jpg"))
            let e310 = Episode(title: "Mhysa", dateOfIssue: "09/06/2013".dateConvert(), season: t3, sinopsis: "Bran and company travel beyond the Wall. Sam returns to Castle Black. Jon says goodbye to Ygritte. Jaime returns to King's Landing. The Night's Watch asks for help from Stannis.", image: #imageLiteral(resourceName: "e310.jpg"))
            
            //Episodios SEASON 4
            let e401 = Episode(title: "Two swords", dateOfIssue: "06/04/2014".dateConvert(), season: t4, sinopsis: "Tyrion welcomes a guest to King's Landing. At Castle Black, Jon stands trial. Daenerys is pointed to Meereen, the mother of all slave cities. Arya runs into an old enemy.", image: #imageLiteral(resourceName: "e401.jpg"))
            let e402 = Episode(title: "The lion and the rose", dateOfIssue: "13/04/14".dateConvert(), season: t4, sinopsis: "Joffrey and Margaery's wedding has come. Tyrion breaks up with Shae. Ramsay tries to prove his worth to his father. Bran and company find a Weirwood tree.", image: #imageLiteral(resourceName: "e402.jpg"))
            let e403 = Episode(title: "Breaker of chains", dateOfIssue: "20/04/2014".dateConvert(), season: t4, sinopsis: "Tyrion is arrested for the murder of Joffery and awaits trial. Sansa escapes King's Landing. Sam sends Gilly to Mole's Town as the Night's Watch finds itself in a tight spot. Meereen challenges Daenerys.", image: #imageLiteral(resourceName: "e403.jpg"))
            let e404 = Episode(title: "Oathkeeper", dateOfIssue: "27/04/2014".dateConvert(), season: t4, sinopsis: "Jaime entrusts a task to Brienne. Daenerys frees Meereen. Jon is given permission to lead a group of Night's Watchmen to Craster's Keep. Bran and company are taken hostage.", image: #imageLiteral(resourceName: "e404.jpg"))
            let e405 = Episode(title: "First of his name", dateOfIssue: "04/05/2014".dateConvert(), season: t4, sinopsis: "Tommen is crowned King of the Seven Kingdoms. Cersei builds her case against Tyrion. Sansa and Lord Baelish arrive at the Eyrie. The Night's Watch attacks Craster's Keep.", image: #imageLiteral(resourceName: "e405.jpg"))
            let e406 = Episode(title: "The laws of gods and men", dateOfIssue: "11/05/2014".dateConvert(), season: t4, sinopsis: "Tyrion's trial has come. Yara and her troops storm the Dreadfort to free Theon. Daenerys meets Hizdar zo Loraq. Stannis makes a deal with the Iron Bank of Braavos.",image: #imageLiteral(resourceName: "e406.jpg"))
            let e407 = Episode(title: "Mockingbird", dateOfIssue: "18/05/2014".dateConvert(), season: t4, sinopsis: "Tyrion tries to find a champion. Daenerys sleeps with Daario. The Hound becomes wounded. Jon's advice is ignored at Castle Black. Brienne and Podrick receive a tip on Arya's whereabouts.", image: #imageLiteral(resourceName: "e407.jpg"))
            let e408 = Episode(title: "The mountain and the viper", dateOfIssue: "01/06/2014".dateConvert(), season: t4, sinopsis: "Theon helps Ramsay seize Moat Cailin. The wildlings attack Mole's Town. Sansa comes up with a story to protect Lord Baelish. Daenerys finds out a secret about Jorah Mormont. Oberyn Martell faces Gregor Clegane, the Mountain.", image: #imageLiteral(resourceName: "e408.jpg"))
            let e409 = Episode(title: "The watchers on the wall", dateOfIssue: "08/06/2014".dateConvert(), season: t4, sinopsis: "The battle between the Night's Watch and the wildlings has come.", image: #imageLiteral(resourceName: "e409.jpg"))
            let e410 = Episode(title: "The children", dateOfIssue: "15/06/2014".dateConvert(), season: t4, sinopsis: "Jon makes an important decision. Daenerys experiences new consequences. Brienne and Podrick have an unexpected encounter. Bran achieves a goal, while Tyrion makes an important discovery.", image: #imageLiteral(resourceName: "e410.jpg"))
            
            //Episodios SEASON 5
            let e501 = Episode(title: "The wars to come", dateOfIssue: "12/04/2015".dateConvert(), season: t5, sinopsis: "Cersei and Jaime adjust to a world without Tywin. Tyrion and Varys arrive at Pentos. In Meereen, a new enemy emerges. Jon is caught between two kings.", image: #imageLiteral(resourceName: "e501.jpg"))
            let e502 = Episode(title: "The house of black and white", dateOfIssue: "19/04/2015".dateConvert(), season: t5, sinopsis: "Arya arrives in Braavos. Jaime takes on a secret mission. Ellaria Sand seeks revenge for Oberyn's death. Stannis makes Jon a generous offer as the Night's Watch elects a new Lord Commander. Daenerys is faced with a difficult decision.", image: #imageLiteral(resourceName: "e502.jpg"))
            let e503 = Episode(title: "High sparrow", dateOfIssue: "26/04/2015".dateConvert(), season: t5, sinopsis: "Tommen and Margaery wed. Arya has trouble adapting to her new life. Littlefinger reveals his plans to Sansa. Jon gives his first orders as Lord Commander. Tyrion and Varys arrive in Volantis.", image: #imageLiteral(resourceName: "e503.jpg"))
            let e504 = Episode(title: "Sons of the harpy", dateOfIssue: "03/05/2015".dateConvert(), season: t5, sinopsis: "Jorah Mormont sets sail alongside his prisoner, Tyrion. Cersei makes a move against the Tyrells. Jaime and Bronn sneak into Dorne. Ellaria and the Sand Snakes make their plans. Melisandre tempts Jon. The Harpies attack.", image: #imageLiteral(resourceName: "e504.jpg"))
            let e505 = Episode(title: "Kill the boy", dateOfIssue: "10/05/2015".dateConvert(), season: t5, sinopsis: "Daenerys arrests the heads of Meereen's great families. Jon makes a difficult decision. Theon is forced to face Sansa. Stannis rides south. Tyrion and Jorah enter the ruins of Old Valyria.", image: #imageLiteral(resourceName: "e505.jpg"))
            let e506 = Episode(title: "Unbowed, unbent, unbroken", dateOfIssue: "17/05/2015".dateConvert(), season: t5, sinopsis: "Arya is put to the test. Tyrion and Jorah are captured by slavers. Loras Tyrell is judged by the Sparrows. Jaime and Bronn face the Sand Snakes. Sansa marries Ramsay Bolton.", image: #imageLiteral(resourceName: "e506.jpg"))
            let e507 = Episode(title: "The gift", dateOfIssue: "24/05/2015".dateConvert(), season: t5, sinopsis: "Jon heads east as trouble begins to stir for Sam and Gilly at Castle Black. Sansa asks Theon for help. Tyrion and Jorah are sold as slaves. Cersei savors her triumph over the Tyrells as new plots are developed in the shadows.", image: #imageLiteral(resourceName: "e507.jpg"))
            let e508 = Episode(title: "Hardhome", dateOfIssue: "31/05/2015".dateConvert(), season: t5, sinopsis: "Tyrion advises Daenerys. Sansa forces Theon to tell her a secret. Cersei remains stubborn. Arya meets her first target. Jon and Tormund meet with the wildling elders.", image: #imageLiteral(resourceName: "e508.jpg"))
            let e509 = Episode(title: "The dance of dragons", dateOfIssue: "07/06/2015".dateConvert(), season: t5, sinopsis: "Jon and the wildlings return to Castle Black. Jaime meets with Doran Martell. Stannis makes a hard choice. Arya runs into Meryn Trant. Daenerys attends the grand reopening of the fighting pits.", image: #imageLiteral(resourceName: "e509.jpg"))
            let e510 = Episode(title: "Mother's Mercy", dateOfIssue: "14/06/2015".dateConvert(), season: t5, sinopsis: "Stannis arrives at Winterfell. Tyrion runs Meereen as Daario and Jorah go after Daenerys. Jaime and Myrcella leave Dorne. Jon sends Sam and Gilly to Oldtown. Arya challenges the Many-Faced God. Cersei confesses her sins.", image: #imageLiteral(resourceName: "e510.jpg"))
            
            //Episodios SEASON 6
            let e601 = Episode(title: "The red woman", dateOfIssue: "24/04/2016".dateConvert(), season: t6, sinopsis: "The fate of Jon Snow is revealed. Daenerys is brought before Khal Moro. Tyrion gets used to living in Meereen. Ramsay sends his dogs after Theon and Sansa. Ellaria and the Sand Snakes make their move. Cersei mourns for Myrcella.", image: #imageLiteral(resourceName: "e601.jpg"))
            let e602 = Episode(title: "Home", dateOfIssue: "01/05/16".dateConvert(), season: t6, sinopsis: "Bran trains with the Three-Eyed Raven. Tommen meets with Cersei. Tyrion makes a bold move. Theon leaves while at Pyke new issues arise. Ramsay's brother is born. Davos asks Melisandre for a miracle.", image: #imageLiteral(resourceName: "e602.jpg"))
            let e603 = Episode(title: "Oathbreaker", dateOfIssue: "08/05/2016".dateConvert(), season: t6, sinopsis: "Daenerys arrives at Vaes Dothrak. Sam and Gilly sail for Horn Hill. Arya trains as No One. Varys finds information on the Sons of the Harpy. Ramsay receives a gift. Tommen meets with the High Sparrow. At Castle Black, a miracle occurs.", image: #imageLiteral(resourceName: "e603.jpg"))
            let e604 = Episode(title: "Book of the stranger", dateOfIssue: "15/05/2016".dateConvert(), season: t6, sinopsis: "Sansa arrives at Castle Black. Tyrion makes a deal with the slave masters. Jorah and Daario sneak into Vaes Dothrak. Ramsay sends a letter to Jon. Theon arrives at Pyke. Cersei and Olenna Tyrell plot against the High Sparrow.", image: #imageLiteral(resourceName: "e604.jpg"))
            let e605 = Episode(title: "The door", dateOfIssue: "22/05/2016".dateConvert(), season: t6, sinopsis: "Sansa and Jon make plans. Arya is given another chance to prove herself. Jorah confesses a secret to Daenerys. Tyrion meets with a red priestess. Yara finds her rule tested. Bran discovers the origin of the White Walkers.", image: #imageLiteral(resourceName: "e605.jpg"))
            let e606 = Episode(title: "Blood of my blood", dateOfIssue: "29/05/2016".dateConvert(), season: t6, sinopsis: "Bran and Meera find a new ally. Gilly meets Sam's family. Arya makes a difficult choice. The Lannisters and Tyrells march against the High Sparrow.", image: #imageLiteral(resourceName: "e606.jpg"))
            let e607 = Episode(title: "The broken man", dateOfIssue: "05/06/2016".dateConvert(), season: t6, sinopsis: "Jon and Sansa gather troops. Jaime arrives at Riverrun. Olenna Tyrell plans to leave King's Landing. Theon and Yara plan a destination. Arya makes plans to leave.", image: #imageLiteral(resourceName: "e607.jpg"))
            let e608 = Episode(title: "No one", dateOfIssue: "12/06/2016".dateConvert(), season: t6, sinopsis: "Brienne arrives at Riverrun. Arya seeks shelter. Jaime meets with Edmure Tully. Cersei challenges the Faith. Sandor Clegane hunts for revenge. Tyrion faces the consequences of earlier decisions.", image: #imageLiteral(resourceName: "e608.jpg"))
            let e609 = Episode(title: "Battle of the bastards", dateOfIssue: "19/06/2016".dateConvert(), season: t6, sinopsis: "Jon and Sansa face Ramsay Bolton on the fields of Winterfell. Daenerys strikes back at her enemies. Theon and Yara arrive in Meereen.", image: #imageLiteral(resourceName: "e609.jpg"))
            let e610 = Episode(title: "The winds of winter", dateOfIssue: "26/06/2016".dateConvert(), season: t6, sinopsis: "Cersei and Loras Tyrell stand trial by the gods. Daenerys prepares to set sail for Westeros. Davos confronts Melisandre. Sam and Gilly arrive in the Citadel. Bran discovers a long-kept secret. Lord Frey has an uninvited guest.", image: #imageLiteral(resourceName: "e610.jpg"))
            
            //Episodios SEASON 7
            let e701 = Episode(title: "Dragonstone", dateOfIssue: "16/07/2017".dateConvert(), season: t7, sinopsis: "Jon organizes the North's defenses. Cersei tries to even the odds. Daenerys comes home. Arya reminds the Freys 'The North remembers'. Sam adapts to life in Oldtown. Night King makes his way south.", image: #imageLiteral(resourceName: "e701.jpg"))
            let e702 = Episode(title: "Stormborn", dateOfIssue: "23/07/2017".dateConvert(), season: t7, sinopsis: "Daenerys receives an unexpected visitor. Jon faces resistance. Tyrion plans the conquest of Westeros. Cersei gathers her allies. Arya has a reunion with old friend. Sam risks his career and life.", image: #imageLiteral(resourceName: "e702.jpg"))
            let e703 = Episode(title: "The queen's justice", dateOfIssue: "30/07/2017".dateConvert(), season: t7, sinopsis: "Daenerys holds court. Cersei returns a gift. Jaime learns from his mistakes.", image: #imageLiteral(resourceName: "e703.jpg"))
            let e704 = Episode(title: "The spoils of war", dateOfIssue: "06/08/2017".dateConvert(), season: t7, sinopsis: "", image: #imageLiteral(resourceName: "e704.jpg"))
            
            //Añadir episodios a temporadas
            t1.add(episodes: e101, e102, e103, e104, e105, e106, e107, e108, e109, e110)
            t2.add(episodes: e201, e202, e203, e204, e205, e206, e207, e208, e209, e210)
            t3.add(episodes: e301, e302, e303, e304, e305, e306, e307, e308, e309, e310)
            t4.add(episodes: e401, e402, e403, e404, e405, e406, e407, e408, e409, e410)
            t5.add(episodes: e501, e502, e503, e504, e505, e506, e507, e508, e509, e510)
            t6.add(episodes: e601, e602, e603, e604, e605, e606, e607, e608, e609, e610)
            t7.add(episodes: e701, e702, e703, e704)
            
            //Devolver array de temporadas
            return [t1, t2, t3, t4, t5, t6, t7]
        }
    }
    
    /* Otra forma
     func house(named: String) -> House? {
     let house = houses.filter { $0.name.uppercased() == named.uppercased() }.first
     return house
     }
    */
    
    
    
}
