//
//  Reduction.Window.Component.swift
//  ReductionKit
//
//  Created by Haider Khan on 6/9/19.
//  Copyright © 2019 zkhaider. All rights reserved.
//

import Foundation

public protocol AnyWindowComponent: AnyComponent {
    var anyWindow: UIWindow { get }
}

internal protocol InternalWindowComponent: AnyWindowComponent {
    associatedtype Window: UIWindow
    var window: Window { get }
}

extension InternalWindowComponent {
    public var anyWindow: UIWindow {
        return window
    }
}

open class WindowComponent<W: UIWindow, M: SubModule>: Component<M>, InternalWindowComponent {
    
    public typealias Window = W
    
    private let _window: Window
    public var window: Window {
        return _window
    }
    
    public required init(window: Window) {
        self._window = window
    }
    
    public func bind(any module: SubModule) {
        guard
            let component = self.window as? AnyComponent
            else { return }
        component.bind(any: module)
    }
    
}
