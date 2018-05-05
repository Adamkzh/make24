//
//  PickerController.swift
//  make24
//
//  Created by Adam on 5/4/18.
//  Copyright © 2018 Adam. All rights reserved.
//


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
        }else if pickerView == Picker2 {
            Picker2Selected = number[row]
        }else if pickerView == Picker3 {
            Picker3Selected = number[row]
        }else {
            Picker4Selected = number[row]
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Picker1.delegate = self
        Picker1.dataSource = self
        Picker2.delegate = self
        Picker2.dataSource = self
        Picker3.delegate = self
        Picker3.dataSource = self
        Picker4.delegate = self
        Picker4.dataSource = self
       
    }
    
    @IBAction func goPressed(_ sender: UIButton) {
        num1 = Double(Picker1Selected)!
        num2 = Double(Picker2Selected)!
        num3 = Double(Picker3Selected)!
        num4 = Double(Picker1Selected)!

        skippedTimesNum += 1
        attemptTimesNum = 1
    }
    @IBAction func cancelPressed(_ sender: UIButton) {
        _ = navigationController?.popViewController(animated: true)
    }
    
}
