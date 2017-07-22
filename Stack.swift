//
//  Stack.swift
//  HelloWorld
//
//  Created by Samuel Fuhrer on 7/21/17.
//  Copyright © 2017 Samuel Fuhrer. All rights reserved.
//

import UIKit

class Stack {
    
    
    enum StackError : Error {
        case tooFewArguments(argsNeeded: Int)
        case emptyStack
    }
    
    //MARK: Properties
    var name: String
    var stack = [Double]()

    var depth: Int {
        get { return stack.count }
    }
    
    //MARK: Initialization
    init(name: String) {
        self.name = name
    }
    
    //MARK: Functions
    func pop() throws -> Double {
        if depth > 0 {
            return stack.removeFirst()
        }
        else {
            throw StackError.emptyStack
        }
    }
    
    func push(_ value: Double) {
        stack.insert(value, at: 0)
    }
    
    func add() throws {
        if (depth < 2) {
            throw StackError.tooFewArguments(argsNeeded: 2)
        }
        else  {
            try push(pop() + pop())
        }
    }
    
    func get(_ index: Int) -> Double {
        return stack[index]
    }
    
}
