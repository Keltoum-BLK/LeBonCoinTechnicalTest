//
//  Listing.swift
//  GoodAds
//
//  Created by Kel_Jellysh on 13/04/2022.
//

import Foundation

// MARK: - ClassifiedAd
struct ClassifiedAd: Codable {
    let id, categoryID: Int?
    let title, description: String?
    let price: Int?
    let imagesURL: ImagesURL
    let creationDate: String?
    let isUrgent: Bool?
    let siret: String?

    enum CodingKeys: String, CodingKey {
        case id
        case categoryID = "category_id"
        case title
        case description = "description"
        case price
        case imagesURL = "images_url"
        case creationDate = "creation_date"
        case isUrgent = "is_urgent"
        case siret
    }
}
// MARK: - ImagesURL
struct ImagesURL: Codable {
    let small, thumb: String?
}





