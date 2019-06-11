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
            
            // Get components
            let anyComponents: [AnyComponent] = subModule.components
            let internalComponents: [Component] = subModule.internalComponents
            let viewComponents: [AnyViewComponent] = subModule.viewComponents
            let weakViewComponents: [AnyWeakViewComponent] = subModule.weakViewComponents
            
            // Bind
            anyComponents.forEach({ $0.bind(any: subModule) })
            internalComponents.forEach({ $0._bind(module: subModule) })
            viewComponents.forEach({ $0.bind(any: subModule) })
            weakViewComponents.forEach({ $0.bind(any: subModule) })
        }
    }
}
