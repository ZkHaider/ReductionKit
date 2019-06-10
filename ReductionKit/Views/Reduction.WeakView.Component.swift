//
//  Reduction.WeakView.Component.swift
//  ReductionKit
//
//  Created by Haider Khan on 6/9/19.
//  Copyright © 2019 zkhaider. All rights reserved.
//

import Foundation

public protocol AnyWeakViewComponent {
    var anyWeakView: UIView? { get }
}

internal protocol InternalWeakViewComponent {
    associatedtype View: UIView
    var weakView: View? { get }
}

extension InternalWeakViewComponent {
    var anyWeakView: UIView? {
        return weakView
    }
}

open class WeakViewComponent<V: UIView, M: SubModule>: Component<M>, InternalWeakViewComponent {
    
    public typealias View = V
    
    private weak var _weakView: View?
    public var weakView: V? {
        return _weakView
    }
    
    public required init(view: View) {
        self._weakView = view
        super.init()
    }
    
    public func bind(any module: SubModule) {
        guard
            let view = self.weakView,
            let component = view as? AnyComponent
            else { return }
        component.bind(any: module)
    }
    
}
