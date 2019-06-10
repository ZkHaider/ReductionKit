//
//  Reduction.HasState.swift
//  ReductionKit
//
//  Created by Haider Khan on 6/9/19.
//  Copyright © 2019 zkhaider. All rights reserved.
//

import Foundation

public protocol HasState {
    associatedtype Module: SubModule
    var state: StateComponentsBuilder<Module> { get }
}
