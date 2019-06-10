//
//  Reduction.View.Builder.swift
//  ReductionKit
//
//  Created by Haider Khan on 6/9/19.
//  Copyright © 2019 zkhaider. All rights reserved.
//

import Foundation

public struct ViewComponentBuilder<M: SubModule> {
    let build: () -> (AnyComponent)
    private init(build: @escaping () -> (AnyComponent)) {
        self.build = build
    }
}

extension ViewComponentBuilder: ViewComponents {
    
    public static func window<V>(of type: V.Type) -> ViewComponentBuilder where V : UIWindow {
        return ViewComponentBuilder {
            WindowComponent<V, M>(window: type.init(frame: .zero))
        }
    }
    
    public static func viewController<V>(of type: V.Type) -> ViewComponentBuilder where V : UIViewController {
        return ViewComponentBuilder {
            ViewControllerComponent<V, M>(viewController: type.init())
        }
    }
    
    public static func viewController<V>(of type: V.Type,
                                         name: String,
                                         with storyboard: Storyboard
        ) -> ViewComponentBuilder where V : UIViewController {
        return ViewComponentBuilder {
            guard
                let viewController = storyboard.storyboard.instantiateViewController(withIdentifier: name) as? V
                else {
                    fatalError("Could not load ViewController from Storyboard.")
            }
            return ViewControllerComponent<V, M>(viewController: viewController)
        }
    }
    
    public static func niblessViewController<V>(
        of type: V.Type) -> ViewComponentBuilder<M>
        where V : NiblessViewController {
        return ViewComponentBuilder {
            return ViewControllerComponent<V, M>(viewController: type.init())
        }
    }
    
    public static func view<V>(of type: V.Type) -> ViewComponentBuilder where V : UIView {
        return ViewComponentBuilder {
            ViewComponent<V, M>(view: type.init())
        }
    }
    
    public static func view<V>(of type: V.Type, with xib: Xib) -> ViewComponentBuilder where V : UIView {
        return ViewComponentBuilder {
            let objects = xib.nib.instantiate(withOwner: nil,
                                              options: nil)
            guard
                let view = objects.first as? V
                else {
                    fatalError("Could not load Xib file.")
            }
            return ViewComponent<V, M>(view: view)
        }
    }
    
    public static func niblessView<V>(
        of type: V.Type) -> ViewComponentBuilder<M>
        where V : NiblessView {
        return ViewComponentBuilder {
            return ViewComponent<V, M>(view: type.init())
        }
    }
    
}
