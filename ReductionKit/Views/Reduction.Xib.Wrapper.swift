//
//  Reduction.Xib.Wrapper.swift
//  ReductionKit
//
//  Created by Haider Khan on 6/9/19.
//  Copyright © 2019 zkhaider. All rights reserved.
//

import Foundation
import UIKit

public struct Xib {
    internal let nib: UINib
    private init(nib: UINib) {
        self.nib = nib
    }
}

extension Xib {
    public static func xib(_ nib: UINib) -> Xib {
        return Xib(nib: nib)
    }
}
