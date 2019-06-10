//
//  Reduction.SubModule.Builder.swift
//  ReductionKit
//
//  Created by Haider Khan on 6/9/19.
//  Copyright © 2019 zkhaider. All rights reserved.
//

import Foundation

public struct SubModuleComponentsBuilder {
    let build: () -> ([AnyComponent])
}

extension SubModuleComponentsBuilder: SubModuleComponents {
    
    public static func module(_ components: ComponentBuilder...) -> SubModuleComponentsBuilder {
        return SubModuleComponentsBuilder {
            components.reduce(into: [], { $0 += $1.build() })
        }
    }
}
