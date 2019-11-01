//
//  main.swift
//  Calculator
//
//  Created by Alex Paul on 10/25/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

func mathStuffFactory(opString: String) -> (Double, Double) -> Double {
  switch opString {
  case "+":
    return {x, y in x + y }
  case "-":
    return {x, y in x - y }
  case "*":
    return {x, y in x * y }
  case "/":
    return {x, y in x / y }
  default:
    return {x, y in x + y }
  }
}

//print("Please enter an expression, example: 5 + 3 ")
//let userInput = readLine() ?? "1 + 1"
//print()

func takeInInput(input:String) -> Double {
    
    
    let userInputAsArray = input.components(separatedBy: " ")
    
    let mathFunction = mathStuffFactory(opString: userInputAsArray[1])
    
    let num1 = Double(userInputAsArray[0]) ?? 0.0

    let num2 = Double(userInputAsArray[2]) ?? 0.0
    
    let calcu = mathFunction(num1,num2)
 
//    print(userInputAsArray)
//    print(calcu)
    return calcu

    
}

//print(takeInInput(input: userInput))

var continuePrompt = false

repeat  {
 
   print("Please enter an expression, example: 5 + 3 ")
   let userInput = readLine() ?? "1 + 1"
  print()
   print(takeInInput(input: userInput))
  
  print("Would you like to continue? yes or no")
    let yesOrNo = readLine() ?? "no"
    if yesOrNo.lowercased() == "yes"{
        continuePrompt = true
    }else{
        continuePrompt = false
    }
    
}
while continuePrompt == true





