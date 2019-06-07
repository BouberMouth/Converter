//
//  Volume.swift
//  Converter
//
//  Created by Antoine on 07/06/2019.
//  Copyright © 2019 BOUBERBOUCHE Antoine. All rights reserved.
//

import Foundation

struct Volume: Convertible {
    
    var defaultUnitIndex: Int {
        return symbols.firstIndex(of: "l") ?? 0
    }
    
    enum Units: Unit {
        case milliliter, centiliter, deciliter, liter, decaliter, hectoliter, kiloliter, cubicCentimeter, cubicMeter
    }
    
    let unitList: [Unit] = [Units.milliliter, Units.centiliter, Units.deciliter, Units.liter, Units.decaliter, Units.hectoliter, Units.kiloliter, Units.cubicCentimeter, Units.cubicMeter]
    let unitNames: [String] = ["milliliter", "centiliter", "deciliter", "liter", "decaliter", "hectoliter", "kiloliter", "cubic centimeter", "cubic meter"]
    let symbols: [String] = ["ml", "cl", "dl", "l", "dal", "hl", "kl", "cm³", "m³"]
    
    
    //Method which uses the two conversion methods below to achieve a full conversion
    func convert(_ fromValue: Double, from fromUnit: Unit, to toUnit: Unit) -> Double {
        let byteValue = Volume.convertToLiter(fromValue, unit: fromUnit)
        return Volume.convertLiterTo(toUnit, value: byteValue)
    }
    
    //Method which converts ANY weight unit value to GRAM
    static private func convertToLiter(_ volume: Double, unit: Unit) -> Double {
        guard let unit = unit as? Volume.Units else {return 0}
        switch unit {
        case .milliliter:
            return (volume / 1000) // x10^-3
        case .centiliter:
            return (volume / 100) // x10^-2
        case .deciliter:
            return (volume / 10) // x10^-1
        case .liter:
            return volume
        case .decaliter:
            return (volume * 10)
        case .hectoliter:
            return (volume * 100)
        case .kiloliter:
            return (volume * 1000)
        case .cubicCentimeter:
            return (volume / 1000)
        case .cubicMeter:
            return (volume * 1000)
        }
    }
    
    //Method which converts a GRAM value to ANY other weight units
    static private func convertLiterTo(_ unit: Unit, value: Double) -> Double {
        guard let unit = unit as? Volume.Units else {return 0}
        switch unit {
        case .milliliter:
            return (value * 1000) // x10^-3
        case .centiliter:
            return (value * 100) // x10^-2
        case .deciliter:
            return (value * 10) // x10^-1
        case .liter:
            return value
        case .decaliter:
            return (value / 10)
        case .hectoliter:
            return (value / 100)
        case .kiloliter:
            return (value / 1000)
        case .cubicCentimeter:
            return (value * 1000)
        case .cubicMeter:
            return (value / 1000)
        }
    }
}

