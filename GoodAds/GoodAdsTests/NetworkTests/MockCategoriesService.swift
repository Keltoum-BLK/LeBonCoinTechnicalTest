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
    
    func testGivenListOfAds_WhenYouCallApi_ThenResultSuccessCorrectData() {
        
        URLTestProtocol.loadingHandler = { request in
            let response: HTTPURLResponse = FakeResponseData.responseOK!
            let error: Error? = nil
            let data = FakeResponseData.categoriesCorrectData
            return (response, data, error)
        }
        
        let expectation = XCTestExpectation(description: "wait for change")
        
        categoriesService.getCategoriesData() { (result) in
            guard case .success(let categoriesList) = result else { XCTFail("failure")
                return
            }
            
            let listOfCategories = categoriesList
            
            let firstCategory = "Véhicule"
            XCTAssertNotNil(listOfCategories)
            XCTAssertEqual(firstCategory, listOfCategories[0].name)
            
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }
    
    func testGivenListOfAds_WhenYouCallApi_ThenResultFailureIncCorrectData() {
        
        URLTestProtocol.loadingHandler = { request in
            let response: HTTPURLResponse = FakeResponseData.responseKO!
            let error: Error? = nil
            let data = FakeResponseData.categoriesIncorrectData
            return (response, data, error)
        }
        
        let expectation = XCTestExpectation(description: "wait for change")
        
        categoriesService.getCategoriesData() { (result) in
            guard case .failure(let error) = result else { XCTFail("failure")
                return
            }
            
            XCTAssertNotNil(error)
            XCTAssert(error.description == "No response from server")
            
            expectation.fulfill()
            
        }
        wait(for: [expectation], timeout: 1)
    }
}

