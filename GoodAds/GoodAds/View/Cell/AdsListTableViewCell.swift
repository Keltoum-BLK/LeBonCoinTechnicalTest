//
//  AdsListTableViewCell.swift
//  GoodAds
//
//  Created by Kel_Jellysh on 14/04/2022.
//

import Foundation
import UIKit

class AdsListTableViewCell: UITableViewCell {
    
    static let identifier = "cell"
    //MARK: Inits
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: LayoutSubviews
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    //MARK: - Subviews
    lazy var adImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var adTitle: UILabel = {
        let text = UILabel()
        text.textColor = .black
        text.font = UIFont(name: "futura", size: 20)
        text.numberOfLines = 0
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    lazy var adPrice: UILabel = {
        let text = UILabel()
        text.textColor = .black
        text.font = UIFont(name: "futura", size: 15)
        text.numberOfLines = 0
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    lazy var adCategory: UILabel = {
        let text = UILabel()
        text.textColor = .black
        text.font = UIFont(name: "futura", size: 15)
        text.numberOfLines = 0
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    lazy var adUrgent: UILabel = {
        let text = UILabel()
        text.text = "Urgent"
        text.textColor = .orange
        text.backgroundColor = .white
        text.layer.borderWidth = 1
        text.layer.borderColor = UIColor.orange.cgColor
        text.layer.cornerRadius = 5
        text.font = UIFont(name: "futura", size: 15)
        text.numberOfLines = 0
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
}
extension AdsListTableViewCell {
    
    func configureCell(ad: ClassifiedAd, categories: [Category]) {
        adImage.downloaded(from: ad.imagesURL.small ?? "no image")
        adTitle.text = ad.title
        adPrice.text = "\(adPrice)€"
        isUrgent(ad: ad)
        adCategory.text = wichCategory(ad: ad, categories: categories)
    }
    
    private func isUrgent(ad: ClassifiedAd) {
        if ad.isUrgent {
            adUrgent.isHidden = false
        } else {
            adUrgent.isHidden = true
        }
    }
    
    private func wichCategory(ad: ClassifiedAd, categories: [Category]) -> String {
            let category = categories[ad.categoryID].name
            return category
        }
}
