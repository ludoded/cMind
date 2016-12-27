//
//  MainViewModel.swift
//  cMind Interview
//
//  Created by Haik Ampardjian on 12/27/16.
//  Copyright © 2016 cMind. All rights reserved.
//

import Foundation

final class MainViewModel {
    let googleRequest = URLRequest(url: URL(string: GoogleURL)!) // Force cast here is 100% successful.
    let links = MindImageLinks()
    
    func randomImage() {
        
    }
    
    func validate(request: URLRequest) -> Bool {
        guard let host = request.url?.host else { return false }
        return host.contains(YahooHost)
    }
}
