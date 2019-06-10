//
//  Abstract.Monoid.Optional.swift
//  ReductionKit
//
//  Created by Haider Khan on 6/9/19.
//  Copyright © 2019 zkhaider. All rights reserved.
//

import Foundation

extension Optional: Monoid, Semigroup, Magma where Wrapped: Monoid {
    
    public static var identity: Optional<Wrapped> { return .none }
    
    public func ops(other: Optional<Wrapped>) -> Optional<Wrapped> {
        switch self {
        case .none:
            switch other {
            case .some: return other
            case .none: return .none
            }
        case .some(let lhsWrapped):
            switch other {
            case .some(let rhsWrapped): return .some([lhsWrapped, rhsWrapped].joined())
            case .none: return self
            }
        }
    }
    
}
