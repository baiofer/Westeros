//
//  Delegates.swift
//  Westeros
//
//  Created by Fernando Jarilla on 18/7/17.
//  Copyright © 2017 Jarzasa. All rights reserved.
//

import UIKit

//Creamos una clase genérica base de la que heredaremos para cada caso
//particular (House, Person, Episode, Season)
    
class BaseViewControllerDelegate<Element>: NSObject {
    var source: ArrayDataSource<Element>?
    weak var viewController: UIViewController?
}
    
//Ahora genero el delegado para cada tabla en una clase

//Delegado de House
final class HousesDelegate: BaseViewControllerDelegate<House>, UITableViewDelegate {
        
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let house = source?.element(atIndexPath: indexPath),
            let nav = viewController?.navigationController {
            
            let vc = HouseViewController(model: house)
            nav.pushViewController(vc, animated: true)
        }
    }
}

//Delegado de Season
final class SeasonsDelegate: BaseViewControllerDelegate<Season>, UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let season = source?.element(atIndexPath: indexPath),
            let nav = viewController?.navigationController {
            
            //Creamos un modelo
            let dataSource = DataSources.episodeDataSource(model: season.sortedEpisodes())
            let vc = ArrayTableViewController(dataSource: dataSource,
                                              title: "Episodes",
                                              style: .plain,
                                              delegate: EpisodesDelegate())
            nav.pushViewController(vc, animated: true)
        }
    }
}

//Delegado de Episode
final class EpisodesDelegate: BaseViewControllerDelegate<Episode>, UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let episode = source?.element(atIndexPath: indexPath),
            let nav = viewController?.navigationController {
            
            let vc = EpisodeViewController(model: episode)
            nav.pushViewController(vc, animated: true)
        }
    }
}
 

 
 
 
 
 
 
 
 
