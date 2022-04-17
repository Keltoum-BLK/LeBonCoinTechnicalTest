//
//  AdDetailsViewController.swift
//  GoodAds
//
//  Created by Kel_Jellysh on 13/04/2022.
//

import UIKit

class AdDetailsViewController: UIViewController {
    
    lazy var adDetailsView = AdDetailScrollView()
    private let classifiedAd: ClassifiedAd
    private let categories: [Category]
 
    
    
    init(from classifiedAd: ClassifiedAd, and categories: [Category]) {
        self.classifiedAd = classifiedAd
        self.categories = categories
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = adDetailsView
        adDetailsView.delegate = self
        setupDetailsInformations()
    }
    
    func setupDetailsInformations() {
        adDetailsView.checkImage(from: classifiedAd)
        adDetailsView.isUrgent(from: classifiedAd)
        adDetailsView.adTitle.text = classifiedAd.title
        adDetailsView.adPrice.text = "\(classifiedAd.price)€"
        adDetailsView.adDate.text = Tool.shared.convertDate(from: classifiedAd.creationDate)
        adDetailsView.adDesc.text = classifiedAd.description
        adDetailsView.checkSiretNumber(from: classifiedAd)
    }
}
extension AdDetailsViewController: AdActionsView {
    func dismissAdViewController() {
        dismiss(animated: true, completion: nil)
    }
}

