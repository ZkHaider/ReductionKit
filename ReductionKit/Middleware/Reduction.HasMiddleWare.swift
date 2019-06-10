//
//  Reduction.HasMiddleWare.swift
//  ReductionKit
//
//  Created by Haider Khan on 6/9/19.
//  Copyright © 2019 zkhaider. All rights reserved.
//

import Foundation

public protocol HasMiddleWare {
    associatedtype Module: SubModule
    var middleWare: MiddleWareComponentsBuilder<Module> { get }
}
