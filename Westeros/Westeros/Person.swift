//
//  Person.swift
//  Westeros
//
//  Created by Fernando Jarilla on 6/7/17.
//  Copyright © 2017 Jarzasa. All rights reserved.
//

import Foundation

final class Person {
    
    let name : String
    let house : House
    private let _alias : String?
    
    var alias : String {
        get {
            return _alias ?? ""
        }
    }
    
    init(name: String, alias: String?=nil, house: House) {
        self.name = name
        _alias = alias
        self.house = house
    }
    
    //convenience init(name: String, house: House) {
     //   self.init(name: name, alias: nil, house: house)
    //}
}

extension Person {
    var fullName : String {
        get {
            return "\(name) \(house.name)"
        }
    }
}

extension Person {
    var proxy: String {
        return "\(name) \(alias) \(house.name)"
    }
    
    var proxyForComparision: String {
        return "\(name)"
    }
}

extension Person: Hashable {
    public var hashValue: Int {
        get {
            //let proxy = "\(name) \(alias) \(house.name)"
            return proxy.hashValue
        }
    }
}

extension Person: Equatable {
    public static func ==(lhs: Person, rhs: Person) -> Bool {
        return lhs.proxy == rhs.proxy
    }
}

extension Person: Comparable {
    static func <(lhs: Person, rhs: Person) -> Bool {
        return lhs.proxyForComparision < rhs.proxyForComparision
    }
}













