//
//  2ndTableViewController.swift
//  ProyectoMovilesWebsemantica
//
//  Created by Benjamin Gil on 2/18/16.
//  Copyright © 2016 Websemantica. All rights reserved.
//

import UIKit
import ImageIO

class ndTableViewController: UITableViewController, UISearchBarDelegate{
    
    @IBOutlet weak var barraBusqueda: UISearchBar!
    
    @IBOutlet var tablaCompleta: UITableView!
    
    var buscando : Bool = false
    var filtroBusqueda:[String] = []
    
    var detalle:String=""
    var datos2:[String]=[]
    let identificador = "Identificador"
     var descripciones:[String]=["También conocido como la Casa Azul, es de los sitios turísticos y culturales más representativos de la zona; la casa perteneció a la familia Kahlo desde el año 1904 y fue en 1958 cuando fue convertida en museo, cuatro años después de la muerte de la pintora.","Diego Rivera (Guanajuato, 8 de diciembre de 1886 — Ciudad de México, 24 de noviembre de 1957)1 fue un destacado muralista mexicano de ideología comunista, famoso por plasmar obras de alto contenido social en edificios públicos","Este modelo educativo integra la formación del bachillerato con el estudio de asignaturas provenientes de cinco áreas artísticas.","El agua (H2O) es un compuesto químico inorgánico formado por dos átomos de hidrógeno (H) y uno de oxígeno (O). Esta molécula es esencial en la vida de los seres vivos, al servir de medio para el metabolismo de las biomoléculas y se encuentra en la naturaleza en sus tres estados.","Sacmex es un organismo mexicano público que actúa en el área de servicios de saneamiento, el cual esta sectorizado en la Secretaría del Medio Ambiente. ","El ciclo hidrológico o ciclo del agua es un ciclo biogeoquímico, en el cual hay un proceso de circulación del agua entre las distintas partes de la hidrósfera, permitiendo al agua pasar de un estado físico a otro mediante reacciones químicas."]
    var picture:[String] = [
       "casaAzul",
       "diegoR",
        "cedart",
        "mol",
        "sacmx",
      "ciclo"  ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tablaCompleta.delegate = self
        tablaCompleta.dataSource = self
        barraBusqueda.delegate = self
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let sigVista=segue.destinationViewController as! detalleController
        let indice=self.tableView.indexPathForSelectedRow?.row
        print(datos2[indice!])
        sigVista.detalle=datos2[indice!]
        
        switch datos2[indice!]{
        case "Casa Azul":
            sigVista.detalle=datos2[indice!]
            sigVista.descripcion=descripciones[0]
            sigVista.pimagen=picture[0]
            
            
        case "Diego Rivera":
            sigVista.detalle=datos2[indice!]
            sigVista.descripcion=descripciones[1]
            sigVista.pimagen=picture[1]
            
        case "CEDART":
            sigVista.detalle=datos2[indice!]
            sigVista.descripcion=descripciones[2]
            sigVista.pimagen=picture[2]
            
        case "Composición molecular":
            sigVista.detalle=datos2[indice!]
            sigVista.descripcion=descripciones[3]
            sigVista.pimagen=picture[3]
            
        case "SACMX":
            sigVista.detalle=datos2[indice!]
            sigVista.descripcion=descripciones[4]
            sigVista.pimagen=picture[4]
            
        case "Ciclo del agua":
            sigVista.detalle=datos2[indice!]
            sigVista.descripcion=descripciones[5]
            sigVista.pimagen=picture[5]
        default:
            break
        }
        
    }
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
        filtroBusqueda = datos2.filter({ (text) -> Bool in
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
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(buscando) {
            return filtroBusqueda.count
        }
        return datos2.count;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tablaCompleta.dequeueReusableCellWithIdentifier(identificador)! as UITableViewCell;
        if(buscando){
            cell.textLabel?.text = filtroBusqueda[indexPath.row]
        } else {
            cell.textLabel?.text = datos2[indexPath.row];
        }
        return cell;
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
