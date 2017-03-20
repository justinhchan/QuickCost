//
//  ThirdViewController.swift
//  QuickCost
//
//  Created by Justin Chan on 3/19/17.
//  Copyright © 2017 Justin Chan. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var myCurrency:[String] = []
    var myValues:[Double] = []
    
    var activeCurrency:String = "";
    var activeValue:Double = 0;
    
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var output: UILabel!
    @IBOutlet weak var convert: UIButton!
    
    // Creating Picker View
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return myCurrency.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return myCurrency[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        activeValue = myValues[row]
        activeCurrency = myCurrency[row]
    }
    
    
    // Convert
    @IBAction func calculate(_ sender: UIButton) {
        
        if (input.text != "") {
            output.text = String( format: "%.2f",Double(input.text!)! * self.activeValue) + " " + activeCurrency
        }
    }
    
    // Closes the keyboard after touching the background
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Convert button style
        convert.layer.cornerRadius = 8
        convert.layer.masksToBounds = true
        
        // Getting data
        let url = URL(string: "http://api.fixer.io/latest?base=USD")
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if (error != nil) {
                print ("ERROR")
            } else {
                if let content = data {
                    do {
                        let myJson = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        
                        if let rates = myJson["rates"] as? NSDictionary {
                            for (key,value) in rates {
                                self.myCurrency.append((key as? String)!)
                                self.myValues.append((value as? Double)!)
                            }
                        }
                        
                    } catch {
                        
                    }
                }
            }
            self.pickerView.reloadAllComponents()
        }
        task.resume()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

