//
//  Data model.swift
//  Converter
//
//  Created by Antoine on 28/05/2019.
//  Copyright © 2019 BOUBERBOUCHE Antoine. All rights reserved.
//

import Foundation

struct Data: Convertible {
    
    
    enum Units: Unit {
        case bit, byte, kilobyte, megabyte, gigabyte, terabyte
    }
    
    let unitList: [Unit] = [Units.bit, Units.byte, Units.kilobyte, Units.megabyte, Units.gigabyte, Units.terabyte]
    let unitNames: [String] = ["bit", "byte", "kilobyte", "megabyte", "gigabyte", "terabyte"]
    let symbols: [String] = ["bit", "B", "KB", "MB", "GB", "TB"]
    
    
    //Method which uses the two conversion methods below to achieve a full conversion
    func convert(_ fromValue: Double, from fromUnit: Unit, to toUnit: Unit) -> Double {
        let byteValue = Data.convertToByte(fromValue, unit: fromUnit)
        return Data.convertByteTo(toUnit, value: byteValue)
    }
    
    //Method which converts ANY data unit value to BYTE
    static private func convertToByte(_ value: Double, unit: Unit) -> Double {
        guard let unit = unit as? Data.Units else {return 0}
        switch unit {
        case .bit:
            return (value / 8)
        case .byte:
            return value
        case .kilobyte:
            return (value * 1024)
        case .megabyte:
            return (value * 1048576)
        case .gigabyte:
            return (value * 1073741824)
        case .terabyte:
            return (value * 1099511627776)
        }
    }
    
    //Method which converts a BYTE value to ANY other data units
    static private func convertByteTo(_ unit: Unit, value: Double) -> Double {
        guard let unit = unit as? Data.Units else {return 0}
        switch unit {
        case .bit:
            return (value * 8)
        case .byte:
            return value
        case .kilobyte:
            return (value / 1024)
        case .megabyte:
            return (value / 1048576)
        case .gigabyte:
            return (value / 1073741824)
        case .terabyte:
            return (value / 1099511627776)
        }
    }
}
