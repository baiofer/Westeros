//
//  Season.swift
//  Westeros
//
//  Created by Fernando Jarilla on 28/7/17.
//  Copyright © 2017 Jarzasa. All rights reserved.
//

import UIKit

typealias Episodes = Set<Episode>

final class Season {
    
    let name    : String
    let releaseDate: Date
    var _episodes: Episodes
    
    var episodes: Episodes {
        return _episodes
    }
    
    init(name: String, releaseDate: Date) {
        self.name = name
        self.releaseDate = releaseDate
        _episodes = Episodes()
    }
}

extension Season: CustomStringConvertible {
    
    var description: String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "es_ES")
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        return "\(name). Comienzo: \(dateFormatter.string(from: releaseDate))"
    }
}

extension Season {
    
    var proxyForEquality: String {
        get {
            return "\(name) \(releaseDate)"
        }
    }
}

extension Season: Equatable {
    
    public static func ==(lhs: Season, rhs: Season) -> Bool {
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
}

extension Season: Hashable {
    
    public var hashValue: Int {
        get {
            return proxyForEquality.hashValue
        }
    }
}

extension Season: Comparable {
    
    public static func <(lhs: Season, rhs: Season) -> Bool {
        return lhs.releaseDate < rhs.releaseDate
    }
}

extension Season {
    
    var count: Int {
        return _episodes.count
    }
    
    func add(episode: Episode) {
        guard episode.season?.name == self.name else {
            return
        }
        _episodes.insert(episode)
    }
    
    //Función que puede recibir uno o mas parámetros
    func add(episodes: Episode...) {
        for episode in episodes {
            add(episode: episode)
        }
    }
}










