//
//  Reduction.View.Components.swift
//  ReductionKit
//
//  Created by Haider Khan on 6/9/19.
//  Copyright © 2019 zkhaider. All rights reserved.
//

import Foundation

public protocol ViewComponents {
    static func window<V: UIWindow>(of type: V.Type) -> Self 
    static func viewController<V: UIViewController>(of type: V.Type) -> Self
    static func viewController<V: UIViewController>(of type: V.Type,
                                                    name: String,
                                                    with storyboard: Storyboard) -> Self
    static func niblessViewController<V: NiblessViewController>(of type: V.Type) -> Self 
    static func view<V: UIView>(of type: V.Type) -> Self
    static func view<V: UIView>(of type: V.Type,
                                with xib: Xib) -> Self
    static func niblessView<V: NiblessView>(of type: V.Type) -> Self
}
