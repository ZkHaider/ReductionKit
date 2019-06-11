//
//  Reduction.StateProvider.swift
//  ReductionKit
//
//  Created by Haider Khan on 6/9/19.
//  Copyright © 2019 zkhaider. All rights reserved.
//

import Foundation

open class StateProvider<V: Equatable, M: SubModule>: Component<M> {
    
    // MARK: - Attributes
    
    internal let reducers: [Reducer<V, Any>]
    
    // MARK: - Init
    
    public required init(_ reducers: [Reducer<V, Any>] = []) {
        self.reducers = reducers
        super.init()
    }
    
}
