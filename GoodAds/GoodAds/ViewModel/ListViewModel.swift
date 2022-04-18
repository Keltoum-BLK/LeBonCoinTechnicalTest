//
//  ListViewModel.swift
//  GoodAds
//
//  Created by Kel_Jellysh on 14/04/2022.
//

import Foundation

class ListViewModel: NSObject {
    //MARK: Properties
    var updateListOfAds: ((_ newAdsToDisplay: [ClassifiedAd]) -> Void)?
    var updateListOfCategories: ((_ newCategoriesToDisplay: [CategoryAd]) -> Void)?
    
    //MARK: Methods to Api Call 
    func fecthCategories() {
        CategoriesService.shared.getCategoriesData { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .success(let categories):
                    DispatchQueue.main.async {
                       self.updateListOfCategories?(categories)
                    }
                case .failure(let error):
                    print(error.description)
                }
            }
        }
    
    func fecthClassifiedAds() {
        ListingService.shared.getListingData { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let ads):
                DispatchQueue.main.async {
                    self.updateListOfAds?(ads)
                }
            case .failure(let error):
                print(error.description)
            }
        }
    }
}
