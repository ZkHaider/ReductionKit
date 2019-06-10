//
//  Abstract.Operator.swift
//  ReductionKit
//
//  Created by Haider Khan on 6/9/19.
//  Copyright © 2019 zkhaider. All rights reserved.
//

import Foundation

precedencegroup Multiplicative {
    associativity: left
}

infix operator <>: Multiplicative

func <><M: Magma>(lhs: M, rhs: M) -> M {
    return lhs.ops(other: rhs)
}
