//
//  Data model.swift
//  Converter
//
//  Created by Antoine on 28/05/2019.
//  Copyright © 2019 BOUBERBOUCHE Antoine. All rights reserved.
//

import Foundation

struct Data {
    
    enum Units {
        case bit, byte, kilobyte, megabyte, gigabyte, terabyte
    }
    
    static let unitList: [Units] = [.bit, .byte, .kilobyte, .megabyte, .gigabyte, .terabyte]
    static let unitNames: [String] = ["bit", "byte", "kilobyte", "megabyte", "gigabyte", "terabyte"]
    static let symbols: [String] = ["bit", "B", "KB", "MB", "GB", "TB"]
    
    static func convert(_ fromValue: Double, from fromUnit: Units, to toUnit: Units) -> Double {
        let byteValue = convertToByte(fromValue, unit: fromUnit)
        return convertByteTo(toUnit, value: byteValue)
    }
    
     static func convertToByte(_ value: Double, unit: Data.Units) -> Double {
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
    
     static func convertByteTo(_ unit: Data.Units, value: Double) -> Double {
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
