//
//  ViewController.swift
//  GoodAds
//
//  Created by Kel_Jellysh on 13/04/2022.
//

import UIKit

class ListingViewController: UIViewController {
    
    internal var categoriesList: [Category] = []
    internal var listOfAds: [ClassifiedAd] = [] 
    
    let listViewModel = ListViewModel()
    
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        listViewModel.updateListOfCategories = { [weak self] categories in
            self?.categoriesList = categories
        }
        
        listViewModel.updateListOfAds = { [weak self] ads in
            self?.listOfAds = ads
            dump(self?.listOfAds)
        }
     
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        listViewModel.fecthClassifiedAds()
        listViewModel.fecthCategories()
    }
}



