//
// MobileCatalogsViewController.swift
//  AxiomTelecomAssignment
//
//  Created by Waqas Sultan on 04/09/2020.
//  Copyright © 2020 Waqas Sultan. All rights reserved.
//

import UIKit

protocol MobileCatalogsViewControllerGetMobileCatalogs
{
    func fetchItems(searchString:String)
}

protocol MobileCatalogsViewControllerDisplayedLogic {
    func displayFetchMobileCatalogs(viewModel: DisplayViewModel)
}

class MobileCatalogsViewController: UIViewController,MobileCatalogsViewControllerDisplayedLogic {

    
    @IBOutlet weak var categoryCollectionView: CategoryCollectionView!
    @IBOutlet weak var catalogCollectionView: UICollectionView!
    
    

    let configurator = MobileCatalogsConfigurator()

    var requestMobileCatalogs: MobileCatalogsViewControllerGetMobileCatalogs!
    var router: MobileCatalogsAppRouter!
    var collectionViewDataSource:MobileCatalogsCollectionViewDataSource!
   
    let searchBar:UISearchBar = UISearchBar()
     var searchString = ""
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configurator.configure(viewController: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCellForCatalogCollectionView()
        configureCatalogCollectionViewDataSource()
       
        fetchMobileCatalogs()
        handleTableViewSelection()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        router.prepare(for: segue, sender: sender)
    }
    
    internal func registerCellForCatalogCollectionView() {
    
        self.catalogCollectionView.register(cellTypes: [MobileCatalogsCollectionViewCell.self])

    }
    
    internal func fetchMobileCatalogs() {
        self.view.startActivityIndicator()
        self.requestMobileCatalogs.fetchItems(searchString: searchString)
    }
    internal func configureCatalogCollectionViewDataSource(collectionViewDataSource: MobileCatalogsCollectionViewDataSource = MobileCatalogsCollectionViewDataSource()) {
        self.collectionViewDataSource  = collectionViewDataSource
        if let catalogCollectionView = catalogCollectionView {
            catalogCollectionView.delegate = collectionViewDataSource
            catalogCollectionView.dataSource = collectionViewDataSource
        }
    }
    
    
  
    
    func displayFetchMobileCatalogs(viewModel: DisplayViewModel) {
        self.collectionViewDataSource.mobileCatalogs = viewModel.mobileCatalogs
        self.categoryCollectionView.model = viewModel.mobileCategory
        DispatchQueue.main.async {
            self.catalogCollectionView.reloadData()
            self.categoryCollectionView.reloadData()
            self.view.stopActivityIndicator()
            
        }
    }
    
    func errorMobileCatalogs(error: String) {
        DispatchQueue.main.async {
            self.catalogCollectionView.reloadData()
            self.view.stopActivityIndicator()
            self.displayalert(title: "Error", message: error)
        }
    }
    
    
    
    
    
    
   
    
    
    
}


extension MobileCatalogsViewController : UISearchBarDelegate {
   
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchString = ""
        self.fetchMobileCatalogs()
        searchBar.resignFirstResponder()
        searchBar.endEditing(true)
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchString = searchText
        self.fetchMobileCatalogs()

    }
}

extension MobileCatalogsViewController: MobileCatalogsPresenterOutput , AlertView
{
    func successFetchedMobileCatalogs(viewModel: DisplayViewModel) {
        self.displayFetchMobileCatalogs(viewModel: viewModel)
    }
    
    func errorWhileFetchingMobileCatalogs(error: String) {
        self.errorMobileCatalogs(error: error)
    }
    
    
    
    func handleTableViewSelection() {
       
        
    }
}
