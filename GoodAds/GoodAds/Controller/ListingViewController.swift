//
//  ViewController.swift
//  GoodAds
//
//  Created by Kel_Jellysh on 13/04/2022.
//

import UIKit

class ListingViewController: UIViewController {
    
    
    //MARK: Properties
    let listViewModel: ListViewModel
    let adsView = AdsView()
        lazy var adsTableView = adsView.adsTableView
    var categoriesList: [Category] = []
    var listOfAds: [ClassifiedAd] = [] {
        didSet {
            DispatchQueue.main.async {
                self.adsTableView.reloadData()
            }
        }
    }
    //MARK: Init
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
        adsView.adsTableView.dataSource = self
        adsView.adsTableView.delegate = self
        setNavigationBar(for: self)
        
        listViewModel.updateListOfCategories = { [weak self] categories in
            self?.categoriesList = categories
        }

        listViewModel.updateListOfAds = { [weak self] ads in
            self?.listOfAds = Tool.shared.sortedAds(listOfAds: ads)
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
extension ListingViewController: UITableViewDelegate, UITableViewDataSource {
 
    fileprivate func setNavigationBar(for rootViewController: UIViewController){
        if #available(iOS 15.0, *) {
            let navigationBarAppearance = UINavigationBarAppearance()
            UINavigationBar.appearance().standardAppearance = navigationBarAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return adsView.sizeWithTheDevice()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfAds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = adsView.adsTableView.dequeueReusableCell(withIdentifier: AdsListTableViewCell.identifier, for: indexPath) as! AdsListTableViewCell
        cell.configureCell(ad: listOfAds[indexPath.row], categories: categoriesList)
        return cell
    }
}



