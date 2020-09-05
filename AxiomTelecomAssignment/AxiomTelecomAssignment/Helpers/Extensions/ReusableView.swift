//
//  ReusableView.swift
//  AxiomTelecomAssignment
//
//  Created by Waqas Sultan on 05/09/2020.
//  Copyright © 2020 Waqas Sultan. All rights reserved.
//

import UIKit

public protocol ReusableView {
}

public extension ReusableView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
