//
//  FakeaData.swift
//  GoodAdsTests
//
//  Created by Kel_Jellysh on 18/04/2022.
//

import Foundation

class FakeResponseData {
    //MARK: Response
    static let responseOK = HTTPURLResponse(url: URL(string: "https://google.com")!, statusCode: 200, httpVersion: nil, headerFields: nil)
    //response KO
    static let responseKO = HTTPURLResponse(url: URL(string: "https://google.com")!, statusCode: 500, httpVersion: nil, headerFields: nil)
    
    //MARK: Data
    static var classifiedAdCorrectData: Data {
        let bundle = Bundle(for: FakeResponseData.self)
        let url = bundle.url(forResource: "FakeListing", withExtension: "json")
        let data = try! Data(contentsOf: url!)
        return data
    }
    static let classifiedAdIncorrectData = "Error" .data(using: .utf8)!
    
    static var categoriesCorrectData: Data {
        let bundle = Bundle(for: FakeResponseData.self)
        let url = bundle.url(forResource: "FakeCategories", withExtension: "json")
        let data = try! Data(contentsOf: url!)
        return data
    }
    static let categoriesIncorrectData = "Error" .data(using: .utf8)!
}

