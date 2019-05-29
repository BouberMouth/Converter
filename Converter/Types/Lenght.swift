//
//  Lenght model.swift
//  Converter
//
//  Created by Antoine on 28/05/2019.
//  Copyright © 2019 BOUBERBOUCHE Antoine. All rights reserved.
//

import Foundation

struct Lenght: Convertible {
    
    enum Units: Unit {
        case nanometer, micrometer, millimeter, centimeter, decimeter, meter, decameter, hectometer, kilometer, inch, foot, yard, mile
    }
    
    let unitList: [Unit] = [Units.nanometer, Units.micrometer, Units.millimeter, Units.centimeter, Units.decimeter, Units.meter, Units.decameter, Units.hectometer, Units.kilometer, Units.inch, Units.foot, Units.yard, Units.mile]
    
    let unitNames: [String] = ["nanometer", "micrometer", "millimeter", "centimeter", "decimeter", "meter", "decameter", "hectometer", "kilometer", "inch", "foot", "yard", "mile"]
    let symbols: [String] = ["nm", "μm", "mm", "cm", "dm", "m", "dam", "hm", "km", "in", "ft", "yd", "mi"]
    
    //Method which uses the two conversion methods below to achieve a full conversion
    func convert(_ fromValue: Double, from fromUnit: Unit, to toUnit: Unit) -> Double {
        let meterValue = Lenght.convertToMeter(fromValue, unit: fromUnit)
        return Lenght.convertMeterTo(toUnit, value: meterValue)
    }
    
    //Method which converts ANY data unit value to METER
    private static func convertToMeter(_ lenght: Double, unit: Unit) -> Double {
        guard let unit = unit as? Lenght.Units else {return 0}
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
    
    //Method which converts a METER value to ANY other data units
    private static func convertMeterTo(_ unit: Unit, value: Double) -> Double {
        guard let unit = unit as? Lenght.Units else {return 0}
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
