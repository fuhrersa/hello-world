//
//  Stack.swift
//  HelloWorld
//
//  Created by Samuel Fuhrer on 7/21/17.
//  Copyright © 2017 Samuel Fuhrer. All rights reserved.
//

import UIKit

class Stack {
    
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
    func pop() -> Double? {
        return depth > 0 ? stack.removeLast() : nil
    }
    
    func push(_ value: Double) -> Bool {
        stack.append(value)
        return true
    }
    
    func add() -> Bool {
        return depth < 2 ? false : push(pop()! + pop()!)
    }
    
}
