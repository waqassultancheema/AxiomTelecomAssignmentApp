//
//  StubNavigationViewController.swift
//  AxiomTelecomAssignmentTests
//
//  Created by Waqas Sultan on 9/13/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import UIKit

class StubNavigationViewController: UINavigationController {

    var isNavigationBarHiddenCalled = false
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    override func setNavigationBarHidden(_ hidden: Bool, animated: Bool) {
        isNavigationBarHiddenCalled = true
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
