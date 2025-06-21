//
//  main.swift
//  Member Dicoding
//
//  Created by Muhammad Rafi Aditya on 19/05/25.
//

import Foundation

// MARK: Get Input From User.
func getInputString(message:String) -> String {
    print(message, terminator: ":")
    return readLine() ?? ""
}

// MARK: Get Input From The User With Integer Data Type.
func getInputInt(message:String) -> Int {
    return Int(getInputString(message: message)) ?? 0
}

// MARK: Protocol Person Protocol.
protocol personProtocol {
    var firstName: String {get set}
    var lastName: String {get set}
    var address: String {get set}
    func fullName() -> String
}

// MARK: Implement Person Protocol to Class Person.
class Person: personProtocol {
    var firstName: String
    var lastName: String
    var address: String
    init(firstName: String, lastName: String, address: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.address = address
    }
    func fullName() -> String {
        var parts: [String] = []
        parts += [firstName]
        parts += [lastName]
        return parts.joined(separator: "")
    }
}

// MARK: Protocol Student Protocol.
protocol StudentProtocol {
    var school:String {get set}
    func getInformation() -> String
}

// MARK: Implementing Student Protocol and Person to the Student Class.
class Student: Person, StudentProtocol {
    var school: String = ""
    
    func getInformation() -> String {
        return "Let Me Introduce Myself, My Name is \(fullName()), I go to Study at \(school).\nLet`s Learn Together!."
    }
}

print("Welcome to Dicoding Member App!")
print("---------------------------------------")

// MARK: Get Input From The User.
let firstName = getInputString(message: "Enter Your First Name")
let lastName = getInputString(message: "Enter Your Last Name")
let address = getInputString(message: "Enter Your Address")
let school = getInputString(message: "Enter Your College Name")

// MARK: Intialize Student Class.
let member = Student(firstName: firstName, lastName: lastName, address: address)
member.school = school
print("---------------------------------------")

// MARK: Get Student Information Detail.
print(member.getInformation())
print("---------------------------------------")
print("Thank You!")
