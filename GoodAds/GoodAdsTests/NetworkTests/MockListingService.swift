//
//  MockListingSerive.swift
//  GoodAdsTests
//
//  Created by Kel_Jellysh on 18/04/2022.
//


import XCTest
@testable import GoodAds

class MockListingService: XCTestCase {
    
    var listingService: ListingService!
    
    override func setUp() {
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [URLTestProtocol.self]
        let session = URLSession(configuration: configuration)
        listingService = ListingService(session: session)
    }
    
    
    func testGivenListOfAds_WhenYouCallApi_ThenResultSuccessCorrectData() {
        
        URLTestProtocol.loadingHandler = { request in
            let response: HTTPURLResponse = FakeResponseData.responseOK!
            let error: Error? = nil
            let data = FakeResponseData.classifiedAdCorrectData
            return (response, data, error)
        }
        
        let expectation = XCTestExpectation(description: "wait for change")
        
        listingService.getListingData() { (result) in
            guard case .success(let classifiedAds) = result else { XCTFail("failure")
                return
            }
            
            let listOfAds = classifiedAds
            
            let firstAd = "Statue homme noir assis en plâtre polychrome"
            XCTAssertNotNil(listOfAds)
            XCTAssertEqual(firstAd, listOfAds[0].title)
            
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }
    
    func testGivenListOfAds_WhenYouCallApi_ThenResultFailureIncCorrectData() {
        
        URLTestProtocol.loadingHandler = { request in
            let response: HTTPURLResponse = FakeResponseData.responseKO!
            let error: Error? = nil
            let data = FakeResponseData.classifiedAdIncorrectData
            return (response, data, error)
        }
        
        let expectation = XCTestExpectation(description: "wait for change")
        
        listingService.getListingData() { (result) in
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

