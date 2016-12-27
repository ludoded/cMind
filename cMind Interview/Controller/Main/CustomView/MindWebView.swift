//
//  MindWebView.swift
//  cMind Interview
//
//  Created by Haik Ampardjian on 12/27/16.
//  Copyright © 2016 cMind. All rights reserved.
//

import UIKit

final class MindWebView: UIView, Spinnerable {
    @IBOutlet weak internal var spinner: UIActivityIndicatorView!
    @IBOutlet weak var webView: UIWebView!
}
