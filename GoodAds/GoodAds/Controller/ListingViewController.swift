//
//  ViewController.swift
//  GoodAds
//
//  Created by Kel_Jellysh on 13/04/2022.
//

import UIKit

class ListingViewController: UIViewController {

    var adListing: [ClassifiedAd] = []
    
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        ListingService.shared.getListingData { [weak self] result in
            switch result {
            case .success(let adList):
                self?.adListing = adList
                dump(self?.adListing)
            case .failure(let error):
                print(error.description)
            }
        }
    }
}

