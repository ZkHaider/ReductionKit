//
//  SubModule.Config.swift
//  ReductionKit
//
//  Created by Haider Khan on 6/9/19.
//  Copyright © 2019 zkhaider. All rights reserved.
//

import Foundation

public struct ModuleConfig<A> {
    let configure: (A) -> ()
}

extension ModuleConfig: Monoid, Semigroup, Magma where A: SubModule {
    
    public static var identity: ModuleConfig<A> {
        return ModuleConfig { _ in }
    }
    
    public func ops(other: ModuleConfig<A>) -> ModuleConfig<A> {
        return ModuleConfig<A> { subModule in
            self.configure(subModule)
            other.configure(subModule)
        }
    }
    
}

extension ModuleConfig where A: SubModule {
    public static var initializer: ModuleConfig<A> {
        return ModuleConfig<A> { subModule in
            
            // Use reflection to get access to properties
            let mirror = Mirror(reflecting: subModule)
            
            // Get tuples of (AnyComponent, Component<A>?) this way we can
            // differentiate between internal bind and just bind
            let components: [(AnyComponent, Component<A>?)] = mirror
                .children
                .compactMap({ child -> (AnyComponent, Component<A>?)? in
                    guard
                        let internalComponent = child.value as? Component<A>
                        else {
                            guard
                                let anyComponent = child.value as? AnyComponent
                                else { return nil }
                            return (anyComponent, nil)
                    }
                    return (internalComponent, internalComponent)
                })
            
            // Bind
            for (anyComponent, internalComponent) in components {
                guard
                    let internalComponent = internalComponent
                    else {
                        anyComponent.bind(any: subModule)
                        continue
                }
                internalComponent._bind(module: subModule)
            }
        }
    }
}
