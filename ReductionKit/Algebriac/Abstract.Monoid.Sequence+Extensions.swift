//
//  Abstract.Monoid.Sequence+Extensions.swift
//  ReductionKit
//
//  Created by Haider Khan on 6/9/19.
//  Copyright © 2019 zkhaider. All rights reserved.
//

import Foundation

func concat<M: Monoid>(_ values: [M]) -> M {
    return values.reduce(M.identity, <>)
}

func concat<M: Monoid>(_ values: M...) -> M {
    return concat(values)
}

extension Sequence where Element: Monoid {
    public func joined() -> Element {
        return concat(Array(self))
    }
}
