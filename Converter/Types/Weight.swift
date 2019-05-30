//
//  Weight.swift
//  Converter
//
//  Created by Antoine on 29/05/2019.
//  Copyright © 2019 BOUBERBOUCHE Antoine. All rights reserved.
//

//TODO: - ADD IMPERIAL SYSTEM VALUES
import Foundation

struct Weight: Convertible {
    
    var defaultUnitIndex: Int {
        return symbols.firstIndex(of: "g") ?? 0
    }
    
    enum Units: Unit {
        case milligram, centigram, decigram, gram, decagram, hectogram, kilogram, ton
    }
    
    let unitList: [Unit] = [Units.milligram, Units.centigram, Units.decigram, Units.gram, Units.decagram, Units.hectogram, Units.kilogram, Units.ton]
    let unitNames: [String] = ["milligram", "centigram", "decigram", "gram", "decagram", "hectogram", "kilogram", "ton"]
    let symbols: [String] = ["mg", "cg", "dg", "g", "dag", "hg", "kg", "t"]
    
    
    //Method which uses the two conversion methods below to achieve a full conversion
    func convert(_ fromValue: Double, from fromUnit: Unit, to toUnit: Unit) -> Double {
        let byteValue = Weight.convertToGram(fromValue, unit: fromUnit)
        return Weight.convertGramTo(toUnit, value: byteValue)
    }
    
    //Method which converts ANY weight unit value to GRAM
    static private func convertToGram(_ weight: Double, unit: Unit) -> Double {
        guard let unit = unit as? Weight.Units else {return 0}
        switch unit {
        case .milligram:
            return (weight / 1000) // x10^-3
        case .centigram:
            return (weight / 100) // x10^-2
        case .decigram:
            return (weight / 10) // x10^-1
        case .gram:
            return weight
        case .decagram:
            return (weight * 10)
        case .hectogram:
            return (weight * 100)
        case .kilogram:
            return (weight * 1000)
        case .ton:
            return (weight * 1000000)
        }
    }
    
    //Method which converts a GRAM value to ANY other weight units
    static private func convertGramTo(_ unit: Unit, value: Double) -> Double {
        guard let unit = unit as? Weight.Units else {return 0}
        switch unit {
        case .milligram:
            return (value * 1000) // x10^-3
        case .centigram:
            return (value * 100) // x10^-2
        case .decigram:
            return (value * 10) // x10^-1
        case .gram:
            return value
        case .decagram:
            return (value / 10)
        case .hectogram:
            return (value / 100)
        case .kilogram:
            return (value / 1000)
        case .ton:
            return (value / 1000000)
        }
    }
}
