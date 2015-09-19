//
//  ViewController.swift
//  CalculatorApp
//
//  Created by Gandhar on 2015-09-16.
//  Copyright © 2015 gandhartannu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ResultDisplay: UILabel!
    
    var isUserTypingInput = false
    
    @IBAction func numberPressed(sender: UIButton) {
        let userInputNumber = sender.currentTitle!
        if isUserTypingInput {
            ResultDisplay.text = ResultDisplay.text! + userInputNumber
        }
        else {
            ResultDisplay.text = userInputNumber
            isUserTypingInput = true
        }
    }
    
    var operandStack = Array<Double>()
    
    @IBAction func enter() {
        isUserTypingInput = false
        operandStack.append(displayValue)
        print("operandStack is: \(operandStack)")
    }
    
    var displayValue: Double {
        get {
            return NSNumberFormatter().numberFromString(ResultDisplay.text!)!.doubleValue
        }
        set {
            print("Setter New Value : \(newValue)")
            ResultDisplay.text = "\(newValue)"
            isUserTypingInput = false
        }
    }
    
    @IBAction func operation(sender: UIButton) {
        if isUserTypingInput {
            enter()
        }
        switch sender.currentTitle! {
        case "*": performDoubleOperatorsOperation({$0 * $1})
        case "/": performDoubleOperatorsOperation({$1 / $0})
        case "+": performDoubleOperatorsOperation({$0 + $1})
        case "-": performDoubleOperatorsOperation({(Op1: Double, Op2: Double) -> Double in return Op2 - Op1})
        case "⎷": performSingleOperatorOperation({sqrt($0)})
        default: break
        }
    }
    
    func performDoubleOperatorsOperation(operation: (Double, Double) -> Double) {
        if operandStack.count >= 2 {
            displayValue = operation(operandStack.removeLast(), operandStack.removeLast())
            enter()
        }
    }
    
    func performSingleOperatorOperation(operation: Double -> Double) {
        if operandStack.count >= 1 {
            displayValue = operation(operandStack.removeLast())
            enter()
        }
    }
    
    
}