//
//  Reduction.View.Component.swift
//  ReductionKit
//
//  Created by Haider Khan on 6/9/19.
//  Copyright © 2019 zkhaider. All rights reserved.
//

import Foundation
import UIKit

public protocol AnyViewComponent: AnyComponent {
    var anyView: UIView { get }
}

internal protocol InternalViewComponent: AnyComponent {
    associatedtype View: UIView
    var view: View { get }
}

extension InternalViewComponent {
    public var anyView: UIView? {
        return view
    }
}

open class ViewComponent<V: UIView, M: SubModule>: Component<M>, InternalViewComponent {
    
    public typealias View = V
    
    private let _view: View
    public var view: V {
        return _view
    }
    
    public required init(view: View) {
        self._view = view
        super.init()
    }
    
    public func bind(any module: SubModule) {
        guard
            let component = self.view as? AnyComponent
            else { return }
        component.bind(any: module)
    }
    
}
