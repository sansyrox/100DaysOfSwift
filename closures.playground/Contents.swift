import UIKit

let driving = {
    print("I'm driving in my car going to ")
}

let drivingInMyCar = { (place: String) -> String in
    return "I'm driving in my car going to \(place)"
}

driving()

print(drivingInMyCar("Delhi"))


func travel(action: () -> Void){
    print("I'm getting ready to go.")
    action()
}

travel(action: driving)



// if the last function is a closure then pass it as a parameter

travel {
    print("I'm driving in my car")
}

// special closure syntax

func travel(action: (String) -> Void) {
    print("I'm getting ready to go.")
    action("London")
    print("I arrived!")
}


travel { (place: String) in
    print("I'm going to \(place) in my car")
}



// -------------------------------------------

func travel(action: (String) -> String) {
    print("\nI am getting ready to go.")
    let description = action("London")
    print(description)
    print("I arrived!")
}


travel {
    place in
    return "I'm going to \(place) in my car"
}
















let car = { (car: String) -> String in
    return ("\(car) Goes Vroooom")
}

car("Lambo")

func carDriver(action: () -> String) {
    print("\nI drive a car ")
    let a = action()
    print(a)
}

carDriver {
    car("Merc")
}




// ShortHand Param Names

func abc123(action: (String) -> String) {
    print("\nI'm getting ready to go.")
    let description = action("London")
    print(description)
    print("I arrived!")
}

// ShortHand Param Names
abc123 {
    "I travel to \($0)"
}



// Multiple Params

func travel(action: (String, Int) -> String) {
    print("I'm getting ready to go.")
    let description = action("London", 60)
    print(description)
    print("I arrived!")
}

travel {
    "I'm going to \($0) at \($1) miles per hour."
}




// returnning closures from functions

func bac() -> (String) -> Void {
    return {
        print("\nMy \($0) is name")
    }
}


let travelDes = bac()


travelDes("Hello")



// Storing numbers in closures

func travel() -> (String) -> Void {
    var counter = 1
    
    return {
        print("\(counter). I'm going to \($0)")
        counter += 1
    }
}


travel()("London")
travel()("London")
travel()("London")



// example

func getDirections(to destination: String, then travel: ([String]) -> Void) {
    let directions = [
        "Go straight ahead",
        "Turn left onto Station Road",
        "Turn right onto High Street",
        "You have arrived at \(destination)"
    ]
    travel(directions)
}
getDirections(to: "London") { (directions: [String]) in
    print("I'm getting my car.")
    for direction in directions {
        print(direction)
    }
}
