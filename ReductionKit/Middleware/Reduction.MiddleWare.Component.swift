//
//  Reduction.Middleware.Component.swift
//  ReductionKit
//
//  Created by Haider Khan on 6/9/19.
//  Copyright © 2019 zkhaider. All rights reserved.
//

import Foundation

public protocol AnyMiddleWare: AnyComponent {
    var anyMiddleWare: Any { get }
}

public protocol InternalMiddleWare: AnyMiddleWare {
    associatedtype MiddleWareSystem: Any
    var middleWare: MiddleWareSystem { get }
}

extension InternalMiddleWare {
    public var anyMiddleWare: Any {
        return middleWare
    }
}
