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

   func getCategoriesData(completion: @escaping (Result<[Category], NetworkError>) -> Void) {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "raw.githubusercontent.com"
        urlComponents.path = "/leboncoin/paperclip/master/categories.json"

        guard let urlListing = urlComponents.url?.absoluteString else { return }
        guard let url = URL(string: urlListing) else { return }
        
        session.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(.dataError))
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.responseError))
                return
            }
            do {
                let adList = try JSONDecoder().decode([Category].self, from: data)
                completion(.success(adList))
            } catch {
                completion(.failure(.decodingData))
            }
        }
        .resume()
    }
}
