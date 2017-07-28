//
//  DataSources.swift
//  Westeros
//
//  Created by Fernando Jarilla on 18/7/17.
//  Copyright © 2017 Jarzasa. All rights reserved.
//

import UIKit

final class DataSources {
    
    //En esta clase crearemos tantas funciones como tablas vayamos a controlar.
    //Cada función recibirá como entrada el modelo y dará como salida una instancia
    //de ArrayDataSource adaptado al modelo (tipo) que le demos
    
    //Data source de Houses
    static func houseDataSource(model: [House]) -> ArrayDataSource<House> {
        
        return ArrayDataSource(model: model, cellMaker: { (house: House, tableView: UITableView) -> UITableViewCell in
            
            let cellID = "House"
            var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
            if cell == nil {
                cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellID)
            }
            cell?.imageView?.image = house.sigil.image
            cell?.textLabel?.text = house.name
            cell?.detailTextLabel?.text = "\(house.count) members"
            return cell!
        })
    }
    
    //Data source de Persons
    static func personDataSource(model: [Person]) -> ArrayDataSource<Person> {
        
        return ArrayDataSource(model: model, cellMaker: { (person: Person, tableView: UITableView) -> UITableViewCell in
            
            let cellID = "Person"
            var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
            if cell == nil {
                cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellID)
            }
            cell?.textLabel?.text = person.fullName
            cell?.detailTextLabel?.text = person.alias
            return cell!
        })
    }
    
    //Data source de Seasons
    
    
    //Data source de Episodes
    
}
