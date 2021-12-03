//
//  OptionalExtension.swift
//  _UsefulTricks
//
//  Created by Roksana Gud on 1/18/19.
//  Copyright © 2019 Roxane Markhyvka. All rights reserved.
//

public extension Optional {
    var isNil: Bool {
        return self == nil
    }
    
    var isSome: Bool {
        return self != nil
    }
    
    func doIfSome(action: (Wrapped) -> Void) -> Void {
        if let value = self {
            action(value)
        }
    }
}
