//
//  main.swift
//  Motor Listrik
//
//  Created by Muhammad Rafi Aditya on 17/05/25.
//

import Foundation

// MARK: Get a String value from the user.
func getInput(message:String) -> String? {
    print(message, terminator: ":");
    return readLine()
}

// MARK: Get an Integer value form the user.
func getInputInt(message:String) -> Int? {
    if let inputString = getInput(message: message) {
        return Int(inputString)
        
    } else {
        return nil
    }
}

// MARK: Holds the speed variable.
var speedTotal = 0

//MARK: Closure to get speed.
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    func incrementer() -> Int {
        speedTotal += amount
        return speedTotal
    }
    return incrementer
}

// MARK: Closure to reduce speed.
func makeDecrementer(forDecrement amount: Int) -> () -> Int {
    func decrementer() -> Int {
        speedTotal -= amount
        return speedTotal
    }
    return decrementer
}

// MARK: Determines the value of Addition and Subtraction.
let incrementByTen = makeIncrementer(forIncrement: 10)
let decrementByTen = makeDecrementer(forDecrement: 10)

// MARK: Turning on the electric motor engine.
func turnOnEngine() {
    print("Turn on the engine......")
    print("Welcome to Dicoding Electric Motor")
    print("Brem-Brem Brem-Brem")
}

// MARK: Turning off the electric motor engine.
func turnOffEngine() {
    print("Ciiitttttttt......")
    print("The Motor stops.")
}

// MARK: Displaying the current speed.
func showSpeed () {
    print("Current Speed: \(speedTotal)")
    print("Ngeeeeeeenggggggg......")
}

// MARK: Giving action to electric motor engine.
func action () {
    print("---------------------------------------")
    print("Let`s take an action:")
    print("[1]. Increase Speed.")
    print("[2]. Decrease Speed.")
    print("[3]. Turn Off Engine.")
    
    if let state = getInputInt(message: "Enter your action: ") {
        switch state {
            
        case 1:
            speedTotal = incrementByTen()
            showSpeed()
            action()
            
        case 2:
            if speedTotal > 0 {
                speedTotal = decrementByTen()
                showSpeed()
                action()
            } else {
                turnOffEngine()
                break
            }
            
        case 3:
            turnOffEngine()
            break
            
        default:
            break
        }
        } else {
        print("Invalid Input")
    }
}

// MARK: Starts the program.
turnOnEngine()
action()
