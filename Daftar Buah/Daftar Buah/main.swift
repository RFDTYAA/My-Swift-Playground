//
//  main.swift
//  Daftar Buah
//
//  Created by Muhammad Rafi Aditya on 14/05/25.
//

import Foundation

// MARK: Holds the collection of fruits.
var listFruits = [String]()
var isRunning = true

// MARK: Gets input from the user.
func getInput (message : String) -> String? {
    print(message, terminator: ":")
    return readLine()
}

// MARK: Gets input from the user with the INT data type.
func getInputInt(message : String) -> Int? {
    if let inputString = getInput(message: message) {
        return Int (inputString)
        
    } else {
        return 0
    }
}

// MARK: Display all the fruit lists.
func showAllFruits() {
    if listFruits.isEmpty {
        print("There are no items in the list yet.")
    } else {
        for (index, value) in listFruits.enumerated() {
            print("[\(index+1)]\(value)")
        }
    }
}

// MARK: Enter the names of Fruits.
func insertFruit() {
    if let name = getInput(message: "Enter the Fruit Name") {
        listFruits.append(name)
        
    } else {
        insertFruit()
        print("Invalid Input")
    }
}

// MARK: Changes the fruit name based on position.
func editFruit() {
    showAllFruits()
    print("---------------------------------------------------")
    if let position = getInputInt(message: "Select the position of the Fruit to be replaced") {
        if position <= listFruits.count && position > 0 {
            if let name = getInput(message: "Enter the Name of Fruit:") {
                listFruits[position-1] = name
            }
        } else {
            showMenu()
        }
    } else {
        editFruit()
        print("Invalid Input")
    }
}

// MARK: Removes Fruit based on position.
func deleteFruit() {
    showAllFruits()
    if let position = getInputInt(message: "Select the position of the Fruit to be deleted") {
        if position <= listFruits.count && position > 0 {
            listFruits.remove(at: position-1)
        } else {
            showMenu()
        }
    } else {
        deleteFruit()
        print("Invalid Input")
    }
}

// MARK: Displays the Menu.
func showMenu () {
    print("Welcome to Dicoding Market")
    print("------------- Menu -------------")
    print("[1] Show All Fruits.")
    print("[2] Add Fruit Item.")
    print("[3] Change Fruit Item.")
    print("[4] Delete Fruit Item.")
    print("[5] Exit.")
    
    if let position = getInputInt(message: "Please Select the Menu above"), position <= 5 && position > 0 {
        print("---------------------------------------------------")
        
        switch position {
            
        case 1:
            showAllFruits()
            
        case 2:
            insertFruit()
            
        case 3:
            editFruit()
            
        case 4:
            deleteFruit()
            
        case 5:
            isRunning = false
            print("Thank You!. Please Come Back Soon.")
            
        default:
            print("Your Choice is Wrong!")
        }
        
    } else {
        print("Menu Item is not Valid")
    }
    print("---------------------------------------------------")
}

// MARK: Run the Program.
while isRunning {
    showMenu()
}
