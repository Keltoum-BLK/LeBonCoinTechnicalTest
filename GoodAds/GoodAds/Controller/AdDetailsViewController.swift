//
//  AdDetailsViewController.swift
//  GoodAds
//
//  Created by Kel_Jellysh on 13/04/2022.
//

import UIKit

class AdDetailsViewController: UIViewController {
    
    private let ad: ClassifiedAd
    var adDetails: ClassifiedAd?
    lazy var adDetailsView = AdDetailScrollView()
 
    
    init(ad: ClassifiedAd) {
        self.ad = ad
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = adDetailsView
        adDetailsView.delegate = self
        adDetailsView.adImage.downloaded(from: ad.imagesURL.thumb ?? "no image")
    }  
}
extension AdDetailsViewController: AdActionsView {
    func dismissAdViewController() {
        dismiss(animated: true, completion: nil)
    }
}

