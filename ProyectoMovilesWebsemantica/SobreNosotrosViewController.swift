//
//  SobreNosotrosViewController.swift
//  ProyectoMovilesWebsemantica
//
//  Created by Benjamin Gil, Carla Flores, David Manzanarez  on 12/02/16.
//  Copyright © 2016 Websemantica. All rights reserved.
//

import UIKit

class SobreNosotrosViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func regresar(sender: AnyObject) {
        self.presentingViewController?.dismissViewControllerAnimated(true,completion:nil);
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
