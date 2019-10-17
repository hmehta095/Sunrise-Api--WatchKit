//
//  InterfaceController.swift
//  Sunrise WatchKit Extension
//
//  Created by MacStudent on 2019-10-16.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import WatchKit
import Foundation
import Alamofire
import SwiftyJSON


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var resultLabel: WKInterfaceLabel!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
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
            
//            self.resultLabel.set = "Sunrise: \(sunrise) \n Sunset: \(sunset)"
            self.resultLabel.setText("Sunrise: \(sunrise) \n Sunset: \(sunset)")
            
        }
        
    }


}
