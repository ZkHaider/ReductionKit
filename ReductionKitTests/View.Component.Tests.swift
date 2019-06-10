//
//  View.Component.swift
//  ReductionKitTests
//
//  Created by Haider Khan on 6/9/19.
//  Copyright © 2019 zkhaider. All rights reserved.
//

import XCTest
@testable import ReductionKit

let componentBuilder: ComponentBuilder = .view(
    .viewController(of: UIViewController.self)
)

class ViewComponentTests: XCTestCase {

    override func setUp() {
        let anyComponent = componentBuilder.build()
        print("")
        // Put setup code here. This method is called before the invocation of each test method in the class.
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
