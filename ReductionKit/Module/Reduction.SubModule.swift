//
//  SubModule.swift
//  ReductionKit
//
//  Created by Haider Khan on 6/9/19.
//  Copyright © 2019 zkhaider. All rights reserved.
//

import Foundation

public typealias Reduxable = HasState & HasMiddleWare
public typealias ViewReduxable = HasViewModel
public typealias ModuleDescription = SubModuleComponentsBuilder

open class SubModule: HasSubModule {
    
    public typealias Module = Self
    
    open var moduleDescription: ModuleDescription {
        return .module()
    }
    
    public private(set) var moduleConfiguration: ModuleConfig<SubModule>? = nil
    
    public required init(
        with config: ModuleConfig<SubModule>? = ModuleConfig.initializer) {
        self.moduleConfiguration = config
        self.moduleConfiguration?.configure(self)
    }
    
}

extension SubModule {
    
    public static func +(lhs: SubModule, rhs: SubModule) -> SubModule {
        return SubModule(with: lhs.moduleConfiguration <> rhs.moduleConfiguration)
    }
    
}

extension SubModule: Equatable {
    public static func ==(lhs: SubModule,
                          rhs: SubModule) -> Bool {
        return lhs === rhs
    }
}
