//
//  AdsView.swift
//  GoodAds
//
//  Created by Kel_Jellysh on 14/04/2022.
//

import Foundation
import UIKit

class AdsView: UIView {
    //MARK: Init 
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviews()
        addConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureSubviews()
    }
    
    //MARK: Delegate
    weak var delegate: ClassifiedAdsListAction?
    //MARK: UI Property
    lazy var viewTitle: UILabel = {
        let text = UILabel()
        text.text = "Leboncoin"
        text.textColor = .orange
        text.font = UIFont(name: "futura-Bold", size: 20)
        text.numberOfLines = 2
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    lazy var adsTableView: UITableView = {
       let tabView = UITableView()
        tabView.translatesAutoresizingMaskIntoConstraints = false
        tabView.backgroundColor = .clear
        tabView.separatorStyle = .none
        tabView.register(AdsListTableViewCell.self, forCellReuseIdentifier: AdsListTableViewCell.identifier)
        return tabView
    }()
    
    lazy var categoryBTN: UIButton = {
        let btn = UIButton(type: .custom)
        btn.backgroundColor = UIColor.white
        btn.layer.cornerRadius = 20
        btn.layer.borderColor = UIColor.orange.cgColor
        btn.layer.borderWidth = 2
        btn.setTitle("Catégories", for: .normal)
        btn.titleEdgeInsets = UIEdgeInsets(top: 5,left: 5,bottom: 5,right: 5)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        btn.setTitleColor(.orange, for: .normal)
        btn.setTitleColor(.gray, for: .selected)
        btn.addTarget(self, action: #selector(setupCategoriesButton), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    @objc func setupCategoriesButton() {
        delegate?.setPopupButton()
    }

}
extension AdsView {
    
    //MARK: Methods
   private func addConstraints() {
       translatesAutoresizingMaskIntoConstraints = false
       NSLayoutConstraint.activate([
        viewTitle.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
        viewTitle.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
        adsTableView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
        adsTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 150),
        adsTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0),
        adsTableView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
        categoryBTN.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
        categoryBTN.bottomAnchor.constraint(equalTo: adsTableView.topAnchor, constant: -10),
        categoryBTN.widthAnchor.constraint(equalToConstant: 200)
       ])
       
    }

    private func configureSubviews() {
        addSubview(viewTitle)
        addSubview(adsTableView)
        addSubview(categoryBTN)
        backgroundColor = .white
    }
    
    func sizeWithTheDevice() -> CGFloat {
        switch UIDevice.current.userInterfaceIdiom {
        case .phone:
            return 200
        case .pad:
            return 300
        case .unspecified:
            return 200
        default:
            break
        }
        return 200
    }
    @available(iOS 15.0, *)
    func setPopupButton(from listOfAds1: [ClassifiedAd], and listOfAds2: [ClassifiedAd], listOfCategories: [CategoryAd]) {
        var listA = listOfAds1
        var listB = listOfAds2
        listB = listA
        var actions = [UIMenuElement]()
        let firstAction = UIAction(title: "Catégories", state: .on ,handler: { (_) in
            listA = listB})
        actions.append(firstAction)
        for i in listOfCategories {
            let uiAction = UIAction(title: listOfCategories[i.id - 1].name,handler: { (_) in
                listA = Tool.shared.filterAdsByCategory(from: listB, and: listOfCategories[i.id - 1])})
            actions.append(uiAction)
        }
        categoryBTN.menu = UIMenu(children: actions)
        categoryBTN.showsMenuAsPrimaryAction = true
        categoryBTN.changesSelectionAsPrimaryAction = true
    }
}

