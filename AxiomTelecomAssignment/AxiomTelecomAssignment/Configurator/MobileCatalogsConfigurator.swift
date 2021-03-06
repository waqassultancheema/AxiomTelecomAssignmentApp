//
//  MobileCatalogsConfigurator.swift
//  AxiomTelecomAssignment
//
//  Created by Waqas Sultan on 04/09/2020.
//  Copyright © 2020 Waqas Sultan. All rights reserved.
//

import UIKit










extension MobileCatalogsInteractor: MobileCatalogsViewControllerGetMobileCatalogs
{
    func fetchItems(searchString: String, selectedCategory: String) {
        self.fetchMobileCatalogs(searchString: searchString, selectedCategory: selectedCategory)

    }
    
   
    
   


}

extension MobileCatalogsPresenter: MobileCatalogsInteractorOutput
{
    func passedToPresenterFetchedMobileCatalogs(mobileCatalogs: MobileCatalogs, categories: [String]) {
        self.presentFetchMobileCatalogs(mobileCatalogs: mobileCatalogs, categories: categories)

    }
    
    
    func errorWhileFetchMobileCatalogs(error: String) {
        self.presentFetchedError(error: error)
    }
    
   
}

class MobileCatalogsConfigurator: NSObject {

    let presenter = MobileCatalogsPresenter()
    let interactor = MobileCatalogsInteractor()


    // MARK: - Configuration

    func configure(viewController: MobileCatalogsViewController)
    {
        presenter.output = viewController
        

        interactor.output = presenter
        viewController.requestMobileCatalogs = interactor
    }
}
