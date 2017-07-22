//
//  HelloWorldTests.swift
//  HelloWorldTests
//
//  Created by Samuel Fuhrer on 7/18/17.
//  Copyright © 2017 Samuel Fuhrer. All rights reserved.
//

import XCTest
@testable import HelloWorld

class HelloWorldTests: XCTestCase {
    
    let a: Double = 12.3
    let b: Double = -13.2
    
    //MARK: Stack test
    func testStackInitializatoinSucceeds() {
        let stack = Stack.init(name: "stack")
        XCTAssertNotNil(stack)
        XCTAssertTrue(stack.depth==0)
    }
    
    func testPopPush() {
        let stack = Stack.init(name: "stack")
        
        // push 10 values
        for depth in 1...10 {
            stack.push(Double(depth))
            XCTAssertTrue(stack.depth == depth)
        }
        
        var r: Double = 0.0
        // pop 10 value
        for depth in (1...10).reversed() {
            
            XCTAssertNoThrow(r = try stack.pop())
            
            XCTAssertTrue(stack.depth == depth-1)
            XCTAssertTrue(Int(r) == depth)
        }
        
        // try to pop empty stack
        XCTAssertThrowsError(try stack.pop())
    }
    
    func testAdd() {
        let stack = Stack.init(name: "stack")
        stack.push(a)
        stack.push(b)
        
        XCTAssertNoThrow(try stack.add())
        XCTAssertTrue(try! stack.pop() == a+b)
    }
}
