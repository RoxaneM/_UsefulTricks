//
//  NSObject+Extension.swift
//  _UsefulTricks
//
//  Created by Roksana Gud on 2/22/19.
//  Copyright © 2019 Roxane Markhyvka. All rights reserved.
//

import Foundation

extension NSObject {
    /// Convenient debug func
    public func delay(_ seconds: Double, block: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {

            block()
        }
    }
}
