//
//  SideEffects.swift
//  ReductionKit
//
//  Created by Haider Khan on 6/10/19.
//  Copyright © 2019 zkhaider. All rights reserved.
//

import Foundation

public struct SideEffects: Monoid {
    
    public static var identity: SideEffects { return SideEffects() }
    
    public func ops(other: SideEffects) -> SideEffects {
        return SideEffects()
    }
    
}
