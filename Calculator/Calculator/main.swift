//
//  main.swift
//  Calculator
//
//  Created by Alex Paul on 10/25/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

var continueCalculator = Bool()

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

func myMap(inputArray: [Int], by: String, filter: (Int)) -> [Int] {
    var mapArray = [Int]()
    
    switch by {
    case "*":
        for int in inputArray {
            mapArray.append(filter * int)
        }
    case "/":
        for int in inputArray {
            mapArray.append(int / filter)
        }
    default:
        print("please input a valid operand")
    }
    return mapArray
}
func myReduce(inputArray: [Int], by: String, startAt: (Int)) -> Int {
    var reduceResult = startAt
    
    for int in inputArray {
        if by == "+" {
            reduceResult += int
        } else if by == "*" {
            reduceResult *= int
        }
    }
    return reduceResult
}
func calculatorStatus() -> Bool {
    print("Would you like to calculate again? yes or no")
    let yesNo = readLine()?.lowercased()
    if yesNo == "yes"{
        return true
    } else {
        return false
    }
}
func lowOrderMath(input:String) -> Double {
    var userInputAsArray = input.components(separatedBy: " ")
    let num1 = Double(userInputAsArray[0]) ?? 0.0
    
    let num2 = Double(userInputAsArray[2]) ?? 0.0
    
    let mathFunction = mathStuffFactory(opString: userInputAsArray[1])
    let calcu = mathFunction(num1,num2)
    
    if userInputAsArray[1] == "?" {
        let operAndArray = ["*", "/", "+", "-"]
        userInputAsArray[1] = String(operAndArray.randomElement() ?? "*")
        print(calcu)
        print("Can you guess what the operator is ?")
        let userGuess = readLine() ?? " "
        if userGuess == userInputAsArray[1]{
            print ("That's Correct Yippeeeee")
        } else {
            print("Ohhh, that's wrong... the operand was \(userInputAsArray[1])")
        }
    }
    return calcu
}
func highOrder(userInput: String) {
    
    switch userInput {
        
    case "filter":
        var filterNumsArray = [Int]()
        print("Please enter the numbers you want to filter, Example: 1,5,6,7,8,9")
        let filterNums = readLine()
        guard let filterStringArray = (filterNums?.components(separatedBy: ",")) else { return }
        print("Choose < or >")
        let greatOrLess = readLine() ?? "<"
        print ("Enter the number your filtering by")
        let filterBy = Int(readLine() ?? "0") ?? 0
        
        for char in filterStringArray {
            filterNumsArray.append(Int(char) ?? 0)
        }
        print("Your filtered results are \(myFilter(inputArray: (filterNumsArray), by:  greatOrLess, filter: filterBy))")
        
    case "map":
        var enteredNum = [Int]()
        print("Please enter the numbers you want to map, Example: 1,5,6,7,8,9")
        let mapNums = readLine()
        guard let filterStringArray = (mapNums?.components(separatedBy: ",")) else { return }
        for char in filterStringArray {
            enteredNum.append(Int(char) ?? 0)
        }
        print("Choose * or /")
        let mapBy = readLine() ?? "*"
        
        print("Please enter the number you want to map by")
        let  mapNum = Int(readLine() ?? "0") ?? 0
        
        print("Your map by \(mapBy) & \(mapNum) results are \(myMap(inputArray: enteredNum, by: mapBy, filter: mapNum))")

    case "reduce":
        var reduceNumArray = [Int]()
        print("Please enter the numbers you want to reduce, Example: 1,5,6,7,8,9")
        let reduceString = readLine()
        guard let filterStringArray = (reduceString?.components(separatedBy: ",")) else { return }
        for char in filterStringArray {
            reduceNumArray.append(Int(char) ?? 0)
        }
        print("Choose * or +")
        let reduceBy = readLine() ?? "*"
        
        print("Please enter the number you want to start your reduce at")
        let  reduceNum = Int(readLine() ?? "0") ?? 0
        
        print("Your reduce by result is \(myReduce(inputArray: reduceNumArray, by: reduceBy, startAt: reduceNum))")
    default:
        print("please enter a function")
        
    }
    
}
print("Welcome to 🧮 Tanya's Calculator 🧮")
print()

repeat {
    print("Choose enter 1 (Regular)  2 (High Order)")
    let regularOrHighOrder = Int(readLine() ?? "0") ?? 0
    
    switch regularOrHighOrder {
    case 1:
        print("Enter your operation")
        let enteredOperation = readLine() ?? "1 + 1"
        print(lowOrderMath(input: enteredOperation))
        continueCalculator = calculatorStatus()
        print()
    case 2:
        print("Enter your operation i.e. filter, map, reduce")
        let enteredFunction = readLine() ?? "filter"
        highOrder(userInput: enteredFunction)
        continueCalculator = calculatorStatus()
        print()
    default:
        print("Please try again")
        continueCalculator = true
        print()
    }
}while continueCalculator




