//
//  main.swift
//  Bermain Kata
//
//  Created by Muhammad Rafi Aditya on 05/05/25.
//

import Foundation

print("Welcome to Dicoding Academy!")
print("Let`s Play some words!")
print("-----------------------------------")

// MARK: Get Input Data.
print("Enter your First Name: "); let firstName = String(readLine() ?? "")
print("Enter your Last Name: "); let lastName = String(readLine() ?? "")
print("-----------------------------------")
print("The Following are the operators used: ")

// MARK: Concatenation Operator.
let concatenationString = firstName + " " + lastName
print("1. String Cocncatenation Operator: \"\(concatenationString)\"")

// MARK: Mutability Operator.
var mutabilityString = ""
mutabilityString += firstName
mutabilityString += " "
mutabilityString += lastName
print("2. String Mutability Operator: \"\(mutabilityString)\"")

// MARK: Comparsion Operator.
var comparsionString = ""
if firstName == lastName{
    comparsionString = String(true)
} else {
    comparsionString = String(false)
}
print("3. String Comparsion Operator: \"\(comparsionString)\"")
print("-----------------------------------")
print("Here are the functions used: ")

// MARK: Combine First and Last Name.
let fullName = firstName + " " + lastName

// MARK: isEmpty Function.
let empty = firstName.isEmpty || lastName.isEmpty
print("1. isEmpty Function: \"\(empty)\"")

//MARK: StartIndex Function.
let startIndex = fullName[fullName.startIndex]
print("2. StartIndex Function: \"\(startIndex)\"")

// MARK: Index Function.
let index = fullName[fullName.index(after: fullName.startIndex)]
print("3. Index Function: \"\(index)\"")

// MARK: Other Indexing Functions.
let customIndex = fullName[fullName.index(fullName.startIndex, offsetBy: 9)]
print("4. Ninth Index: \"\(customIndex)\"")

// MARK: EndIndex Function.
let endIndex = fullName[fullName.index(before: fullName.endIndex)]
print("5. EndIndex Function: \"\(endIndex)\"")

// MARK: Insert Function.
var insert = fullName
insert.insert("!", at: insert.endIndex)
print("6. Insert Function: \"\(insert)\"")

// MARK: Remove Function.
var remove = insert
remove.remove(at: remove.index(before: remove.endIndex))
print("7. Remove Function: \"\(remove)\"")

// MARK: Append Function.
var append = firstName
append.append(lastName)
print("8. Append Function: \"\(append)\"")

// MARK: Count Function.
let count = fullName.count
print("9. Lenght Function: \"\(count)\"")
print("-----------------------------------")
