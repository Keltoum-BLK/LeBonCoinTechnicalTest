//
//  ApiService.swift
//  GoodAds
//
//  Created by Kel_Jellysh on 13/04/2022.
//

import Foundation
protocol ApiCategoriesService {
    func getCategoriesData(completion: @escaping (Result<[CategoryAd], NetworkError>) -> Void)
}
protocol ApiListingService {
    func getListingData(completion: @escaping (Result<[ClassifiedAd], NetworkError>) -> Void)
}
