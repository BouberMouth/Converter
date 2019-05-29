//
//  ViewController.swift
//  Converter
//
//  Created by Antoine on 28/05/2019.
//  Copyright © 2019 BOUBERBOUCHE Antoine. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var fromTextField: UITextField!
    @IBOutlet weak var toLabel: UILabel!
    @IBOutlet weak var fromUnitPicker: UIPickerView!
    @IBOutlet weak var toUnitPicker: UIPickerView!
    @IBOutlet weak var typePicker: UIPickerView!
    
    var conversionType: Convertible = Lenght() {
        didSet {
            toUnitPicker.reloadAllComponents()
            fromUnitPicker.reloadAllComponents()
        }
    }
    
    var fromUnit: Unit? {
        didSet {
            applyConversion()
        }
    }
    var toUnit: Unit? {
        didSet {
            applyConversion()
        }
    }
    var fromValue: Double? = 0 {
        didSet {
            applyConversion()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fromUnitPicker.delegate = self
        fromUnitPicker.dataSource = self
        toUnitPicker.delegate = self
        toUnitPicker.dataSource = self
        typePicker.dataSource = self
        typePicker.delegate = self
        fromTextField.delegate = self
        fromTextField.placeholder = "Enter the value to convert"
        fromTextField.keyboardType = .decimalPad
        fromTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
    
    //Handle converting and updating the UI
    private func applyConversion() {
        guard (fromValue != nil && fromUnit != nil && toUnit != nil) else {return}
        let conversionResult = conversionType.convert(fromValue!, from: fromUnit!, to: toUnit!)
        
        //Limit the decimal to 4 digits
        let fourDigitResult = round(conversionResult*10000)/10000
        
        //Convert to Int to display non-decimal value but prevent from getting out of Int range
        if fourDigitResult.truncatingRemainder(dividingBy: 1) == 0, fourDigitResult < Double(Int.max) {
            toLabel.text = "\(Int(fourDigitResult))"
        } else {
            toLabel.text = "\(fourDigitResult)"
        }
    }
}

//PickerView methods
extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == fromUnitPicker {
            return conversionType.unitNames.count
        } else if pickerView == toUnitPicker {
            return conversionType.unitNames.count
        } else if pickerView == typePicker {
            return ConversionTypes.strList.count
        } else {
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == fromUnitPicker {
            return conversionType.unitNames[row].capitalized
        } else if pickerView == toUnitPicker {
            return conversionType.unitNames[row].capitalized
        } else if pickerView == typePicker {
            return ConversionTypes.strList[row].capitalized
        } else {
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == fromUnitPicker {
            fromUnit = conversionType.unitList[row]
        } else if pickerView == toUnitPicker {
            toUnit = conversionType.unitList[row]
        } else if pickerView == typePicker {
            conversionType = ConversionTypes.types[row]
        }
    }
}
//TextField methods
extension ViewController: UITextFieldDelegate {
    
    @objc private func textDidChange(_ textField: UITextField) {
        guard let text = textField.text else {return}
        if let doubleValue = Double(text) {
            fromValue = doubleValue
        }
        if text.trimmingCharacters(in: [" "]) == "" {
            textField.text = ""
            fromValue = 0
        }
    }
}
