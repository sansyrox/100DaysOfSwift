import UIKit

//Protocols are a way of describing what properties and methods something must have. You then tell Swift which types use that protocol – a process known as adopting or conforming to a protocol.
//
//For example, we can write a function that accepts something with an id property, but we don’t care precisely what type of data is used. We’ll start by creating an Identifiable protocol, which will require all conforming types to have an id string that can be read (“get”) or written (“set”):
// It's not possible to create set-only properties in Swift.


protocol Identifiable {
    var id: String {get set}
}


struct User: Identifiable {
    var id: String
}


func displayId(name: Identifiable) {
    print("My id is \(name.id)")
}

// hybrid inheritance not a thing


protocol Payable {
    func calculateWages() -> Int
}

protocol NeedsTraining {
    func study()
}

protocol HasVacation {
    func takeVacation(days: Int)
}


protocol Employee: Payable, NeedsTraining, HasVacation { }


//Extensions allow you to add methods to exisiting types to make them do things that they are not designed to do


extension Int {
    func squared() -> Int {
        return self * self
    }
}

let number = 8
number.squared()


extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
}


let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]
let beatles = Set(["John", "Paul", "George", "Ringo"])


//Swift’s arrays and sets both conform to a protocol called Collection, so we can write an extension to that protocol to add a summarize() method to print the collection neatly



extension Collection {
    func summarize() {
        print("There are \(count) of us:")
        
        for name in self {
            print(name)
        }
    }
}


pythons.summarize()
beatles.summarize()



protocol Idm {
    var id: String {get set}
    func identify()
}

extension Idm {
    func identify() {
        print("My id is \(id)")
    }
}


struct Use: Idm {
    var id: String
}


let twostraws = Use(id: "twostraws")
twostraws.identify()
