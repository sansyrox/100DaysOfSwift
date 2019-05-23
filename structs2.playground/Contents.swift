import UIKit

struct User {
    var username: String
    
    init() {
        username = "Anonymous"
        print("Creating a new User")
    }
}

var user = User()
user.username = "Sanskar"

struct FamilyTree {
    init() {
        print("Creating fgamily tree!")
    }
}

struct Person {
    var name: String
    
    
    // lazy is being used to save memory and will be created when the first time this property is called
    lazy var familyTree = FamilyTree()
    
    init(name: String) {
        print("\(name) was born!")
        self.name = name
    }
}

var ed = Person(name: "Ed")


//You can also ask Swift to share specific properties and methods across all instances of the struct by declaring them as static.

struct Student {
    static var classSize = 0
    var name: String
    
    init(name: String) {
        self.name = name
        Student.classSize += 1
    }
}

let edWard = Student(name: "Ed")
let taylor = Student(name: "Taylor")




// private functions aka Access Control
struct Caller {
    private var id: String
    
    init(id: String) {
        self.id = id
    }
    
    func identify() -> String {
        return "My social security number is \(id)"
    }
}
