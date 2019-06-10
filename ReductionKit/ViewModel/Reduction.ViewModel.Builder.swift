//
//  Reduction.ViewModel.Builder.swift
//  ReductionKit
//
//  Created by Haider Khan on 6/9/19.
//  Copyright © 2019 zkhaider. All rights reserved.
//

import Foundation

public struct ViewModelComponentsBuilder<M: SubModule> {
    let build: () -> (AnyComponent)
    private init(build: @escaping () -> (AnyComponent)) {
        self.build = build
    }
}

extension ViewModelComponentsBuilder: ViewModelComponents {
    
    public static func viewDirector<S, V>(
        initialState: S,
        of type: V.Type) -> ViewModelComponentsBuilder<M>
        where S : Equatable, V : UIView {
        return ViewModelComponentsBuilder<M> {
            ViewModelProvider<V, S, M>(viewModel: initialState)
        }
    }
    
}
