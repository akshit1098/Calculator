//
//  ViewController.swift
//  Calculator
//
//  Created by Akshit Saxena on 1/5/24.
//

import UIKit

class ViewController: UIViewController {
    
    var firstValue: String = ""
    var currentOperation: Operator = Operator.nothing
    var calcState: CalculationState = CalculationState.enteringNum
    
    @IBAction func numberClicked(_ sender: UIButton){
    
        updateDisplay(number: String(sender.tag))
        
    }
    
    func updateDisplay(number: String){
        if calcState == CalculationState.newNumStarted{
            if let num = resultLabel.text{
                if num != ""{
                    firstValue = num
                }
            }
            calcState = CalculationState.enteringNum
            resultLabel.text = number
        }
        else if calcState == CalculationState.enteringNum{
            resultLabel.text = resultLabel.text! + number
        }
    }
    
    func updateOperatorButton(tag: Int){
        //clear colors
        for var i in 10..<14{
            if let button = self.view.viewWithTag(i) as? UIButton{
                button.backgroundColor = UIColor.clear
            }
        }
        //change color buttons
        if let button = self.view.viewWithTag(tag) as? UIButton{
            button.backgroundColor = UIColor.yellow
        }
    }
    
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBAction func operatorClicked(_ sender: UIButton){
        
        calcState = CalculationState.newNumStarted
        if let num = resultLabel.text{
            if num != ""{
                firstValue = num
                resultLabel.text = ""
            }
        }
        
        updateOperatorButton(tag: sender.tag)
        
        switch sender.tag{
            case 10:
                currentOperation = Operator.add
            case 11:
                currentOperation = Operator.subtract
            case 12:
                currentOperation = Operator.times
            case 13:
                currentOperation = Operator.divide
            default:
                return
            
        }
        
    }
    
    @IBAction func equalsClicked(_ sender: UIButton){
        calculateSum()
        
    }
    
    func calculateSum(){
        if (firstValue.isEmpty){
            return
        }
        var result = ""
        if currentOperation == Operator.times{
            result = "\(Double(firstValue)! * Double(resultLabel.text!)!)"
        }
        if currentOperation == Operator.subtract{
            result = "\(Double(firstValue)! - Double(resultLabel.text!)!)"
        }
        if currentOperation == Operator.divide{
            result = "\(Double(firstValue)! / Double(resultLabel.text!)!)"
        }
        if currentOperation == Operator.add{
            result = "\(Double(firstValue)! + Double(resultLabel.text!)!)"
        }
        resultLabel.text = result
        calcState = CalculationState.newNumStarted
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

