//
//  TableViewController.swift
//  ProyectoMovilesWebsemantica
//
//  Created by Benjamin Gil on 2/18/16.
//  Copyright © 2016 Websemantica. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    private let datos = [
        "Frida Kahlo","Agua", "Swift","García Marquez","Cromosomas"
    ]
    private let frida = [
        "Casa Azul","Diego rivera", "cedart"
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

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let sigVista=segue.destinationViewController as! ndTableViewController
        let indice=self.tableView.indexPathForSelectedRow?.row
        sigVista.detalle=datos[indice!]
        print(datos[indice!])
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
        // #warning Incomplete implementation, return the number of rows
        return datos.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(identificador)
        if (cell == nil) {
            cell = UITableViewCell(
                style: UITableViewCellStyle.Default, reuseIdentifier: identificador)
        }
        cell?.textLabel?.text=datos[indexPath.row]
        return cell! }
    

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
