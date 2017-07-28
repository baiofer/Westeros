//
//  HouseViewController.swift
//  Westeros
//
//  Created by Fernando Jarilla on 10/7/17.
//  Copyright © 2017 Jarzasa. All rights reserved.
//

import UIKit

class HouseViewController: UIViewController {

    //@IBOutlet weak var houseNameView: UILabel!
    @IBOutlet weak var wordsTextView: UILabel!
    @IBOutlet weak var sigilImageView: UIImageView!
    
    let model: House
    
    init(model: House) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        self.title = model.name
    }
    
    //Chapuza de los de Cupertino (relacionada con los nil)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func syncViewWithModel() {
        // Model -> View
        //houseNameView.text = "House \(model.name)"
        sigilImageView.image = model.sigil.image
        wordsTextView.text = model.words
    }
    
    @objc func displayWiki() {
        //Creamos un WikiVC
        let wikiVC = WikiViewController(model: model)
        
        //Lo cargamos en el navigator
        navigationController?.pushViewController(wikiVC, animated: true)
    }
    
    @objc func displayPerson() {
        //Creamos un PersonVC
        //Creamos un modelo
        let persons = model.sortedMembers()
        //Creamos los controladores
        let dataSource = DataSources.personDataSource(model: persons)
        let personVC = ArrayTableViewController(dataSource: dataSource,
                                                title: "Persons",
                                                style: .plain)

        navigationController?.pushViewController(personVC, animated: true)
    }
    
    //Forma de añadir botones en un navigation Controller
    func setupUI() {
        //Creamos los botones (wiki y person)
        let wiki = UIBarButtonItem(title: "Wiki",
                                   style: .plain,
                                   target: self,
                                   action: #selector(displayWiki))
        let person = UIBarButtonItem(title: "Person",
                                     style: .plain,
                                     target: self,
                                     action: #selector(displayPerson))
        
        //Los añadimos a la barra del navigationController
        navigationItem.rightBarButtonItems = [wiki, person]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupUI()
        
        syncViewWithModel()
    }

}
