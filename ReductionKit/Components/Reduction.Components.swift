//
//  Reduction.Component.Wrapper.swift
//  ReductionKit
//
//  Created by Haider Khan on 6/9/19.
//  Copyright © 2019 zkhaider. All rights reserved.
//

import Foundation

public protocol Components {
    static func state<M: SubModule>(_ stateComponents: StateComponentsBuilder<M>...) -> Self
    static func middleWare<M: SubModule>(_ middleWareComponents: MiddleWareComponentsBuilder<M>...) -> Self
    static func viewModel<M: SubModule>(_ viewModelComponents: ViewModelComponentsBuilder<M>...) -> Self
    static func view<M: SubModule>(_ viewComponents: ViewComponentBuilder<M>...) -> Self
}
