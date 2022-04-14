//
//  Extension-ListViewController.swift
//  GoodAds
//
//  Created by Kel_Jellysh on 14/04/2022.
//

import Foundation
//
//extension ListingViewController: ListingActionsView {
//    func fecthCategories(listOfCategories: [Category]) {
//        self.categoriesList = listOfCategories
//        CategoriesService.shared.getCategoriesData { [weak self] result in
//                guard let self = self else { return }
//                switch result {
//                case .success(let categories):
//                    DispatchQueue.main.async {
//                        self.categoriesList = categories
//                        dump(self.categoriesList)
//                    }
//                case .failure(let error):
//                    print(error.description)
//                }
//            }
//        }
//    
//    func fecthClassifiedAds(listOfAds: [ClassifiedAd]) {
//        self.listOfAds = listOfAds
//        ListingService.shared.getListingData { [weak self] result in
//            guard let self = self else { return }
//            switch result {
//            case .success(let ads):
//                DispatchQueue.main.async {
//                    self.listOfAds = ads
//                    dump(self.listOfAds)
//                }
//            case .failure(let error):
//                print(error.description)
//            }
//        }
//    }
//}
