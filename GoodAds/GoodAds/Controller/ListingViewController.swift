//
//  ViewController.swift
//  GoodAds
//
//  Created by Kel_Jellysh on 13/04/2022.
//

import UIKit

class ListingViewController: UIViewController {
    
    
    //MARK: Properties
    var categoriesList: [Category] = []
    var listOfAds: [ClassifiedAd] = []

    let listViewModel: ListViewModel
    let adsView = AdsView()

    //MARK: Inits

    init(viewModel: ListViewModel = ListViewModel()){
            self.listViewModel = viewModel
            super.init(nibName: nil, bundle: nil)
        }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: Cycle Life
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.title = "Good Ads"
        view = adsView
        setNavigationBar(for: self)
        listViewModel.updateListOfCategories = { [weak self] categories in
            self?.categoriesList = categories
        }

        listViewModel.updateListOfAds = { [weak self] ads in
            self?.listOfAds = ads
        }

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        listViewModel.fecthClassifiedAds()
        listViewModel.fecthCategories()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

    }
}
extension ListingViewController {
    
    fileprivate func setNavigationBar(for rootViewController: UIViewController){
        if #available(iOS 15.0, *) {
            let navigationBarAppearance = UINavigationBarAppearance()
            UINavigationBar.appearance().standardAppearance = navigationBarAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
        }
    }
}



