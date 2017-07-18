//
//  House.swift
//  Westeros
//
//  Created by Fernando Jarilla on 6/7/17.
//  Copyright © 2017 Jarzasa. All rights reserved.
//

import UIKit

// MARK: - Classes
typealias Words = String
typealias Members = Set<Person>

final class House {
    let name    : String
    let sigil   : Sigil
    let words   : Words
    let wikiURL : URL
    var _members: Members
    
    var members: Members {
        return _members
    }
    
    init(name: String, sigil: Sigil, words: Words, url: URL) {
        (self.name, self.sigil, self.words) = (name, sigil, words)
        _members = Members()
        self.wikiURL = url
    }
    
    func sortedMembers() -> [Person] {
        let membersArray: [Person] = Array(_members)
        return membersArray.sorted()
    }
}

final class Sigil {
    let description: String
    let image: UIImage
    
    init(image: UIImage, description: String) {
        (self.image, self.description) = (image, description)
    }
}

extension House {
    var count : Int {
        return _members.count
    }
    
    func add(person: Person) {
        guard person.house.name == self.name else {
            return
        }
        _members.insert(person)
    }
    
    //Función que puede recibir uno o mas parámetros
    func add(persons: Person...) {
        for person in persons {
            add(person: person)
        }
    }
}

extension House {
    var proxyForEquality: String {
        get {
            return "\(name) \(words) \(count)"
        }
    }
    
    var proxyForComparision: String {
        get {
            return name.uppercased()
        }
    }
}

//MARK: - Equatable
extension House: Equatable {
    static func ==(lhs: House, rhs: House) -> Bool {
        return (lhs.proxyForEquality == rhs.proxyForEquality)
    }
}

//MARK: - Hashable
extension House: Hashable {
    var hashValue: Int {
        return proxyForEquality.hashValue
    }
}

//MARK: - Comparable
extension House: Comparable {
    static func <(lhs: House, rhs: House) -> Bool {
        return lhs.proxyForComparision < rhs.proxyForComparision
    }
}























