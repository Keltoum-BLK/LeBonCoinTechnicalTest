//
//  Tool.swift
//  GoodAds
//
//  Created by Kel_Jellysh on 14/04/2022.
//

import Foundation

class Tool {
    
    //MARK: Singleton
    static let shared = Tool()
    //MARK: SORTED METHODS
    //Sorted array first with the date and after with is_Urgent Bool
    func sortedAds(from listOfAds: [ClassifiedAd]) -> [ClassifiedAd] {
        let list = listOfAds
        let  sortedArray = list.sorted {$0.creationDate.compare($1.creationDate, options: .numeric) == .orderedDescending}
        let sortedUrgent = sortedUrgentAds(from: sortedArray)
        return sortedUrgent
    }
    
    func sortedUrgentAds(from classfiedAdList: [ClassifiedAd]) -> [ClassifiedAd] {
        var noUrgent: [ClassifiedAd] = []
        var isUrgent: [ClassifiedAd] = []
        
        for ad in classfiedAdList {
            if ad.isUrgent {
                isUrgent.append(ad)
            } else {
                noUrgent.append(ad)
            }
        }
        var output:[ClassifiedAd] = []
        output.append(contentsOf: isUrgent)
        output.append(contentsOf: noUrgent)
        return output
    }
    
    func convertDate(from dateStr: String) -> String {
        let inputDate = dateStr
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from: inputDate) ?? Date()
        dateFormatter.dateFormat = "dd MMMM yyyy HH:mm"
        return dateFormatter.string(from: date)
    }
    
    func fetchCategoryName(from classifiedAd: ClassifiedAd, and categoriesList: [Category]) -> String  {
        if let index = categoriesList.firstIndex(where: {
            $0.id == classifiedAd.categoryID
        }) {
            return categoriesList[index].name
        }
        return ""
    }
}

