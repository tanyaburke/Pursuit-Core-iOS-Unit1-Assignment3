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
    return {x, y in x - y }  case "*":
    return {x, y in x * y }
  case "/":
    return {x, y in x / y }
  default:
    return {x, y in x + y }
  }
}

func myFilter(inputArray: [Int], by: String, filter: (Int)) -> [Int] {
   var filterArray = [Int]()
    for int in inputArray {
        if by == "<" {
            if int < filter {
                filterArray.append(int)
               
            }
        }else if by == ">" {
            if int > filter {
                filterArray.append(int)
                
        }
    }
}
    return filterArray
}

//print("Please enter an expression, example: 5 + 3 ")
//let userInput = readLine() ?? "1 + 1"
//print()

func takeInInput(input:String) -> Double {
    
    
    var userInputAsArray = input.components(separatedBy: " ")
  
    
      let num1 = Double(userInputAsArray[0]) ?? 0.0

      let num2 = Double(userInputAsArray[2]) ?? 0.0
      
      let mathFunction = mathStuffFactory(opString: userInputAsArray[1])
         let calcu = mathFunction(num1,num2)
    let filterNumsArray = [Int]()
   
    
    if userInputAsArray.contains("filter"){
           print("Please enter the numbers you want to filter, Example: 1,5,6,7,8,9")
        let filterNums = readLine()
        var filterNumsArray = (filterNums?.components(separatedBy: ","),
            print("Choose < or >")
        let greatOrLess = readLine() ?? "<"
        print ("Enter the number your filtering by")
        let filterBy = (readLine() ?? "0")
        myFilter(inputArray: (filterNumsArray.value), by:  greatOrLess, filter: filterBy.value)
       }
    
    if userInputAsArray[1] == "?" {
        let operAndArray = ["*", "/", "+", "-"]
        userInputAsArray[1] = String(operAndArray.randomElement() ?? "*")
       print(calcu)
        print("Can you guess what the operator is ?")
   let userGuess = readLine()
        if userGuess == userInputAsArray[1]{
            print ("That's Correct Yippeeeee")
        }else {
            print("Ohhh, that's wrong...")
        }
    }
 
//    print(userInputAsArray)
//    print(calcu)
    return calcu

    
}


//print(takeInInput(input: userInput))

var continuePrompt = false

repeat  {
 
   print("Please enter an expression or filter\n example: 5 + 3\n or\n filter ")
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





