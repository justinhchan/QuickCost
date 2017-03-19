//
//  SecondViewController.swift
//  QuickCost
//
//  Created by Justin Chan on 3/18/17.
//  Copyright © 2017 Justin Chan. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var price: UITextField!
    @IBOutlet weak var numPeople: UITextField!
    @IBOutlet weak var calculate: UIButton!
    @IBOutlet weak var finalPrice: UILabel!
    
    
    @IBAction func compute(_ sender: UIButton) {
        // Closes the keyboard
        self.price.resignFirstResponder()
        self.numPeople.resignFirstResponder()
        
        if (self.price.text != "" && self.numPeople.text != "") {
            var billPrice = Double(self.price.text!)!
            let splitBy = Double(self.numPeople.text!)!
            
            billPrice = billPrice / splitBy
            self.finalPrice.text = "$" + String(format: "%.2f",billPrice)
            
        } else if (self.price.text != "" && self.numPeople.text == "") {
            self.finalPrice.text = "$" + self.price.text!
        } else {
            self.finalPrice.text = "$0.00"
        }
    }
    
    
    // Closes the keyboard after touching the background
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Calculate button style
        calculate.layer.cornerRadius = 8
        calculate.layer.masksToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

