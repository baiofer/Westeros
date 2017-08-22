//
//  UIKitExtensions.swift
//  Westeros
//
//  Created by Fernando Jarilla on 11/7/17.
//  Copyright © 2017 Jarzasa. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func wrappedInNavigation() -> UINavigationController {
        let nav = UINavigationController(rootViewController: self)
        return nav
    }
}

extension String {
    
    //Convertir un string en Date
    func dateConvert() -> Date {
        let dateString = self
        let dateStringFormatter = DateFormatter()
        dateStringFormatter.dateFormat = "dd/MM/yyyy"
        let dateFromString = dateStringFormatter.date(from: dateString)
        return dateFromString!
    }
}

extension Date {

    //Convertir un Date en String
    func stringConvert() -> String {
        let stringDate = self
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        let stringFromDate = dateFormatter.string(from: stringDate)
        return stringFromDate
    }
}
