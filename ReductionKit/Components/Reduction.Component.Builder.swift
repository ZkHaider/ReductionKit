//
//  Reduction.Component.Builder.swift
//  ReductionKit
//
//  Created by Haider Khan on 6/9/19.
//  Copyright © 2019 zkhaider. All rights reserved.
//

import Foundation

public struct ComponentBuilder {
    let buildModules: () -> ([SubModule]?)
    let build: () -> ([AnyComponent])
}

extension ComponentBuilder: Components {
    
//    public static func subModule<M>(
//        of type: M.Type) -> ComponentBuilder
//        where M : SubModule {
//        return ComponentBuilder(
//            buildModules: { [type.init()] },
//            build: { [] })
//    }
    
    public static func subModules<M>(
        _ subModules: M.Type...) -> ComponentBuilder
        where M : SubModule {
        return ComponentBuilder(
            buildModules: { subModules.compactMap({ $0.init() }) },
            build: { [] }
        )
    }
    
//    public static func state<M>(
//        _ stateComponents: StateComponentsBuilder<M>...) -> ComponentBuilder
//        where M : SubModule {
//        return ComponentBuilder(
//            buildModules: { nil },
//            build: { stateComponents.compactMap({ $0.build() }) })
//    }
    
    public static func state<S>(
        initialState: S,
        _ reducers: Reducer<S, Any>...) -> ComponentBuilder
        where S : Equatable {
        return ComponentBuilder(
            buildModules: { nil },
            build: {
                return [
                    StateComponentsBuilder
                        .stateProvider(
                            initialState: initialState,
                            reducers
                        ).build()
                ]
            }
        )
    }
    
    public static func middleWare<M>(
        _ middleWareComponents: MiddleWareComponentsBuilder<M>...) -> ComponentBuilder {
        return ComponentBuilder(
            buildModules: { nil },
            build: { middleWareComponents.compactMap({ $0.build() }) }
        )
    }
    
    public static func viewModel<M>(
        _ viewModelComponents: ViewModelComponentsBuilder<M>...) -> ComponentBuilder
        where M : SubModule {
        return ComponentBuilder(
            buildModules: { nil },
            build: { viewModelComponents.compactMap({ $0.build() }) }
        )
    }
    
    public static func views<M>(_ viewComponents: ViewComponentBuilder<M>...) -> ComponentBuilder where M : SubModule {
        return ComponentBuilder(
            buildModules: { nil },
            build: { viewComponents.compactMap({ $0.build() }) }
        )
    }
    
}
