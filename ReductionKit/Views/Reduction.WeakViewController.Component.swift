//
//  Reduction.WeakViewController.Component.swift
//  ReductionKit
//
//  Created by Haider Khan on 6/9/19.
//  Copyright © 2019 zkhaider. All rights reserved.
//

import Foundation

public protocol AnyWeakViewControllerComponent: AnyWeakViewComponent {
    var anyWeakViewController: UIViewController? { get }
}

internal protocol InternalWeakViewControllerComponent: AnyWeakViewControllerComponent {
    associatedtype ViewController: UIViewController
    var weakViewController: ViewController? { get }
}

extension InternalWeakViewControllerComponent {
    
    public var anyWeakViewController: UIViewController? {
        return weakViewController
    }
    
    public var anyWeakView: UIView? {
        return weakViewController?.view
    }
}

open class WeakViewControllerComponent<V: UIViewController, M: SubModule>: Component<M>, InternalWeakViewControllerComponent {
        
    public typealias ViewController = V
    
    private weak var _weakViewController: ViewController?
    public var weakViewController: ViewController? {
        return _weakViewController
    }
    
    public required init(viewController: ViewController) {
        self._weakViewController = viewController
        super.init()
    }
    
    public func bind(any module: SubModule) {
        guard
            let viewController = self.weakViewController,
            let component = viewController as? AnyComponent
            else { return }
        component.bind(any: module)
    }
    
}
