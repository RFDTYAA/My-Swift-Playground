//
//  main.swift
//  Penghitung Nilai
//
//  Created by Muhammad Rafi Aditya on 12/05/25.
//

import Foundation

// MARK: User Input.
print("Welcome to Dicoding Academy!")
print("--------------------------------------------")
print("Enter the total value to be assessed", terminator: ": "); let total = readLine() ?? ""
print("--------------------------------------------")

// MARK: Ensure that the Input is correct.
if let totalItem:Int = Int(total) {
    var allValues = [Int]()
    
    // MARK: Get the value of each them.
    for index in 1...totalItem {
        print("Enter item to \(index)", terminator: ":"); let newIem = Int (readLine() ?? "") ?? 0
        allValues.append(newIem)
    }
    
    print("--------------------------------------------")
    
    // MARK: Add up all the values.
    var sum:Int = 0
    for value in allValues {
        sum += value
    }
    
    // MARK: Gets the average of the grades.
    let average = sum / totalItem
    var grade = ""
    
    // MARK: Gets the grade from the average of the grades.
    switch average {
    
    case 0...40:
        grade = "E"
    
    case 41...50:
        grade = "D"
    
    case 51...60:
        grade = "C"
    
    case 61...70:
        grade = "C+"
    
    case 71...80:
        grade = "B"
    
    case 81...90:
        grade = "B+"
    
    case 91...100:
        grade = "A"
    
    default:
        grade = "Tidak Valid"
    }
    
    // MARK: Prints the final grade.
    if grade != "Invalid" {
        print("You get the Grade Value \(grade) from the \(total) Existing Values.")
        print("You get the Total Values \(sum) with the average \(average).")
        
    } else {
        
        print("Invalid Values")
        
    }
    
} else {
    
    print("Invalid Input")
    
}

print("--------------------------------------------")
