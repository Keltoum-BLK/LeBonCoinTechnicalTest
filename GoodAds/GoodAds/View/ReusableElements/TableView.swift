//
//  AdsTableView.swift
//  GoodAds
//
//  Created by Kel_Jellysh on 14/04/2022.
//

import Foundation
import UIKit

class AdsTableView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureSubviews()
    }
    //MARK: UI Property
    lazy var recipesTabView: UITableView = {
       let tabView = UITableView()
        tabView.translatesAutoresizingMaskIntoConstraints = false
        tabView.backgroundColor = .white
        tabView.register(AdsListTableViewCell.self, forCellReuseIdentifier: AdsListTableViewCell.identifier)
        return tabView
    }()

    //MARK: Methods
   private func addTabViewConstraints() {
        recipesTabView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        recipesTabView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        recipesTabView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        recipesTabView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        recipesTabView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
    }

    private func configureSubviews() {
        addSubview(recipesTabView)
        backgroundColor = .clear
    }
}
