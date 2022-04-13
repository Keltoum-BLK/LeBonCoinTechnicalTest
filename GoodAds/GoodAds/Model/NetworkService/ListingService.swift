//
//  Listing Service.swift
//  GoodAds
//
//  Created by Kel_Jellysh on 13/04/2022.
//

import Foundation

class ListingService {
    
    private let session: URLSession

    init(session: URLSession) {
        self.session = session
    }

    private func createRequest() -> URLRequest {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "raw.githubusercontent.com"
        urlComponents.path = "/leboncoin/paperclip/master/listing.json"

        var request = URLRequest(url: urlComponents.url!)
        request.httpMethod = "GET"
        request.allowsExpensiveNetworkAccess = true
        request.timeoutInterval = TimeInterval(30)
        return request
    }
}

extension ListingService: ApiListingService {
    
    func getListingData(completion: @escaping (Result<[Listing], NetworkError>) -> Void) {
        <#code#>
    }
    
}
