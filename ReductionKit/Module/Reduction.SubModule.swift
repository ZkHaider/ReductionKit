//
//  SubModule.swift
//  ReductionKit
//
//  Created by Haider Khan on 6/9/19.
//  Copyright © 2019 zkhaider. All rights reserved.
//

import Foundation

public typealias ModuleDescription = SubModuleComponentsBuilder

open class SubModule: HasSubModule, AnyBindable, Nameable {
    
    // MARK: - Definitions
    
    public typealias Module = Self
    
    // MARK: - Module Description
    
    open var moduleDescription: ModuleDescription {
        return .module()
    }
    
    // MARK: - SubModules
    
    private lazy var moduleMap: [Name: SubModule] = {
        return self.moduleDescription
            .buildSubModules()
            .reduce(into: [:], { $0[$1.name] = $1 })
    }()
    
    // MARK: - Components
    
    internal lazy var components: [AnyComponent] = {
        return self.moduleDescription.buildComponents()
    }()
    
    internal lazy var internalComponents: [Component] = {
        return self.components.lazy.compactMap({ $0 as? Component })
    }()

    internal lazy var viewComponents: [AnyViewComponent] = {
        return self.components.lazy.compactMap({ $0 as? AnyViewComponent })
    }()
    
    internal lazy var weakViewComponents: [AnyWeakViewComponent] = {
        return self.components.lazy.compactMap({ $0 as? AnyWeakViewComponent })
    }()
    
    public var subModules: [SubModule] {
        return Array(self.moduleMap.values)
    }
    
    // MARK: - Configuration
    
    public private(set) var moduleConfiguration: ModuleConfig<SubModule>? = nil
    
    // MARK: - Init
    
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
