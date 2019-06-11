//
//  Reduction.Reducer.swift
//  ReductionKit
//
//  Created by Haider Khan on 6/10/19.
//  Copyright © 2019 zkhaider. All rights reserved.
//

import Foundation

public struct Reducer<S: Equatable, E> {
    public let reduce: (inout S, E) -> SideEffects?
}

extension Reducer: Monoid {
    
    public static var identity: Reducer<S, E> {
        return Reducer<S, E>(reduce: { _, _ in nil })
    }
    
    public func ops(other: Reducer<S, E>) -> Reducer<S, E> {
        return Reducer<S, E> { state, event in
            [self.reduce(&state, event),
             other.reduce(&state, event)].joined()
        }
    }
    
}
