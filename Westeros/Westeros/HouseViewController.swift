//
//  HouseViewController.swift
//  Westeros
//
//  Created by Fernando Jarilla on 10/7/17.
//  Copyright © 2017 Jarzasa. All rights reserved.
//

import UIKit

class HouseViewController: UIViewController {

    @IBOutlet weak var houseNameView: UILabel!
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
        houseNameView.text = "House \(model.name)"
        sigilImageView.image = model.sigil.image
        wordsTextView.text = model.words
    }
    
    @objc func displayWiki() {
        //Creamos un WikiVC
        let wikiVC = WikiViewController(model: model)
        
        //Lo cargamos en el navigator
        navigationController?.pushViewController(wikiVC, animated: true)
    }
    
    //Forma de añadir botones en un navigation Controller
    func setupUI() {
        //Creamos un botón
        let wiki = UIBarButtonItem(title: "Wiki",
                                   style: .plain,
                                   target: self,
                                   action: #selector(displayWiki))
        //Lo añadimos a la barra del navigationController
        navigationItem.rightBarButtonItem = wiki
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupUI()
        
        syncViewWithModel()
    }

}
