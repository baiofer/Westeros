//
//  EpisodeViewController.swift
//  Westeros
//
//  Created by Fernando Jarilla on 30/7/17.
//  Copyright © 2017 Jarzasa. All rights reserved.
//

import UIKit

class EpisodeViewController: UIViewController {

    @IBOutlet weak var episodeImageView: UIImageView!
    @IBOutlet weak var episodeTextView: UITextView!
    let model: Episode
    
    @IBOutlet weak var seasonLabel: UILabel!
    @IBOutlet weak var episodeLabel: UILabel!
    
    init(model: Episode) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        self.title = model.title
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func syncViewWithModel() {
        // Model -> View
        seasonLabel.text = model.season?.name
        episodeLabel.text = model.title
        episodeImageView.image = model.image
        episodeTextView.text = model.sinopsis
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        syncViewWithModel()
    }

}
