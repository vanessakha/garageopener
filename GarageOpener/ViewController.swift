//
//  ViewController.swift
//  GarageOpener
//
//  Created by Vanessa on 10/15/17.
//  Copyright © 2017 Vanessa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK:
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func openGarage(_ sender: Any) {
        let webiopi = Webiopi()
        do{
            try webiopi.sendPulse(gpioNumber: 4)
        }catch{
            //TODO: pop-up UI for error
        }
    }
    
}

