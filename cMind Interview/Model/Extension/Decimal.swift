//
//  Decimal.swift
//  cMind Interview
//
//  Created by Haik Ampardjian on 12/27/16.
//  Copyright © 2016 cMind. All rights reserved.
//

import Foundation

extension Decimal {
    static func random(upper: Int) -> Decimal {
        var place: Decimal = 1
        var finalNumber: Decimal = 0
        let randomUpper = arc4random_uniform(20) + 1 // Upper bound in range [1,20]
        
        for _ in 0..<randomUpper {
            let randomNumber = arc4random_uniform(10)
            finalNumber = finalNumber + Decimal(randomNumber) * place
            place = place * Decimal(10)
        }
        
        return finalNumber
    }
}
