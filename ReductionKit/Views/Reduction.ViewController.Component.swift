//
//  Reduction.ViewController.Component.swift
//  ReductionKit
//
//  Created by Haider Khan on 6/9/19.
//  Copyright © 2019 zkhaider. All rights reserved.
//

import Foundation

public protocol AnyViewControllerComponent: AnyViewComponent {
    var anyViewController: UIViewController { get }
}

internal protocol InternalViewControllerComponent: AnyViewControllerComponent {
    associatedtype ViewController: UIViewController
    var viewController: ViewController { get }
}

extension InternalViewControllerComponent {
    
    public var anyViewController: UIViewController {
        return viewController
    }
    
    public var anyView: UIView {
        return viewController.view
    }
}

open class ViewControllerComponent<V: UIViewController, M: SubModule>: Component<M>, InternalViewControllerComponent {
    
    public typealias ViewController = V
    
    private let _viewController: ViewController
    public var viewController: ViewController {
        return _viewController
    }
    
    public required init(viewController: ViewController) {
        self._viewController = viewController
        super.init()
    }
    
    public func bind(any module: SubModule) {
        guard
            let component = self.viewController as? AnyComponent
            else { return }
        component.bind(any: module)
    }
    
    open override func bind(module: Module) {
        
    }
    
}
