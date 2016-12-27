//
//  UInt64.swift
//  cMind Interview
//
//  Created by Haik Ampardjian on 12/27/16.
//  Copyright © 2016 cMind. All rights reserved.
//

import UIKit

extension UInt64 {
    static func random(upper: UInt64 = max) -> UInt64 {
        var rnd : UInt64 = 0
        arc4random_buf(&rnd, MemoryLayout.size(ofValue: rnd))
        
        return rnd % upper
    }
}
