//
//  MobileCatalogsAppRouter.swift
//  AxiomTelecomAssignment
//
//  Created by Waqas Sultan on 04/09/2020.
//  Copyright © 2020 Waqas Sultan. All rights reserved.
//

import UIKit


protocol MobileCatalogsDataPassing {
    var datasource:MobileCatalogsDataSource! {get set}

}
protocol MobileCatalogsAppRouterView {
    func showDetailViewController(index:Int)
    func prepare(for segue: UIStoryboardSegue, sender: Any?)
}

class MobileCatalogsAppRouter: MobileCatalogsAppRouterView,MobileCatalogsDataPassing {
    
    var datasource: MobileCatalogsDataSource!
    var mobileCatalogsViewController:MobileCatalogsViewController? = nil
    var navigationController:UINavigationController? = nil
    var selectedIndex = 0
    
    func showDetailViewController(index:Int) {
        selectedIndex = index
        //TODO: in future if there is detail controller added.
    }
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showDetail") {
        //TODO: in future if there is detail controller added.
        }
    }
    

  
  
    
    
}

