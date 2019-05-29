//
//  Model.swift
//  Converter
//
//  Created by Antoine on 29/05/2019.
//  Copyright © 2019 BOUBERBOUCHE Antoine. All rights reserved.
//

import Foundation

struct ConversionTypes {
    static let strList = ["lenght", "weight", "data"] //Names to display
    
    static let types: [Convertible] = [Lenght(), Weight(), Data()] //Instances to use for conversion
}

protocol Convertible {
    var unitList: [Unit] {get} //List of all enumeration case
    
    var unitNames: [String] {get} //List of all unit names
    
    var symbols: [String] {get} // List of all symbols
    
    //Method to convert any unit type, privately using two static functions to first convert the value into a base unit, and then from this base unit to the expected unit.
    func convert(_ fromValue: Double, from fromUnit: Unit, to toUnit: Unit) -> Double
}

protocol Unit {}
