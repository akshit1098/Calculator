//
//  StructEnums.swift
//  Calculator
//
//  Created by Akshit Saxena on 1/5/24.
//

import Foundation

enum Operator: String{
    case add = "+"
    case subtract = "-"
    case times = "*"
    case divide = "/"
    case nothing = ""
}

enum CalculationState: String{
    case enteringNum = "enteringNum"
    case newNumStarted = "newNumStarted"
}
