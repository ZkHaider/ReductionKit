//
//  Abstract.swift
//  ReductionKit
//
//  Created by Haider Khan on 6/9/19.
//  Copyright © 2019 zkhaider. All rights reserved.
//

import Foundation

/// Magma - Represents any closed binary operation
public protocol Magma {
    func ops(other: Self) -> Self
}

/// Semigroup - Represents any additive closed binary operation
public protocol Semigroup: Magma {}

/// Monoid - Represents any additive closed binary operation with an empty identity
public protocol Monoid: Semigroup {
    static var identity: Self { get }
}
