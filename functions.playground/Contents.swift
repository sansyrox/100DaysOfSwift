import UIKit

func printHello() {
    
    
    let message = "Hello"
    print(message)
}

func square(number: Int){
    print(number*number)
}

func printHelloWorld( _ name: String){
    print(name)
}

printHello()

square(number: 4)

printHelloWorld("Sanskar")


func greet(_ person: String, nicely: Bool = true) {
    if nicely == true {
        print("Hello, \(person)!")
    } else {
        print("Oh no, it's \(person) again...")
    }
}


greet("Taylor")
greet("Taylor", nicely: false)



// Variadic Functions |V



func square(numbers: Int...) {
    
    for number in numbers {
        print("\(number) squared is \(number*number)")
    }
    
}


square(numbers: 1, 2, 3 , 4, 5, 6, 7, 8 )



// Throwing Functions |V


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
    try checkPassword("good")
    print("That password is good")
} catch {
    print("You can't use that password")
}


// Inout functions |V

func doubleInPlace(number: inout Int) {
    number *= 2
}

var myNum = 10
doubleInPlace(number: &myNum)
