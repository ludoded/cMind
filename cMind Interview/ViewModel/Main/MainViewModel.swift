//
//  MainViewModel.swift
//  cMind Interview
//
//  Created by Haik Ampardjian on 12/27/16.
//  Copyright © 2016 cMind. All rights reserved.
//

import Foundation
import Kingfisher

final class MainViewModel {
    let googleRequest = URLRequest(url: URL(string: GoogleURL)!) // Force cast here is 100% successful.
    let links = MindImageLinks()
    
    func randomImageResource() -> ImageResource? {
        let link = links.randomLink()
        guard let url = URL(string: link) else { return nil }
        let resource = ImageResource(downloadURL: url)
        
        return resource
    }
    
    func validate(request: URLRequest) -> Bool {
        guard let host = request.url?.host else { return false }
        return host.contains(YahooHost)
    }
}
