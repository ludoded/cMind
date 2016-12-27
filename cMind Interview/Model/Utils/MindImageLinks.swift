//
//  MindImageLinks.swift
//  cMind Interview
//
//  Created by Haik Ampardjian on 12/27/16.
//  Copyright © 2016 cMind. All rights reserved.
//

import Foundation

struct MindImageLinks {
    let links: [String] = [
        "http://img-9gag-fun.9cache.com/photo/aDjNddN_460s.jpg",
        "http://img-9gag-fun.9cache.com/photo/aK2LRAZ_460s.jpg",
        "http://img-9gag-fun.9cache.com/photo/a8pnVMQ_460s.jpg",
        "http://img-9gag-fun.9cache.com/photo/a37x1jv_460s.jpg",
        "http://img-9gag-fun.9cache.com/photo/amrbrx4_460s.jpg",
        "http://img-9gag-fun.9cache.com/photo/a6MxPY8_460s.jpg",
        "http://img-9gag-fun.9cache.com/photo/aERQLBp_460s.jpg",
        "http://img-9gag-fun.9cache.com/photo/aW8dyn6_460s.jpg",
        "http://img-9gag-fun.9cache.com/photo/aBwvp7Z_460s.jpg",
        "http://img-9gag-fun.9cache.com/photo/a9WNWpW_460s.jpg",
        "http://img-9gag-fun.9cache.com/photo/a37xmn8_460s.jpg",
        "http://img-9gag-fun.9cache.com/photo/aBwN3ZD_460s.jpg"
    ]
    
    func randomLink() -> String {
        let upper = links.count
        let index = arc4random_uniform(UInt32(upper))
        return links[Int(index)]
    }
}
