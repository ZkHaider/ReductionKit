//
//  Reduction.ViewModel.Components.swift
//  ReductionKit
//
//  Created by Haider Khan on 6/9/19.
//  Copyright © 2019 zkhaider. All rights reserved.
//

import Foundation

public protocol AnyViewModelComponent: AnyComponent {
    var anyViewModel: Any { get }
}

internal protocol InternalViewModelComponent: AnyViewModelComponent {
    associatedtype ViewModel: Equatable
    var viewModel: ViewModel { get }
}

extension InternalViewModelComponent {
    public var anyViewModel: Any {
        return viewModel
    }
}
