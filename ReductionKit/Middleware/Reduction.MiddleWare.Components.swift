//
//  Reduction.MiddleWare.Components.swift
//  ReductionKit
//
//  Created by Haider Khan on 6/9/19.
//  Copyright © 2019 zkhaider. All rights reserved.
//

import Foundation

public protocol MiddleWareComponents {
    static func middleWare<S: Any>(system: S) -> Self
}
