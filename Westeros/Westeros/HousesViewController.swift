//
//  HousesViewController.swift
//  Westeros
//
//  Created by Fernando Jarilla on 17/7/17.
//  Copyright © 2017 Jarzasa. All rights reserved.
//

import UIKit

class HousesViewController: UITableViewController {
    
    let model : [House]
    
    init(model: [House]) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = "Westeros"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellID = "HouseCell"
        //Descubrir cual es la casa que tenemos que mostrar
        let house = model[indexPath.row]
        
        //Crear una celda
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        
        if cell == nil {
            //La creo a pelo
            cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
        }
        //Sincronizar House -> Cell
        cell?.imageView?.image = house.sigil.image
        cell?.textLabel?.text = house.name
        
        return cell!
    }
    
    // MARK: - Table View Delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //Averiguamos cual es la casa
        let house = model[indexPath.row]
        
        //La mostramos
        let houseVC = HouseViewController(model: house)
        navigationController?.pushViewController(houseVC, animated: true)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    
}
