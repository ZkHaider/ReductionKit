//
//  Reduction.MiddleWare.Builder.swift
//  ReductionKit
//
//  Created by Haider Khan on 6/9/19.
//  Copyright © 2019 zkhaider. All rights reserved.
//

import Foundation

public struct MiddleWareComponentsBuilder<M: SubModule> {
    let build: () -> (AnyComponent)
    private init(build: @escaping () -> (AnyComponent)) {
        self.build = build
    }
}

extension MiddleWareComponentsBuilder: MiddleWareComponents {
    
    public static func middleWare<S>(system: S) -> MiddleWareComponentsBuilder<M> {
        return MiddleWareComponentsBuilder { MiddleWare<S, M>(middleWare: system) }
    }
    
}
