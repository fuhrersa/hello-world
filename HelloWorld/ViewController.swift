//
//  ViewController.swift
//  HelloWorld
//
//  Created by Samuel Fuhrer on 7/18/17.
//  Copyright © 2017 Samuel Fuhrer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Properties
    var calc: Calculator = Calculator(name: "calculator")
    
    @IBOutlet weak var stack0Label: UILabel!
    @IBOutlet weak var stack1Label: UILabel!
    @IBOutlet weak var stack2Label: UILabel!
    @IBOutlet weak var stack3Label: UILabel!
    
    
    @IBOutlet weak var enterButton: UIButton!
    
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var sixButton: UIButton!
    @IBOutlet weak var sevenButton: UIButton!
    @IBOutlet weak var eightButton: UIButton!
    @IBOutlet weak var nineButton: UIButton!
    
    @IBOutlet weak var decimalButton: UIButton!
    
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var multButton: UIButton!
    @IBOutlet weak var divButton: UIButton!
    @IBOutlet weak var invButton: UIButton!
    @IBOutlet weak var signButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    //MARK: Actions
    @IBAction func pushNumber(_ sender: UIButton) {
        calc.inputDigit(digit: sender.tag)
        updateStackDisplay()
    }
  
  
    @IBAction func pushDelete(_ sender: UIButton) {
        calc.delete()
        updateStackDisplay()
    }
    
    @IBAction func pushChangeSign(_ sender: UIButton) {
        calc.changeSign()
        updateStackDisplay()
    }
    
    @IBAction func pushDecimalPoint(_ sender: UIButton) {
        calc.inputDecimalPoint()
        updateStackDisplay()
    }
    
    
    @IBAction func pushEnter(_ sender: UIButton) {
        calc.enter()
        updateStackDisplay()
    }
    
    func getStackString(index: Int) -> String {
        if (calc.stack.depth <= index) {
            return ""
        }
        else {
            return String(format: "%.6f", calc.stack.get(index))
        }
    }
    
    func updateStackDisplay() {
        print(calc.state)
        var stackLabels: [UILabel] = [stack0Label, stack1Label, stack2Label, stack3Label]
        
        if (calc.state == State.idle) {
            for i in 0...3 {
                stackLabels[i].text = getStackString(index: i)
                stackLabels[i].textAlignment = NSTextAlignment.right
            }
        }
        else {
            for i in 1...3 {
                stackLabels[i].text = getStackString(index: i-1)
                stackLabels[i].textAlignment = NSTextAlignment.right
            }
            let sign = calc.sign < 0 ? "-" : ""
            stackLabels[0].text = sign + String(calc.input) + "_"
            stack0Label.textAlignment = NSTextAlignment.left

        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
  


}

