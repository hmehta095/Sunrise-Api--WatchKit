//
//  ViewController.swift
//  Sunrise
//
//  Created by MacStudent on 2019-10-16.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func clickButtonPressed(_ sender: Any) {
        print("Button Pressed")
        
        let websiteURL = "https://api.sunrise-sunset.org/json?lat=43.6532&lng=-79.3832"
        AF.request(websiteURL).responseJSON{
            (xyz) in
            
            print(xyz)
            
            // convert the response to json  object
            
            let x = JSON(xyz.value)
            
            let sunrise = x["results"]["sunrise"]
            let sunset = x["results"]["sunset"]
            
            print("Sunrise: \(sunrise) ")
            print("Sunset: \(sunset) ")
            
            self.resultLabel.text = "Sunrise: \(sunrise) \n Sunset: \(sunset)"
            
            
        }
        
    }
    
}

