//
//  Reduction.State.Components.swift
//  ReductionKit
//
//  Created by Haider Khan on 6/9/19.
//  Copyright © 2019 zkhaider. All rights reserved.
//

import Foundation

public protocol StateComponents {
    static func stateProvider<V: Equatable>(initialValue: V) -> Self
}
