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
    var categoriesList: [CategoryAd] = []
    //All data in this array
    var listOfAds: [ClassifiedAd] = [] {
        didSet {
            DispatchQueue.main.async {
                self.adsTableView.reloadData()
            }
        }
    }
    //List help to filter data by category
    var categoryAds: [ClassifiedAd] = [] {
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
        adsView.delegate = self
        adsView.adsTableView.dataSource = self
        adsView.adsTableView.delegate = self
        DispatchQueue.main.async {
            self.listViewModel.updateListOfCategories = { [weak self] categories in
                self?.categoriesList = categories
            }
            self.listViewModel.updateListOfAds = { [weak self] ads in
                self?.listOfAds = Tool.shared.sortedAds(from: ads)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        listViewModel.fecthClassifiedAds()
        listViewModel.fecthCategories()
    }
    
}
extension ListingViewController: UITableViewDelegate, UITableViewDataSource {
    
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
        cell.selectionStyle = .none
        cell.configureCell(from: self.listOfAds[indexPath.row], and: self.categoriesList)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let adDetailsView = AdDetailsViewController(from: listOfAds[indexPath.row], and: categoriesList)
        adDetailsView.modalPresentationStyle = .pageSheet
        present(adDetailsView, animated: true, completion: nil)
    }
}
//MARK: Method to create UIMenu with UIButton
@available(iOS 15.0, *)
extension ListingViewController: ClassifiedAdsListAction {
    func setPopupButton() {
      categoryAds = listOfAds
        var actions = [UIMenuElement]()
        let firstAction = UIAction(title: "Catégories", state: .on ,handler: { (_) in
            self.listOfAds = self.categoryAds})
        actions.append(firstAction)
        for i in categoriesList {
            let uiAction = UIAction(title: categoriesList[i.id - 1].name,handler: { (_) in
                self.listOfAds = Tool.shared.filterAdsByCategory(from: self.categoryAds, and: self.categoriesList[i.id - 1])})
            actions.append(uiAction)
        }
        adsView.categoryBTN.menu = UIMenu(children: actions)
        adsView.categoryBTN.showsMenuAsPrimaryAction = true
        adsView.categoryBTN.changesSelectionAsPrimaryAction = true
    }
}



