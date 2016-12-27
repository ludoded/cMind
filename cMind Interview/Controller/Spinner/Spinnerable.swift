//
//  Spinnerable.swift
//  cMind Interview
//
//  Created by Haik Ampardjian on 12/27/16.
//  Copyright © 2016 cMind. All rights reserved.
//

import UIKit

protocol Spinnerable {
    weak var spinner: UIActivityIndicatorView! { get set }
}

extension Spinnerable where Self: UIView {
    func startSpinning() {
        spinner.alpha = 1.0
        spinner.startAnimating()
    }
    
    func stopSpinning() {
        spinner.alpha = 0.0
        spinner.stopAnimating()
    }
}
