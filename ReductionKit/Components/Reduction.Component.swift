//
//  Reduction.Component.swift
//  ReductionKit
//
//  Created by Haider Khan on 6/9/19.
//  Copyright © 2019 zkhaider. All rights reserved.
//

import Foundation

public protocol AnyComponent {
    var anyModule: SubModule? { get }
    func bind(any module: SubModule)
}

public protocol ModuleComponent: AnyComponent {
    associatedtype Module: SubModule
    var module: Module? { get }
}

extension ModuleComponent {
    public var anyModule: SubModule? {
        return self.module
    }
}

internal protocol InternalComponent: ModuleComponent {
    var module: Module? { get }
    func _bind(module: Module)
}

extension InternalComponent {
    public func bind(any module: SubModule) {
        guard
            let subModule = module as? Module
            else { return }
        self._bind(module: subModule)
    }
}

open class Component<M: SubModule>: InternalComponent {
    
    // MARK: - Module
    
    public typealias Module = M
    
    public internal(set) weak var module: Module? = nil
    
    internal func _bind(module: M) {
        self.module = module
        self.bind(module: module)
    }
    
    open func bind(module: Module) {
        
    }
    
}
