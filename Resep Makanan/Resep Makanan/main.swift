//
//  main.swift
//  Resep Makanan
//
//  Created by Muhammad Rafi Aditya on 10/05/25.
//

import Foundation

print("Welcome to Dicoding Resto!")
print("Let`s Make some Food")

// MARK: Enter the recipe and the number of items in the recipe.
print("---------------------------------")
print("What do you Want to Make?"); let food = readLine() ?? ""
print("Enter the number of items you want to enter", terminator: ": "); let newItem = readLine() ?? "0"
print("---------------------------------")

// MARK: Convert the number of items to enter.
if let totalItem:Int = Int(newItem) {
    var recipe = [String]()
    
    // MARK: Enter items into the Recipes.
    for index in 1...totalItem{
        print("Enter Items Into \(index)", terminator: ":"); let newItem = String(readLine() ?? "")
        recipe.append(newItem)
    }
    
    // MARK: Enter the time needed to make the recipe.
    print("---------------------------------")
    print("How long does the cooking process take?"); let time = readLine() ?? ""
    print("---------------------------------")
    
    // MARK: Sort the Recipe Items.
    recipe.sort()
    
    // MARK: Display the Recipe result.
    print("You will make \(food) for \(time) with the recipe.")
    for (index, value) in recipe.enumerated() {
        print("\(index + 1).\(value)")
        
    }
}else{
    
    // MARK: Display an error when the input is invalid.
    print("Invalid Input!")
    }
print("---------------------------------")



