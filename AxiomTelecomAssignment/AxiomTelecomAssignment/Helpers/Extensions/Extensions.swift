//
//  Extensions.swift
//  AxiomTelecomAssignment
//
//  Created by Waqas Sultan on 9/14/19.
//  Copyright © 2020 Waqas Sultan. All rights reserved.
//

import UIKit

protocol AlertView   {
    func displayalert(title:String, message:String)
}

extension AlertView where Self: MobileCatalogsViewController {
    
    func displayalert(title:String, message:String) {
        let alert = UIAlertController(title: title, message: "\(message) \n\nPlease Press Retry", preferredStyle: UIAlertController.Style.alert)
        alert.addAction((UIAlertAction(title: "Retry", style: .default, handler: { [unowned self] (action) -> Void in
            self.fetchMobileCatalogs()
            alert.dismiss(animated: true, completion: nil)
            
        })))
        self.present(alert, animated: true, completion: nil)
        
        
    }
    
   
    
    
}


extension UIView {
    
    
    func startActivityIndicator() {
        ActivityIndicator.sharedInstance.showProgressView(view: self)
    }
    
    func stopActivityIndicator() {
        ActivityIndicator.sharedInstance.hideProgressView()
    }
    
    
}

extension UIColor {
    
    class func color(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
        return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
    }
}

