//
//  Listing.swift
//  GoodAds
//
//  Created by Kel_Jellysh on 13/04/2022.
//

import Foundation

struct Listing: Decodable {
    let listing: [Ad]
    
    struct Ad: Decodable{
        let id: Int
        let category_id: Int
        let title: String
        let description: String
        let price: Float
        let images_url: [String]
        let creation_date: String
        let is_urgent: Bool 
    }
}
