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
}

