//
//  MobileCatalogsPresenter.swift
//  AxiomTelecomAssignment
//
//  Created by Waqas Sultan on 04/09/2020.
//  Copyright © 2020 Waqas Sultan. All rights reserved.
//


import UIKit
protocol MobileCatalogsPresenterInput
{
    func presentFetchMobileCatalogs(mobileCatalogs:MobileCatalogs)
    func presentFetchedError(error:String)
}

protocol MobileCatalogsPresenterOutput: class
{
    func successFetchedMobileCatalogs(viewModel: DisplayViewModel)
    func errorWhileFetchingMobileCatalogs(error:String)
}
class MobileCatalogsPresenter:MobileCatalogsPresenterInput {
 
    var output:MobileCatalogsPresenterOutput!
    
    func presentFetchMobileCatalogs(mobileCatalogs:MobileCatalogs) {
        if let output  = output {
            let usersDisplayModel =  convertDataIntoViewModel(mobileCatalogs: mobileCatalogs)
            
            let viewModel = DisplayViewModel.init(mobileCatalogs: usersDisplayModel, mobileCategory: getCategories(mobileCatalogs: mobileCatalogs))
            
            output.successFetchedMobileCatalogs(viewModel:viewModel)
        }
       

    }
    
    func presentFetchedError(error: String) {
         output.errorWhileFetchingMobileCatalogs(error: error)
    }
    
    
    func convertDataIntoViewModel(mobileCatalogs: MobileCatalogs) ->  [DisplayViewModel.MobileCatalogViewModel] {

        var displayViewModels:[DisplayViewModel.MobileCatalogViewModel] = []
        
        for item in mobileCatalogs {
            let viewModel: DisplayViewModel.MobileCatalogViewModel = DisplayViewModel.MobileCatalogViewModel(picture: item.picture ?? "", brand: item.brand ?? "", price: "\(item.priceEur ?? 0)")
            displayViewModels.append(viewModel)
        }
        
        return displayViewModels
    }
    
    func getCategories(mobileCatalogs: MobileCatalogs) ->  [String] {

        let displayViewModels:[String]  = mobileCatalogs.map { ($0.brand ?? "") }
        return displayViewModels.unique()
    }
}


