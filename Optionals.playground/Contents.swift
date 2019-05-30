import UIKit

var age: Int? = nil

age = 38

var name: String? = nil


if let unwrapped = name {
    print("\(unwrapped.count) is here")
} else {
    print("Missing Name")
}

func greet(_ name: String?) {
    guard let unwrapped = name else {
        print("You didn't provide a name")
        return
    }
    
    print("Hello, \(unwrapped)")
}

let str = "5"
let num = Int(str)!

let age2: Int! = nil

func username(for id: Int) -> String? {
    if id == 1 {
        return "Taylor Swift"
    } else {
        return nil
    }
}

let user = username(for: 15) ?? "Anonymous"



// optional chaining, if no first item , then will ste the name to null immediately
let names = ["John", "Paul", "George", "Ringo"]

let beatle = names.first?.uppercased()

enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }
    
    return true
}

do {
    try checkPassword("password")
    print("That password is good!")
} catch {
    print("You can't use that password.")
}

if let result = try? checkPassword("password") {
    print("Result was \(result)")
} else {
    print("D'oh.")
}

let resul1 = try! checkPassword("sekrity")


// failable intializers

let str1 = "5"
let num1 = Int(str1)


struct Person {
    var id: String
    
    init?(id: String) {
        if id.count == 9 {
            self.id = id
        } else {
            return nil
        }
    }
}



// funy type inference

class Animal { }
class Fish: Animal { }

class Dog: Animal {
    func makeNoise() {
        print("Woof!")
    }
}

let pets = [Fish(), Dog(), Fish(), Dog()]

for pet in pets {
    if let dog = pet as? Dog {
        dog.makeNoise()
    }
}
