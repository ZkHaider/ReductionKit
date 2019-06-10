//
//  Reduction.ViewModelProvider.swift
//  ReductionKit
//
//  Created by Haider Khan on 6/9/19.
//  Copyright © 2019 zkhaider. All rights reserved.
//

import Foundation

open class ViewModelProvider<V: UIView, VM: Equatable, M: SubModule>: Component<M>, InternalViewModelComponent {
    
    public typealias ViewModel = VM
    
    private var _viewModel: ViewModel
    var viewModel: ViewModel {
        return _viewModel
    }
    
    required public init(viewModel: ViewModel) {
        self._viewModel = viewModel
    }
    
}
