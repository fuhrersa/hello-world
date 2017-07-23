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
    case inputExp
}

class Calculator {
    
    struct exponent {
        var sign: Int
        var value: [Character] {
            didSet {
                if value.isEmpty {
                }
            }
        }
    }
    
    //MARK: Properties
    var state: State {
        didSet {
            if (state == State.idle) {
                sign = 1
                expSign = 1
            }
        }
    }
    var name: String
    var stack: Stack = Stack(name: "stack")
    var currentInput: Double = 0
    var mantissa: [Character] {
        didSet {
            if mantissa.contains("E") {
                state = State.inputExp
            }
            else if mantissa.contains(".") {
                state = State.inputFp
            }
            else if (mantissa.count == 0) {
                state = State.idle
                sign = 1
            }
            else {
                state = State.inputIp
            }
        }
    }
    var sign: Int = 1
    var expSign: Int = 1
    
    //MARK: Initialization
    init(name: String) {
        self.name = name
        self.state = State.idle
        self.mantissa = []
    }
    
    
    
    func inputDigit(digit: Int) {
        mantissa.append(Character("\(digit)"))
    }
    
    func inputDecimalPoint() {
        if (state == State.idle || state == State.inputIp) {
            mantissa.append(".")
            state = State.inputFp
        }
    }
    
    func inputExponent() {
        switch (state) {
        case State.idle:
            mantissa.append("1")
            mantissa.append("E")
            state = State.inputExp
        case State.inputIp, State.inputFp:
            mantissa.append("E")
            state = State.inputExp
        default:
            break
        }
        
    }
    
    
    func changeSign() {
        switch (state) {
        case State.idle:
            try? stack.push(-stack.pop())
        case State.inputFp, State.inputIp:
            if ( mantissa.first == "-") {
                mantissa.remove(at: 0)
            }
            else {
                mantissa.insert("-", at: 0)
            }
        case State.inputExp:
            let i = mantissa.index(of: "E")!+1
            print(i)
            if (i < mantissa.count && mantissa[i] == "-") {
                mantissa.remove(at: i)
            }
            else {
                mantissa.insert("-", at: i)
            }
        }
    }
    
    func delete() {
        switch (state) {
        case State.idle:
            do {
                try _ = stack.pop()
            }
            catch StackError.emptyStack {
                print("DROP Error: Emtpy stack")
            }
            catch let error {
                print(error.localizedDescription)
            }
        
        case State.inputIp:
            _ = mantissa.popLast()
            if (mantissa.isEmpty) {
                state = State.idle
            }
            
        case State.inputFp:
            let c = mantissa.popLast()
            if (c == ".") {
                state = State.inputIp
            }
            
        case State.inputExp:
            let c = mantissa.popLast()
            if (c == "E") {
                if (mantissa.contains(".")) {
                    state = State.inputFp
                }
                else {
                    state = State.inputIp
                }
            }
        }
    }
    
    
    func enter() {
        switch(state) {
        case State.idle:
            if (stack.depth > 0) {
                stack.push(stack.get(0))
            }
            return
        case State.inputExp:
            if (mantissa.last == "E" || mantissa.last == "-") {
                mantissa.append("0")
            }
        case State.inputIp:
            if (mantissa.last == "-") {
                mantissa.append("0")
            }
        case State.inputFp:
            if (mantissa.last == ".") {
                mantissa.append("0")
            }
        }
        
        let d: Double? = Double(String(mantissa))
        
        if (d != nil) {
            stack.push(d!)
            mantissa.removeAll()
            state = State.idle
        }
        else {
            print("Invalid input")
        }
            
    }
    
    func add() {
        if (state != State.idle) {
            enter()
        }
        
        guard stack.depth >= 2 else {
            print("ADD Error: Too few arguments")
            return
        }
        
        do {
            try stack.push(stack.pop() + stack.pop())
        }
        catch let error {
            print(error.localizedDescription)
        }
    }
    
}
