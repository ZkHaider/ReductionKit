//
//  Module.Builder.Tests.swift
//  ReductionKitTests
//
//  Created by Haider Khan on 6/9/19.
//  Copyright © 2019 zkhaider. All rights reserved.
//

import XCTest
@testable import ReductionKit

struct BuilderState: Equatable {
    
}

final class MyViewController: NiblessViewController, AnyComponent {
    
    var anyModule: SubModule?
    func bind(any module: SubModule) {
        print("module: \(module)")
    }
    
    
    public required init() {
        super.init()
    }
    
}

final class AnotherNiblessVC: NiblessViewController, AnyComponent {
    
    var anyModule: SubModule?
    func bind(any module: SubModule) {
        print("module: \(module)")
    }
    
}

final class BuilderModule: SubModule {
    
    let myReducer = Reducer<BuilderState, Any> { (state, value) in
        return nil
    }

    override var moduleDescription: ModuleDescription {
        .module(
            .subModules(
                
            ),
            .state(
                initialState: BuilderState(),
                myReducer
            ),
            .views(
                .niblessViewController(of: AnotherNiblessVC.self),
                .viewController(of: MyViewController.self)
            )
        )
    }
    
}

class ModuleBuilderTests: XCTestCase {
    
    override func setUp() {
        let builderModule = BuilderModule()
        print(builderModule)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
