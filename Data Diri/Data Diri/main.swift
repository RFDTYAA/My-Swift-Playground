//
//  main.swift
//  Data Diri
//
//  Created by Muhammad Rafi Aditya on 02/05/25.
//

/*
// Tugas Pertama
import Foundation

// MARK: Membuat form data diri.
print("Welcome to Dicoding Academy")

let firstName = "Muhammad", lastName = "Rafi Aditya"
let fullName = firstName + " " + lastName
let address = "West Jakarta"
let job = "IOS Developer "
let age = 21

print("-----------------------------------")

// MARK: Mencetak program yang anda buat ke dalam Terminal
print("Do You Know \(fullName)?")
print("\(lastName) Is A \(job).")
print("Curently he is \(age) Years old, and lives in \(address).")

print("-----------------------------------")
*/

// Tugas Kedua
import Foundation

// MARK: Create a Personal Data Form.
print("Welcome To Dicoding Academy")
print("-----------------------------------")

// MARK: Enter values from the User.
print("Enter your First Name: "); let firstName = readLine()!
print("Enter Your Last Name: "); let lastName = readLine()!
print("Enter Your Age: "); let age = readLine()!
print("Enter Your Address: "); let address = readLine()!
print("Enter Your Job: "); let job = readLine()!

// MARK: Combine First Name and Last Name.
let fullName = firstName + " " + lastName

print("-----------------------------------")

// MARK: Print the program you created into the Terminal.
print("Do You Know \(fullName)?")
print("\(lastName) is a \(job).")
print("He is currently \(age) and Lives at \(address).")

print("-----------------------------------")
