//
//  detalleController.swift
//  ProyectoMovilesWebsemantica
//
//  Created by Benjamin Gil on 2/19/16.
//  Copyright © 2016 Websemantica. All rights reserved.
//

import UIKit

class detalleController: UIViewController {
    var detalle:String=""
     var descripcion:String=""
    var pimagen:String=""

    @IBOutlet weak var ppimagen: UIImageView!
    @IBOutlet weak var detalleLabel: UILabel!
    @IBOutlet weak var descripcionTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        detalleLabel.text=detalle
        descripcionTextView.text=descripcion
        ppimagen.image = UIImage(named: pimagen)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
