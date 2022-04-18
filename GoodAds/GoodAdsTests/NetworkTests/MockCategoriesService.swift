//
//  MockCategoriesService.swift
//  GoodAdsTests
//
//  Created by Kel_Jellysh on 18/04/2022.
//


import XCTest
@testable import GoodAds

class MockCategoriesService: XCTestCase {
    
    var categoriesService: CategoriesService!
    
    override func setUp() {
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [URLTestProtocol.self]
        let session = URLSession(configuration: configuration)
        categoriesService = CategoriesService(session: session)
    }
}
