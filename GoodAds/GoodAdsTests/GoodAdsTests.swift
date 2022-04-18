//
//  GoodAdsTests.swift
//  GoodAdsTests
//
//  Created by Kel_Jellysh on 13/04/2022.
//

import XCTest
@testable import GoodAds

class GoodAdsTests: XCTestCase {

    
    private var tool: Tool!
    private var classifiedAd1: ClassifiedAd!
    private var classifiedAd2: ClassifiedAd!
    private var cat1: CategoryAd!
    private var cat2: CategoryAd!
    
    override func setUp() {
        super.setUp()
        tool = Tool()
        classifiedAd1 = ClassifiedAd(id: 1, categoryID: 2, title: "Pamplemousse", description: "Fruit excellent pour la santé", price: 1, imagesURL: ImagesURL(small: "", thumb: ""), creationDate: "24 decembre 2012", isUrgent: true, siret: "")
        classifiedAd2 = ClassifiedAd(id: 1, categoryID: 1, title: "Radio réveil", description: "Radio Réveil en bon état", price: 5, imagesURL: ImagesURL(small: "", thumb: ""), creationDate: "2 janvier 2020", isUrgent: false, siret: "")
        cat1 = CategoryAd(id: 2, name: "Alimentaire")
        cat2 = CategoryAd(id: 1, name: "Accessoires")
    }
    
    override class func tearDown() {
        super.tearDown()
    }
    
    override func tearDownWithError() throws {
        tool = nil
        classifiedAd1 = nil
        classifiedAd2 = nil
        cat1 = nil
        cat2 = nil
    }
    
    //MARK: Tests on Tool Class
    func testClassifiedAdsList_WhenSortAdsByCreationDate_ThenReturnASortedList() {
        //Given
        let listOfAds = [classifiedAd1, classifiedAd2]
        //When
        let result = tool.sortedAds(from: listOfAds)
        //Then
        XCTAssertTrue((result[0].creationDate != nil), "2 janvier 2020")
        XCTAssertTrue((result[1].creationDate != nil), "24 decembre 2012")
    }
    
    func testClassifiedAdsList_WhenSortAdsByUrgentValue_ThenReturnASortedList() {
        //Given
        let listOfAds = [classifiedAd1, classifiedAd2]
        //When
        let result = tool.sortedUrgentAds(from: listOfAds)
        //Then
        XCTAssertTrue(result[0].isUrgent == classifiedAd1.isUrgent)
    }
    
    func testConvertDateFormat_WhenAddADateStringValue_ThenReturnANewDateFormat() {
        //Given
        let creationDate = "2019-11-05T15:56:59+0000"
        //When
        let result = tool.convertDate(from: creationDate)
        print(result)
        //Then
        XCTAssertTrue(result == "05 novembre 2019 16:56")
    }
    
    func testFetchCategoryName_WhenAddClassifiedAd_ThenReturnACategoryName() {
        //When
        let result = tool.fetchCategoryName(from: classifiedAd1, and: [cat1,cat2])
        //Then
        XCTAssertTrue(result == cat1.name)
    }
    
    func testFilterListOfAds_WhenAddClassifiedAdAndCategory_ThenReturnAListofAdsByCategory() {
        //When
        let result = tool.filterAdsByCategory(from: [classifiedAd1, classifiedAd2], and: cat2)
        //Then
        XCTAssertTrue((result[0].title != nil), "Radio réveil")
    }
}
