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
        cellConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: LayoutSubviews
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
    
    //MARK: - Subviews
    lazy var adImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.sizeToFit()
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 20
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
        let text = PaddingLabel(withInsets: 5, 5, 5, 5)
        text.text = "Urgent"
        text.textColor = .orange
        text.backgroundColor = .white
        text.layer.borderWidth = 1
        text.layer.borderColor = UIColor.orange.cgColor
        text.layer.cornerRadius = 5
        text.font = UIFont(name: "futura", size: 20)
        text.textAlignment = .left
        text.layer.masksToBounds = true
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    lazy var labelsHStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        let subviews = [adTitle, adCategory,adPrice]
        for view in subviews {
            addSubview(view)
        }
        return stack
    }()
}
extension AdsListTableViewCell {
    
    func configureCell(ad: ClassifiedAd, categories: [Category]) {
        adImage.downloaded(from: ad.imagesURL.thumb ?? "no image")
        adTitle.text = ad.title
        adPrice.text = "\(adPrice)€"
        isUrgent(ad: ad)
//        adCategory.text = wichCategory(ad: ad, categories: categories)
    }
    
    private func isUrgent(ad: ClassifiedAd) {
        if ad.isUrgent {
            adUrgent.isHidden = false
        } else {
            adUrgent.isHidden = true
        }
    }
    
    private func wichCategory(ad: ClassifiedAd, categories: [Category]) -> String {
        let category = categories[ad.categoryID - 1].name
            return category
    }
    
    private func cellConstraints() {
        addSubview(adImage)
        addSubview(adUrgent)
        backgroundColor = .blue
        layer.cornerRadius = 20
        NSLayoutConstraint.activate([
            adImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            adImage.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            adImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            adImage.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.35),
            adUrgent.leadingAnchor.constraint(equalTo: adImage.leadingAnchor, constant: 10),
            adUrgent.bottomAnchor.constraint(equalTo: adImage.bottomAnchor, constant: -10),
            adUrgent.heightAnchor.constraint(equalTo: adImage.heightAnchor, multiplier: 0.10)
        ])
    }
}
