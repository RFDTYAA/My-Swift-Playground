//
//  main.swift
//  Menu Makanan
//
//  Created by Muhammad Rafi Aditya on 18/05/25.
//

import Foundation

// MARK: Get Input From The User.
func getInput(message: String) -> String? {
    print(message, terminator: ";")
    return readLine()
}

// MARK: Get Input From The User With Integer Data Type.
func getInputInt(message: String) -> Int? {
    if let inputString = getInput(message: message) {
        return Int(inputString)
        
    } else {
        return nil
    }
}

// MARK: Enumaration HeavyMeal.
enum HeavyMeal:Int, CaseIterable {
    case nasiGoreng = 1, mieInstan, magelangan, kwetiau, nasiPutih
}

// MARK: Enumeration Snacks.
enum SideDish:Int, CaseIterable {
    case fish = 1, chips, tofu, egg, tempe
}

// MARK: Enumeration Drinks.
enum Drinks:Int, CaseIterable {
    case mineralWater = 1, orangeIce, iceTea, coffee
}

// MARK: Display All Foods.
func showAllHeavyMeals() {
    var position = 1
    print("Heavy Meals")
    for heavyMeals in HeavyMeal.allCases {
        print("[\(position)]\(heavyMeals)")
        position += 1
    }
}

// MARK: Display All Snack.
func showAllSideDish() {
    var position = 1
    print("Side Dish")
    for sideDish in SideDish.allCases {
        print("[\(position)]\(sideDish)")
        position += 1
    }
}

// MARK: Display All Drinks.
func showAllDrinks() {
    var position = 1
    print("Drinks")
    for drink in Drinks.allCases {
        print("[\(position)]\(drink)")
        position += 1
    }
}

// MARK: Holds Information About Foods, Drinks, Snacks.
var total = 0
var item : (String, String, String) = ("","","")

// MARK: Enter Food.
func inputHeavyMeal() {
    if let position = getInputInt(message: "Choose Food") {
        if let heavyMeal = HeavyMeal(rawValue: position) {
            
            switch heavyMeal {
            
            case .mieInstan:
                total += 6000
                item.0 = "Mie Instan"
            
            case .kwetiau:
                total += 10000
                item.0 = "Kwitiau"
                
            case .magelangan:
                total += 7000
                item.0 = "Magelangan"
                
            case .nasiGoreng:
                total += 9000
                item.0 = "Nasi Goreng"
                
            case .nasiPutih:
                total += 3000
                item.0 = "Nasi Putih"
            }
        } else {
            print("Posisi \(position) tidak ditemukan.")
        }
    } else {
        print("Input Tidak Valid.")
    }
}

// MARK: Enter Snack.
func inputSideDish() {
    if let position = getInputInt(message: "Choose Snack") {
        if let sideDish = SideDish(rawValue: position) {
            
            switch sideDish {
            
            case .fish:
                total += 50000
                item.1 = "Fish"
            
            case .chips:
                total += 500
                item.1 = "Chips"
                
            case .tofu:
                total += 1000
                item.1 = "Tofu"
                
            case .egg:
                total += 3000
                item.1 = "Egg"
                
            case .tempe:
                total += 1000
                item.1 = "Fried Bean"
            }
        } else {
            print("Posisi \(position) tidak ditemukan.")
        }
    } else {
        print("Input Tidak Valid.")
    }
}

// MARK: Enter Drinks.
func inputDrinks() {
    if let position = getInputInt(message: "Choose Drink") {
        if let drinks = Drinks(rawValue: position) {
            
            switch drinks {
            
            case .mineralWater:
                total += 0
                item.2 = "Mineral Water"
            
            case .orangeIce:
                total += 2500
                item.2 = "Orange Ice"
                
            case .iceTea:
                total += 2000
                item.2 = "Ice Tea"
                
            case .coffee:
                total += 3000
                item.2 = "Coffee"
            }
        } else {
            print("Posisi \(position) tidak ditemukan.")
        }
    } else {
        print("Input Tidak Valid.")
    }
}

// MARK: Display The Menu.
func menu() {
    print("Welcome to Dicoding`s Restaurant")
    print("----------------------------------------------")
    showAllHeavyMeals()
    inputHeavyMeal()
    print("----------------------------------------------")
    showAllSideDish()
    inputSideDish()
    print("----------------------------------------------")
    showAllDrinks()
    inputDrinks()
    print("----------------------------------------------")
    print("You Choose \(item.0),\(item.1),And \(item.2) with a total price of RP. \(total).")
    print("----------------------------------------------")
    print("Thank You!, See You Next Time!.")
}

// MARK: Calling the Menu Function.
menu()
