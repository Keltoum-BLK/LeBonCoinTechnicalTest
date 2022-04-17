//
//  ScrollView .swift
//  GoodAds
//
//  Created by Kel_Jellysh on 14/04/2022.
//

import Foundation
import UIKit

class AdDetailScrollView : UIView {
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setScrollViewConstraints()
        setupImageButtonConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: Delegate
    weak var delegate: AdActionsView?
    
    //MARK: UI
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.alwaysBounceVertical = true
        scrollView.alwaysBounceHorizontal = false
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var adImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "emptyImage.jpeg")
        image.contentMode = .scaleToFill
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var adUrgent: UILabel = {
        let text = UILabel()
        text.setMargins()
        text.text = "Urgent"
        text.textColor = .orange
        text.backgroundColor = .white
        text.layer.borderWidth = 2
        text.layer.borderColor = UIColor.orange.cgColor
        text.layer.cornerRadius = 20
        text.font = UIFont.boldSystemFont(ofSize: 20)
        text.textAlignment = .center
        text.layer.masksToBounds = true
        text.adjustsFontSizeToFitWidth = true
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    lazy var closeControllerButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setImage(UIImage(named: "close.png"), for: .normal)
        button.layer.cornerRadius = 15
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(closeControllerButtonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    lazy var adTitle: UILabel = {
        let text = UILabel()
        text.textColor = .black
        text.font = UIFont.boldSystemFont(ofSize: 25)
        text.numberOfLines = 0
        text.textAlignment = .left
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
    
    lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.addArrangedSubview(adTitle)
        stack.addArrangedSubview(adPrice)
        stack.addArrangedSubview(adDate)
        stack.addArrangedSubview(descTitle)
        stack.addArrangedSubview(adDesc)
        stack.addArrangedSubview(siretStack)
        stack.alignment = .fill
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var descTitle: UILabel = {
        let text = UILabel()
        text.text = "Description"
        text.textColor = .black
        text.font = UIFont.boldSystemFont(ofSize: 20)
        text.numberOfLines = 0
        text.adjustsFontSizeToFitWidth = true
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    lazy var adDesc: UILabel = {
        let text = UILabel()
        text.text = "Desc"
        text.textColor = .black
        text.layer.cornerRadius = 20
        text.numberOfLines = 0
        text.font = UIFont.systemFont(ofSize: 20)
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    lazy var siretLabel: UILabel = {
        let text = UILabel()
        text.text = "SIRET"
        text.textColor = .black
        text.font = UIFont.boldSystemFont(ofSize: 20)
        text.numberOfLines = 0
        text.adjustsFontSizeToFitWidth = true
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    lazy var siretNumber: UILabel = {
        let text = UILabel()
        text.text = ""
        text.textColor = .black
        text.font = UIFont.systemFont(ofSize: 15)
        text.numberOfLines = 0
        text.adjustsFontSizeToFitWidth = true
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    lazy var siretStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.addArrangedSubview(siretLabel)
        stack.addArrangedSubview(siretNumber)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    
    @objc func closeControllerButtonAction() {
        delegate?.dismissAdViewController()
    }
    
    func isUrgent(from classifiedAd: ClassifiedAd) {
        if classifiedAd.isUrgent {
            adUrgent.isHidden = false
        } else {
            adUrgent.isHidden = true
        }
    }
    
    func checkImage(from classifiedAd: ClassifiedAd) {
        if classifiedAd.imagesURL.thumb?.isEmpty == nil {
            adImage.image = UIImage(named: "emptyImage.jpeg")
        } else {
            adImage.cacheImage(urlString: classifiedAd.imagesURL.thumb ?? "no image")
        }
    }
    
    func checkSiretNumber(from classifiedAd: ClassifiedAd) {
        if classifiedAd.siret != nil {
            siretStack.isHidden = false
            siretNumber.text = classifiedAd.siret 
        } else {
            siretStack.isHidden = true
        }
    }
}

//MARK: UIConstraints
extension AdDetailScrollView {
    private func setScrollViewConstraints() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        NSLayoutConstraint.activate([
            scrollView.centerXAnchor.constraint(equalTo: centerXAnchor), scrollView.centerXAnchor.constraint(equalTo: centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: widthAnchor),
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),

            
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }
    private func setupImageButtonConstraints() {
        contentView.addSubview(adImage)
        contentView.addSubview(adUrgent)
        contentView.addSubview(closeControllerButton)
        contentView.addSubview(stack)
   
        NSLayoutConstraint.activate([
            adImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            adImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            adImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            adImage.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.7)
        ])
        NSLayoutConstraint.activate([
            closeControllerButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            closeControllerButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            adUrgent.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            adUrgent.bottomAnchor.constraint(equalTo: contentView.topAnchor, constant: 70),
            adUrgent.heightAnchor.constraint(equalToConstant: 50),
            adUrgent.widthAnchor.constraint(equalToConstant: 100)
        ])
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: adImage.bottomAnchor, constant: 10),
            stack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            stack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            stack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        ])
        
    }
}


