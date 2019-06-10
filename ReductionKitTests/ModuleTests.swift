//
//  ModuleTests.swift
//  ReductionKitTests
//
//  Created by Haider Khan on 6/9/19.
//  Copyright © 2019 zkhaider. All rights reserved.
//

import XCTest
@testable import ReductionKit

final class MyComponent<M: SubModule>: Component<M> {
    
    override func bind(module: M) {
        print("Binded")
    }
    
}

final class MyModule: SubModule {
    
    let myComponent = MyComponent()
    
}

class ModuleTests: XCTestCase {
    
    override func setUp() {
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testModuleBinding() {
        let myModule = MyModule()
        assert(myModule.myComponent.module == myModule, "Module Binded")
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
