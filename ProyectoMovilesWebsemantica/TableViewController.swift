//
//  TableViewController.swift
//  ProyectoMovilesWebsemantica
//
//  Created by Benjamin Gil on 2/18/16.
//  Copyright © 2016 Websemantica. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController,UISearchBarDelegate {
    
    @IBOutlet weak var barraBusqueda: UISearchBar!
    
    @IBOutlet var tablaCompleta: UITableView!
    var buscando : Bool = false
    var filtroBusqueda:[String] = []
    
    private let datos = [
        "Frida Kahlo","Agua", "Swift","García Marquez","Cromosomas"
    ]
    private let frida = [
        "Casa Azul","Diego Rivera", "CEDART"
    ]
    private let agua = [
        "Composición molecular","SACMX", "Ciclo del agua"
    ]
    private let swift = [
        "Coursera: ITESM Swift","Apple México", "martinmolina.net"
    ]
    private let garcia = [
        "Creacionismo","Generación del 27", "Literatura española contemporánea"
    ]
    private let cromo = [
        "Genoma Humano","INMEGEN", "Cromosoma Y prescindible"
    ]
    
    let identificador = "Identificador"

    override func viewDidLoad() {
        super.viewDidLoad()
        tablaCompleta.delegate = self
        tablaCompleta.dataSource = self
        barraBusqueda.delegate = self
    }
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        buscando = true;
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        buscando = false;
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        buscando = false;
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        buscando = false;
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let sigVista=segue.destinationViewController as! ndTableViewController
        let indice=self.tableView.indexPathForSelectedRow?.row
        sigVista.detalle=datos[indice!]
        
        switch datos[indice!]{
        case "Frida Kahlo":
            sigVista.datos2=frida
        case "Agua":
            sigVista.datos2=agua
        case "Swift":
            sigVista.datos2=swift
        case "García Marquez":
            sigVista.datos2=garcia
        case "Cromosomas":
            sigVista.datos2=cromo
        default:
            break
        }
        
    }


    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
        filtroBusqueda = datos.filter({ (text) -> Bool in
            let tmp: NSString = text
            let range = tmp.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch)
            return range.location != NSNotFound
        })
        if(filtroBusqueda.count == 0){
            buscando = false;
        } else {
            buscando = true;
        }
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(buscando) {
            return filtroBusqueda.count
        }
        return datos.count;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tablaCompleta.dequeueReusableCellWithIdentifier(identificador)! as UITableViewCell;
        if(buscando){
            cell.textLabel?.text = filtroBusqueda[indexPath.row]
        } else {
            cell.textLabel?.text = datos[indexPath.row];
        }
        return cell;
    }


}
