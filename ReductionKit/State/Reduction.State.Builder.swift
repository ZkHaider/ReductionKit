//
//  Reduction.State.Builder.swift
//  ReductionKit
//
//  Created by Haider Khan on 6/9/19.
//  Copyright © 2019 zkhaider. All rights reserved.
//

import Foundation

public struct StateComponentsBuilder<M: SubModule> {
    let build: () -> (AnyComponent)
    private init(build: @escaping () -> (AnyComponent)) {
        self.build = build
    }
}

extension StateComponentsBuilder: StateComponents {
    
    public static func stateProvider<V>(
        initialValue: V) -> StateComponentsBuilder<M>
        where V : Equatable {
            return StateComponentsBuilder<M>(build: {
                StateProvider<V, M>()
            })
    }
    
}
