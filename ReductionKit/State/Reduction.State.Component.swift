//
//  Reduction.State.Component.swift
//  ReductionKit
//
//  Created by Haider Khan on 6/9/19.
//  Copyright © 2019 zkhaider. All rights reserved.
//

import Foundation

public protocol AnyStateProvider: AnyComponent {
    var anyState: Any { get }
}

internal protocol InternalStateProvider: AnyStateProvider {
    associatedtype State: Equatable
    var state: State { get }
}

extension InternalStateProvider {
    public var anyState: Any {
        return state 
    }
}
