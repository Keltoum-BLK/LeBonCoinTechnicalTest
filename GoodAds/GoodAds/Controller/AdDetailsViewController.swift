//
//  AdDetailsViewController.swift
//  GoodAds
//
//  Created by Kel_Jellysh on 13/04/2022.
//

import UIKit

class AdDetailsViewController: UIViewController {
    //MARK: Properties 
    lazy var adDetailsView = AdDetailScrollView()
    private let classifiedAd: ClassifiedAd
    private let categories: [CategoryAd]
 
    
    //MARK: Init Dependency
    init(from classifiedAd: ClassifiedAd, and categories: [CategoryAd]) {
        self.classifiedAd = classifiedAd
        self.categories = categories
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: Life circle
    override func viewDidLoad() {
        super.viewDidLoad()
        view = adDetailsView
        adDetailsView.delegate = self
        setupDetailsInformations()
    }
    //MARK: Method to assign classifiedAd values to UI
    func setupDetailsInformations() {
        adDetailsView.checkImage(from: classifiedAd)
        adDetailsView.isUrgent(from: classifiedAd)
        adDetailsView.adTitle.text = classifiedAd.title
        adDetailsView.adPrice.text = "\(classifiedAd.price ?? 1)€"
        adDetailsView.adDate.text = Tool.shared.convertDate(from: classifiedAd.creationDate ?? "no date")
        adDetailsView.adDesc.text = classifiedAd.description
        adDetailsView.checkSiretNumber(from: classifiedAd)
    }
}
//MARK: Delegate method to dismiss view controller 
extension AdDetailsViewController: AdActionsView {
    func dismissAdViewController() {
        dismiss(animated: true, completion: nil)
    }
}

