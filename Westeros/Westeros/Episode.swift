//
//  Episode.swift
//  Westeros
//
//  Created by Fernando Jarilla on 28/7/17.
//  Copyright © 2017 Jarzasa. All rights reserved.
//

import UIKit

typealias Sinopsis = String

final class Episode {
    
    let title    : String
    let dateOfIssue: Date
    weak var season: Season?
    let image: UIImage?
    let sinopsis: Sinopsis?
    
    init(title: String, dateOfIssue: Date, season: Season, sinopsis: Sinopsis?=nil, image: UIImage?=nil) {
        (self.title, self.dateOfIssue, self.season) = (title, dateOfIssue, season)
        self.sinopsis = sinopsis
        self.image = image
    }
    
}

extension Episode: CustomStringConvertible {
    
    var description: String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "es_ES")
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        return "\(title). Estreno: \(dateFormatter.string(from: dateOfIssue))"
    }
}

extension Episode {
    var proxyForEquality: String {
        get {
            return "\(title) \(dateOfIssue)"
        }
    }
}

extension Episode: Equatable {
    
    public static func ==(lhs: Episode, rhs: Episode) -> Bool {
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
}

extension Episode: Hashable {
    public var hashValue: Int {
        get {
            return proxyForEquality.hashValue
        }
    }
}

extension Episode: Comparable {
    public static func <(lhs: Episode, rhs: Episode) -> Bool {
        return lhs.dateOfIssue < rhs.dateOfIssue
    }
}
