//
//  Categories.swift
//  GoodAds
//
//  Created by Kel_Jellysh on 13/04/2022.
//

import Foundation

struct Categories: Decodable {
    let categories: [Category]
    
    struct Category: Decodable {
        let id: Int
        let name: String
    }
}

