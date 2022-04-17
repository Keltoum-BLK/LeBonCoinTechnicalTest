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
        image.image = UIImage(named: "emptyImage.jpeg")
        image.layer.borderColor = UIColor.gray.cgColor
        image.layer.borderWidth = 2
        image.contentMode = .scaleToFill
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 20
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var adTitle: UILabel = {
        let text = UILabel()
        text.textColor = .black
        text.font = UIFont.boldSystemFont(ofSize: 20)
        text.numberOfLines = 0
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    lazy var adPrice: UILabel = {
        let text = UILabel()
        text.textColor = .black
        text.font = UIFont.boldSystemFont(ofSize: 20)
        text.numberOfLines = 0
        text.adjustsFontSizeToFitWidth = true
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    lazy var adCategory: UILabel = {
        let text = UILabel()
        text.text = "Catégorie"
        text.textColor = .black
        text.font = UIFont.systemFont(ofSize: 15)
        text.numberOfLines = 0
        text.adjustsFontSizeToFitWidth = true
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    lazy var adUrgent: UILabel = {
        let text = UILabel()
        text.setMargins()
        text.text = "Urgent"
        text.textColor = .orange
        text.backgroundColor = .white
        text.layer.borderWidth = 1
        text.layer.borderColor = UIColor.orange.cgColor
        text.layer.cornerRadius = 5
        text.font = UIFont.boldSystemFont(ofSize: 15)
        text.textAlignment = .center
        text.layer.masksToBounds = true
        text.adjustsFontSizeToFitWidth = true
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    lazy var adDate: UILabel = {
        let text = UILabel()
        text.text = "12-12-12 12:00"
        text.textColor = .black
        text.font = UIFont.italicSystemFont(ofSize: 15)
        text.numberOfLines = 0
        text.clipsToBounds = true
        text.layer.masksToBounds = true
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
}
extension AdsListTableViewCell {
    
    func configureCell(from classifiedAd : ClassifiedAd, and categories: [Category]) {
        checkImage(from: classifiedAd)
        adTitle.text = classifiedAd.title
        adPrice.text = String(classifiedAd.price) + "€"
        isUrgent(ad: classifiedAd)
        adCategory.text = Tool.shared.fetchCategoryName(from: classifiedAd,and: categories)
        adDate.text = Tool.shared.convertDate(from: classifiedAd.creationDate)
    }
    
    private func isUrgent(ad: ClassifiedAd) {
        if ad.isUrgent {
            adUrgent.isHidden = false
        } else {
            adUrgent.isHidden = true
        }
    }
    
    func checkImage(from classifiedAd: ClassifiedAd) {
        if ((classifiedAd.imagesURL.thumb?.isEmpty) == nil) {
            adImage.image = UIImage(named: "emptyImage.jpeg")
        } else {
            adImage.cacheImage(urlString: classifiedAd.imagesURL.thumb ?? "no image")
        }
    }
}

extension AdsListTableViewCell {
    
    private func cellConstraints() {
        addSubview(adImage)
        addSubview(adUrgent)
        addSubview(adTitle)
        addSubview(adCategory)
        addSubview(adPrice)
        addSubview(adDate)
        backgroundColor = .white
        layer.cornerRadius = 20
        NSLayoutConstraint.activate([
            adImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            adImage.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            adImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            adImage.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.35),
            adUrgent.leadingAnchor.constraint(equalTo: adImage.leadingAnchor, constant: 10),
            adUrgent.bottomAnchor.constraint(equalTo: adImage.bottomAnchor, constant: -10),
            adUrgent.heightAnchor.constraint(equalTo: adImage.heightAnchor, multiplier: 0.15),
            adUrgent.widthAnchor.constraint(equalTo: adImage.widthAnchor, multiplier: 0.4),
            adTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            adTitle.leadingAnchor.constraint(equalTo: adImage.trailingAnchor, constant: 10),
            adTitle.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            adCategory.topAnchor.constraint(equalTo: adTitle.bottomAnchor, constant: 5),
            adCategory.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            adCategory.leadingAnchor.constraint(equalTo: adImage.trailingAnchor, constant: 10),
            adPrice.topAnchor.constraint(equalTo: adCategory.bottomAnchor, constant: 5),
            adPrice.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            adPrice.leadingAnchor.constraint(equalTo: adImage.trailingAnchor, constant: 10),
            adDate.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            adDate.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            adDate.leadingAnchor.constraint(equalTo: adImage.trailingAnchor, constant: 10)
        ])
    }
}
