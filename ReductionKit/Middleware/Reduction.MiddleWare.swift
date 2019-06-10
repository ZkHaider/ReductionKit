//
//  Reduction.MiddleWare.swift
//  ReductionKit
//
//  Created by Haider Khan on 6/9/19.
//  Copyright © 2019 zkhaider. All rights reserved.
//

import Foundation

open class MiddleWare<S: Any, M: SubModule>: Component<M>, InternalMiddleWare {
    
    public typealias MiddleWareSystem = S
    
    private let _middleWare: MiddleWareSystem
    public var middleWare: MiddleWareSystem {
        return _middleWare
    }
    
    public required init(middleWare: MiddleWareSystem) {
        self._middleWare = middleWare
    }
    
    public func bind(any module: SubModule) {
        guard
            let module = module as? M,
            let component = self._middleWare as? AnyComponent
            else { return }
        component.bind(any: module)
        self.bind(module: module)
    }
    
    open override func bind(module: M) {
        
    }
    
}
