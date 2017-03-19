//
//  FirstViewController.swift
//  QuickCost
//
//  Created by Justin Chan on 3/18/17.
//  Copyright © 2017 Justin Chan. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var oldPrice: UITextField!
    @IBOutlet weak var sale: UITextField!
    @IBOutlet weak var display: UILabel!
    @IBOutlet weak var computeButton: UIButton!
    
    @IBAction func compute(_ sender: UIButton) {
        
        // Closes the keyboard
        self.oldPrice.resignFirstResponder()
        self.sale.resignFirstResponder()
        
        if (self.oldPrice.text != "" && self.sale.text != "") {
            var price = Double(self.oldPrice.text!)!
            let saleOff = Double(self.sale.text!)! / 100.0
            
            price = price - (price * saleOff)
            self.display.text = "$" + String(format: "%.2f",price)
        } else if (self.oldPrice.text != "" && self.sale.text == "") {
            self.display.text = "$" + self.oldPrice.text!
        } else {
            self.display.text = "$0.00"
        }
        
    }
    
    // Closes the keyboard after touching the background
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        // Calculate button style
        computeButton.layer.cornerRadius = 8
        computeButton.layer.masksToBounds = true
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   


}

