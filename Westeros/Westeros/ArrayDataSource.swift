//
//  ArrayDataSource.swift
//  Westeros
//
//  Created by Fernando Jarilla on 18/7/17.
//  Copyright © 2017 Jarzasa. All rights reserved.
//

import UIKit

//Tiene que descender de NSObject para aprovechar todos los métodos propios
//de NSObject que el protocolo UITableView requiere
final class ArrayDataSource<Element>: NSObject, UITableViewDataSource {
    
    //Creamos un tipo (CellMaker) que nos vendrá como parámetro en el constructor
    //de la instancia. Recibe como parámetros de entrada el tipo del elemento
    //(Element) que necesita para configurar la celda (en nuestro caso será House, 
    //Person, Season o Episode), recibe también como entrada la tabla, que se necesita
    //para reaprovechar  celdas y devuelve una celda plenamente configurada.
    typealias CellMaker = (Element, UITableView) -> UITableViewCell
    
    //Como propiedades definimos el modelo y la clausura que debemos recibir
    private let _model: [Element]
    private let _cellMaker: CellMaker
    
    //El constructor necesita que le demos el array de elementos de la tabla y la
    //función de clausura que debo ejecutar tras definir el elemento que debo representar
    //Esta clausura, dará como salida la celda configurada.
    init(model: [Element], cellMaker: @escaping CellMaker) {
        _model = model
        _cellMaker = cellMaker
        super.init()
    }
    
    //Devuelve el elemento del array según el indexPath
    func element(atIndexPath indexPath: IndexPath) -> Element {
        return _model[indexPath.row]
    }
    
    //Métodos del data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _model.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //Este es el método que obtiene el elemento de la tabla y llama a la clausura
    //para devolver la celde que cree esta clausura.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let elt = element(atIndexPath: indexPath)
        return _cellMaker(elt, tableView)
    }
}
