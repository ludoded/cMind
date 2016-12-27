//
//  ListViewModel.swift
//  cMind Interview
//
//  Created by Haik Ampardjian on 12/27/16.
//  Copyright © 2016 cMind. All rights reserved.
//

import Foundation

final class ListViewModel {
    private let maxInt = 20
    
    var data = [String]()
    
    func numberOfRows() -> Int {
        return data.count
    }
    
    /// Populate the data with 100 spelled out random numbers in range of [1,20]
    func populate() {
        for _ in 0..<100 {
            let random = randomNumber()
            let digitsArray = digits(from: random)
            let groupArray = group(from: digitsArray)
            let spelledPieces = spell(from: groupArray)
            let spelledText = spelledPieces.joined(separator: ", ")
            data.append(spelledText)
            
            debugPrint(spelledText)
        }
    }
    
    /// Random number from the upper bound as maxInt
    ///
    /// - Returns: NSDecimalNumber, can hold very large numbers
    func randomNumber() -> NSDecimalNumber {
        return NSDecimalNumber(decimal: Decimal.random(upper: maxInt))
    }
    
    /// Convert the Decimal number into array of digits in that number
    ///
    /// - Parameter number: NSDecimalNumber
    /// - Returns: [UInt64], array of digits
    func digits(from number: NSDecimalNumber) -> [UInt64] {
        var numberStr = number.stringValue
        var digits: [UInt64] = []
        
        for char in numberStr.characters {
            digits.append(UInt64(String(char)) ?? 0)
        }
        
        return digits
    }
    
    /// Group the digits by next algorithm:
    /// Group all similar followed digits into an array of digits
    /// i.e. [1,1,2,1] -> [[1,1], [2], [1]]
    ///
    /// - Parameter digits: [UInt64], array of digits
    /// - Returns: [[UInt64]], nested array of grouped digits
    func group(from digits: [UInt64]) -> [[UInt64]] {
        var result = [[UInt64]]()
        
        for digit in digits {
            if var lastArr = result.last, let lastNumber = lastArr.first, lastNumber == digit {
                lastArr.append(digit)
                result.removeLast()
                result.append(lastArr)
                continue
            }
            
            result.append([digit])
        }
        
        return result
    }
    
    /// Spell the grouped digits
    /// i.e. [[1,1], [2], [1]] -> ["two 1s", "one 2", "one 1"]
    ///
    /// - Parameter groups: [[UInt64]], nested array of grouped digits
    /// - Returns: [String], array of spelled grouped digits
    func spell(from groups: [[UInt64]]) -> [String] {
        var result = [String]()
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .spellOut
        
        for group in groups {
            let count = group.count
            let groupNumber = group.first ?? 0
            let spelledCount = formatter.string(from: NSNumber(integerLiteral: count)) ?? ""
            let pluralSuffix = count == 1 ? "" : "s"
            let spelledText = spelledCount + " " + String(groupNumber) + pluralSuffix
            
            result.append(spelledText)
        }
        
        return result
    }
}
