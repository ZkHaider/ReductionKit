//
//  Reduction.Storyboard.Wrapper.swift
//  ReductionKit
//
//  Created by Haider Khan on 6/9/19.
//  Copyright © 2019 zkhaider. All rights reserved.
//

import Foundation
import UIKit

public struct Storyboard {
    internal let storyboard: UIStoryboard
    private init(storyboard: UIStoryboard) {
        self.storyboard = storyboard
    }
}

extension Storyboard {
    public static func storyboard(_ storyboard: UIStoryboard) -> Storyboard {
        return Storyboard(storyboard: storyboard)
    }
}
