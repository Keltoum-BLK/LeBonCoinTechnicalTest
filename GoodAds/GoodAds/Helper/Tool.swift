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
    func sortedAds(from listOfAds: [ClassifiedAd?]) -> [ClassifiedAd] {
        let list = listOfAds
        let  sortedArray = list.sorted {$0?.creationDate?.compare($1?.creationDate ?? "no date", options: .numeric) == .orderedDescending}
        let sortedUrgent = sortedUrgentAds(from: sortedArray)
        return sortedUrgent
    }
    //MARK: Methods
    //sort array of classifiedAds by urgent value
    func sortedUrgentAds(from classfiedAdList: [ClassifiedAd?]) -> [ClassifiedAd] {
        var noUrgent: [ClassifiedAd] = []
        var isUrgent: [ClassifiedAd] = []
        
        for ad in classfiedAdList {
            guard let classifiedAd = ad else { return []}
            if classifiedAd.isUrgent ?? true {
                isUrgent.append(classifiedAd)
            } else {
                noUrgent.append(classifiedAd)
            }
        }
        var output:[ClassifiedAd] = []
        output.append(contentsOf: isUrgent)
        output.append(contentsOf: noUrgent)
        return output
    }
    //convert ISO8601 string to another date format string
    func convertDate(from dateStr: String) -> String {
        let inputDate = dateStr
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from: inputDate) ?? Date()
        dateFormatter.dateFormat = "dd MMMM yyyy HH:mm"
        return dateFormatter.string(from: date)
    }
    //fetch category name for UIMenu button 
    func fetchCategoryName(from classifiedAd: ClassifiedAd, and categoriesList: [CategoryAd]) -> String  {
        if let index = categoriesList.firstIndex(where: {
            $0.id == classifiedAd.categoryID
        }) {
            return categoriesList[index].name
        }
        return ""
    }
    //Filter classified ads array by category value
    func filterAdsByCategory(from list: [ClassifiedAd], and category: CategoryAd)-> [ClassifiedAd] {
        var listByCategory = list
        listByCategory = list.filter({ $0.categoryID == category.id })
        return listByCategory
    }
}

