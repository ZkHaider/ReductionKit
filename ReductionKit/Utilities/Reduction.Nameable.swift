//
//  Reduction.Nameable.swift
//  ReductionKit
//
//  Created by Haider Khan on 6/10/19.
//  Copyright © 2019 zkhaider. All rights reserved.
//

import Foundation

protocol Nameable {
    typealias Name = String
    static var name: Name { get }
    var name: Name { get }
}

extension Nameable {
    var name: Name {
        return String(reflecting: type(of: self))
            .components(separatedBy: "(")
            .filter({ !$0.isEmpty })[0]
    }
    
    static var name: Name {
        return String(reflecting: type(of: self))
            .components(separatedBy: "(")
            .filter({ !$0.isEmpty })[0]
    }
}
