import UIKit

struct Sport {
    var name : String
    var isOlympicSport: Bool
    
    
    // computed properties
    //  Constant properties cannot be computed properties.
    var olympicStatus: String {
        if isOlympicSport {
            return "\(name) is an Olympic sport"
        } else {
            return "\(name) is not an Olympic sport"
        }
    }
}

let chessBoxing = Sport(name: "Chessboxing", isOlympicSport: false)
print(chessBoxing.olympicStatus)


// Property Observers , also willSet : before the change is observed can be used but that is rarely used
struct Progress {
    var task: String
    var amount: Int {
        didSet {
            print("\(task) is now \(amount)% complete")
        }
    }
}


var progress = Progress(task: "Loading data", amount: 0)
progress.amount = 30
progress.amount = 80
progress.amount = 100



struct City {
    var population: Int
    
    func collectTaxes() -> Int {
        return population * 1000
    }
}


let london = City(population: 9_000_000)
london.collectTaxes()


// if a struct has a variable property and that instance is constant, swift won't allow you to change the property , and hence the mutating keyword is used

struct Person {
    var name: String
    
    mutating func makeAnonymous() {
        name = "Anonymous"
    }
}


//Because it changes the property, Swift will only allow that method to be called on Person instances that are variables:


var person = Person(name: "Ed")
person.makeAnonymous()



// String and arrays are also structs

let string = "Do or do not, there is no try."
print(string.count)
print(string.hasPrefix("Do"))
print(string.hasSuffix("."))
print(string.sorted())



var toys = ["Woody"]
print(toys.count)
toys.append("Buzz")
toys.firstIndex(of: "Buzz")
print(toys.sorted())
toys.remove(at: 0)
