//
//  Calculator.swift
//  HelloWorld
//
//  Created by Samuel Fuhrer on 7/22/17.
//  Copyright © 2017 Samuel Fuhrer. All rights reserved.
//

import UIKit

enum State {
    case idle
    case inputIp
    case inputFp
}

class Calculator {
    
    
    //MARK: Properties
    var state: State
    var name: String
    var stack: Stack = Stack(name: "stack")
    var currentInput: Double = 0
    var input: [Character] {
        didSet {
            if input.contains(".") {
                state = State.inputFp
            }
            else if (input.count == 0) {
                state = State.idle
                sign = 1
            }
            else {
                state = State.inputIp
            }
        }
    }
    var sign: Int = 1
    
    //MARK: Initialization
    init(name: String) {
        self.name = name
        self.state = State.idle
        self.input = []
    }
    
    func inputDigit(digit: Int) {
        input.append(Character("\(digit)"))
    }
    
    func inputDecimalPoint() {
        if (state == State.inputFp) {
            return
        }
        else {
            input.append(".")
        }
    }
    
    func changeSign() {
        if (state != State.idle) {
            sign = -sign;
        }
        else if (stack.depth > 0) {
            try? stack.push(-stack.pop())
        }
    }
    
    func delete() {
        if (state == State.idle) {
            try? _ = stack.pop()
        }
        else {
            _ = input.popLast()
        }
    }
    
    func enter() {
        if (state != State.idle) {
            stack.push(Double(sign)*Double(String(input))!)
        }
        else if (stack.depth > 0) {
            stack.push(stack.get(0))
        }
        input.removeAll()
    }
    
}
