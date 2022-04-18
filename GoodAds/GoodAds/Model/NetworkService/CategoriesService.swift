//
//  CategoriesService.swift
//  GoodAds
//
//  Created by Kel_Jellysh on 13/04/2022.
//

import Foundation

class CategoriesService: ApiCategoriesService {
    
    //MARK: Singleton
    static let shared = CategoriesService()
    private init() {}
    
    //MARK: Properties
    private var dataTask: URLSessionDataTask?
    var session = URLSession(configuration: .default)
   
    init(session: URLSession) {
        self.session = session
    }
    //create URL request with UrlComponent 
    private func createRequest() -> URLRequest {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "raw.githubusercontent.com"
        urlComponents.path = "/leboncoin/paperclip/master/categories.json"

        var request = URLRequest(url: urlComponents.url!)
        request.httpMethod = "GET"
        request.allowsExpensiveNetworkAccess = true
        return request
    }
}
//MARK: Extension to separe setup part and api call method 
extension CategoriesService {
    //Method to fetch all classified ads in array 
   func getCategoriesData(completion: @escaping (Result<[CategoryAd], NetworkError>) -> Void) {
       let request = createRequest()
        session.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(.dataError))
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.responseError))
                return
            }
            do {
                let adList = try JSONDecoder().decode([CategoryAd].self, from: data)
                completion(.success(adList))
            } catch {
                completion(.failure(.decodingData))
            }
        }
        .resume()
    }
}
