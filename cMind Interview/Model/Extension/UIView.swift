//
//  UIView.swift
//  cMind Interview
//
//  Created by Haik Ampardjian on 12/27/16.
//  Copyright © 2016 cMind. All rights reserved.
//

import UIKit

extension UIView {
    static var cellId: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: cellId, bundle: Bundle.main)
    }
}
