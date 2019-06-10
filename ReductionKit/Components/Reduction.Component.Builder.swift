//
//  Reduction.Component.Builder.swift
//  ReductionKit
//
//  Created by Haider Khan on 6/9/19.
//  Copyright © 2019 zkhaider. All rights reserved.
//

import Foundation

public struct ComponentBuilder {
    let build: () -> ([AnyComponent])
}

extension ComponentBuilder: Components {
    
    public static func state<M>(
        _ stateComponents: StateComponentsBuilder<M>...) -> ComponentBuilder
        where M : SubModule {
            return ComponentBuilder {
            stateComponents.compactMap({ $0.build() })
        }
    }
    
    public static func middleWare<M>(
        _ middleWareComponents: MiddleWareComponentsBuilder<M>...) -> ComponentBuilder {
        return ComponentBuilder {
            middleWareComponents.compactMap({ $0.build() })
        }
    }
    
    public static func viewModel<M>(
        _ viewModelComponents: ViewModelComponentsBuilder<M>...) -> ComponentBuilder
        where M : SubModule {
        return ComponentBuilder {
            viewModelComponents.compactMap({ $0.build() })
        }
    }
    
    public static func view<M>(_ viewComponents: ViewComponentBuilder<M>...) -> ComponentBuilder where M : SubModule {
        return ComponentBuilder {
            viewComponents.compactMap({ $0.build() })
        }
    }
    
}
