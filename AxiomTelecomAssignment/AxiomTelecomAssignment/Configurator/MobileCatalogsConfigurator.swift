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
    func fetchItems(searchString: String) {
        self.fetchMobileCatalogs(searchString: searchString)

    }
    
   
    
   


}

extension MobileCatalogsPresenter: MobileCatalogsInteractorOutput
{
    func passedToPresenterFetchedMobileCatalogs(mobileCatalogs: MobileCatalogs) {
        self.presentFetchMobileCatalogs(mobileCatalogs: mobileCatalogs)

    }
    
    
    func errorWhileFetchMobileCatalogs(error: String) {
        self.presentFetchedError(error: error)
    }
    
   
}

class MobileCatalogsConfigurator: NSObject {

    let presenter = MobileCatalogsPresenter()
    let interactor = MobileCatalogsInteractor()
    let router = MobileCatalogsAppRouter()


    // MARK: - Configuration

    func configure(viewController: MobileCatalogsViewController)
    {
        router.MobileCatalogsViewController = viewController
        presenter.output = viewController
        

        interactor.output = presenter
        router.datasource = interactor
        viewController.requestMobileCatalogs = interactor
        viewController.router = router
    }
}
