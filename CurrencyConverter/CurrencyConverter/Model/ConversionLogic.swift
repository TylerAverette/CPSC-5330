//
//  ConversionLogic.swift
//  CurrencyConverter
//
//  Created by Tyler Averette on 2/6/24.
//

import Foundation

class ConversionLogic {
    // Exhange rates are based on rates as of Feb 18th.
    // I set the exhange rates as variables for easy updating.
    static var jpYen: Float = 0
    static var russianRuble: Float = 0
    static var britishPound: Float = 0
    static var euro: Float = 0
    static var euroExRate: Float = 0.93
    static var yenExRate: Float = 149.33
    static var rubleExRate: Float = 91.18
    static var poundExRate: Float = 0.79
    static var usd: Float = 0
    static var usdAsString: String = ""
    static var yenAsString: String = ""
    static var rubleAsString: String = ""
    static var euroAsString: String = ""
    static var poundAsString: String = ""
    
    static func convertDollar() {
        jpYen = usd * yenExRate
        russianRuble = usd * rubleExRate
        britishPound = usd * poundExRate
        euro = usd * euroExRate
        roundAll()
    }
    
    static func roundAll() {
        usd = (Float(String(format: "%.2f", usd))! / 1000) * 1000
        jpYen = (Float(String(format: "%.2f", jpYen))! / 1000) * 1000
        russianRuble = (Float(String(format: "%.2f", russianRuble))! / 1000) * 1000
        euro = (Float(String(format: "%.2f", euro))! / 1000) * 1000
        britishPound = (Float(String(format: "%.2f", britishPound))! / 1000 * 1000)
    }
    
    static func toString() {
        print("toString called:")
        var result = "USD: \(usd)"
        result += "Yen: \(jpYen)"
        result += "Ruble: \(russianRuble)"
        result += "Euro: \(euro)"
        result += "Pound: \(britishPound)"
        print(result)
    }
    
}
