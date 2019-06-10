//
//  Reduction.Bindable.swift
//  ReductionKit
//
//  Created by Haider Khan on 6/9/19.
//  Copyright © 2019 zkhaider. All rights reserved.
//

import Foundation

internal protocol AnyBindable {
    var components: [AnyComponent] { get }
}
