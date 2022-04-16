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
    func sortedAds(listOfAds: [ClassifiedAd]) -> [ClassifiedAd] {
        let list = listOfAds
        let  sortedArray = list.sorted {$0.creationDate.compare($1.creationDate, options: .numeric) == .orderedDescending}
        let sortedUrgent = sortedUrgentAds(listOfAds: sortedArray)
        return sortedUrgent
    }
    
    func sortedUrgentAds(listOfAds: [ClassifiedAd]) -> [ClassifiedAd] {
        var noUrgent: [ClassifiedAd] = []
        var isUrgent: [ClassifiedAd] = []
        
          for ad in listOfAds {
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
    
    func convertToDateFormate(dateString: String) -> String {
//        let dateFormatter = DateFormatter()
//        let date = dateFormatter.date(from: dateString) ?? Date()
//        dateFormatter.dateFormat = "dd/MM/yyyy hh:mm"
//        var dateFor: NSDateFormatter = NSDateFormatter()
//            dateFor.dateFormat = "dd/MM/yyyy hh:mm"
//
//            var yourDate: NSDate? = dateFor.dateFromString(str)
//
//        let convertedDate: String = dateFormatter.string(from: date)
        return ""
    }
    
}

