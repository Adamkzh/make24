//
//  PickerController.swift
//  make24
//
//  Created by Adam on 5/4/18.
//  Copyright © 2018 Adam. All rights reserved.
//

import Foundation
import UIKit

class PickerController: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource{
    
    @IBOutlet weak var Picker1: UIPickerView!
    @IBOutlet weak var Picker2: UIPickerView!
    @IBOutlet weak var Picker3: UIPickerView!
    @IBOutlet weak var Picker4: UIPickerView!
    
    var Picker1Selected = "1"
    var Picker2Selected = "1"
    var Picker3Selected = "1"
    var Picker4Selected = "1"
    
     let number = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return number[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return number.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == Picker1 {
            Picker1Selected = number[row]
            print("num1: \(Picker1Selected)")
        }else if pickerView == Picker2 {
            Picker2Selected = number[row]
            print("num2: \(Picker2Selected)")
        }else if pickerView == Picker3 {
            Picker3Selected = number[row]
            print("num3: \(Picker3Selected)")
        }else {
            Picker4Selected = number[row]
            print("num4: \(Picker4Selected)")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    @IBAction func cancelPressed(_ sender: UIButton) {
        _ = navigationController?.popViewController(animated: true)
    }
    
}
