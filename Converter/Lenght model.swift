//
//  Lenght model.swift
//  Converter
//
//  Created by Antoine on 28/05/2019.
//  Copyright © 2019 BOUBERBOUCHE Antoine. All rights reserved.
//

import Foundation

struct Lenght {
    
    enum Units {
        case nanometer, micrometer, millimeter, centimeter, decimeter, meter, decameter, hectometer, kilometer, inch, foot, yard, mile
    }
    
    static let unitList: [Units] = [.nanometer, .micrometer, .millimeter, .centimeter, .decimeter, .meter, .decameter, .hectometer, .kilometer, .inch, .foot, .yard, .mile]
    static let unitNames: [String] = ["nanometer", "micrometer", "millimeter", "centimeter", "decimeter", "meter", "decameter", "hectometer", "kilometer", "inch", "foot", "yard", "mile"]
    static let symbols: [String] = ["nm", "μm", "mm", "cm", "dm", "m", "dam", "hm", "km", "in", "ft", "yd", "mi"]
    
    static func convert(_ fromValue: Double, from fromUnit: Units, to toUnit: Units) -> Double {
        let meterValue = convertToMeter(fromValue, unit: fromUnit)
        return convertMeterTo(toUnit, value: meterValue)
    }
    
    private static func convertToMeter(_ lenght: Double, unit: Lenght.Units) -> Double {
        switch unit {
        case .nanometer:
            return (lenght / 1000000000) // x10^-9
        case .micrometer:
            return (lenght / 1000000) // x10^-6
        case .millimeter:
            return (lenght / 1000) // x10^-3
        case .centimeter:
            return (lenght / 100) // x10^-2
        case .decimeter:
            return (lenght / 10) // x10^-1
        case .meter:
            return lenght
        case .decameter:
            return (lenght * 10)
        case .hectometer:
            return (lenght * 100)
        case .kilometer:
            return (lenght * 1000)
        case .inch:
            return (lenght * 0.0254)
        case .foot:
            return (lenght * 0.3048)
        case .yard:
            return (lenght * 0.9144)
        case .mile:
            return (lenght * 1609.344)
        }
    }
    
    private static func convertMeterTo(_ unit: Units, value: Double) -> Double {
            switch unit {
            case .nanometer:
                return (value * 1000000000) // x10^-9
            case .micrometer:
                return (value * 1000000) // x10^-6
            case .millimeter:
                return (value * 1000) // x10^-3
            case .centimeter:
                return (value * 100) // x10^-2
            case .decimeter:
                return (value * 10) // x10^-1
            case .meter:
                return value
            case .decameter:
                return (value / 10)
            case .hectometer:
                return (value / 100)
            case .kilometer:
                return (value / 1000)
            case .inch:
                return (value / 0.0254)
            case .foot:
                return (value / 0.3048)
            case .yard:
                return (value / 0.9144)
            case .mile:
                return (value / 1609.344)
            }
    }
}
