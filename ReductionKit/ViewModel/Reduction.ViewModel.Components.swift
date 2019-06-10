//
//  Reduction.ViewModel.Components.swift
//  ReductionKit
//
//  Created by Haider Khan on 6/9/19.
//  Copyright © 2019 zkhaider. All rights reserved.
//

import Foundation

public protocol ViewModelComponents {
    static func viewDirector<S: Equatable, V: UIView>(initialState: S,
                                                      of type: V.Type) -> Self
}
