//
//  NetworkError.swift
//  GoodAds
//
//  Created by Kel_Jellysh on 13/04/2022.
//

import Foundation
//MARK: Enum to manage api call error 
enum NetworkError: Error {
    case dataError
    case responseError
    case decodingData
}

extension NetworkError {
    var description: String {
        switch self {
        case .dataError:
            return "Error retrieving data"
        case .responseError:
            return "No response from server"
        case .decodingData:
            return "Error decoding data information"
        }
    }
}
