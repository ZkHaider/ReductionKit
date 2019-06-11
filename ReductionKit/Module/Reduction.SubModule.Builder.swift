//
//  Reduction.SubModule.Builder.swift
//  ReductionKit
//
//  Created by Haider Khan on 6/9/19.
//  Copyright © 2019 zkhaider. All rights reserved.
//

import Foundation

public struct SubModuleComponentsBuilder {
    let buildSubModules: () -> ([SubModule])
    let buildComponents: () -> ([AnyComponent])
}

extension SubModuleComponentsBuilder: SubModuleComponents {
    
    public static func module(_ components: ComponentBuilder...) -> SubModuleComponentsBuilder {
        return SubModuleComponentsBuilder(
            buildSubModules: { components
                .compactMap({ $0.buildModules() })
                .reduce(into: [], { $0 += $1 }) },
            buildComponents: { components.reduce(into: [], { $0 += $1.build() }) }
        )
    }
}
