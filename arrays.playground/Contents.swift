import UIKit

let color = Set(["red","green", "blue","blue"])
let color1 = Set([4,1,2,3,3,12,1,1,])

for i in color1 {
    print(i)
}

// set is unoredered in swift



// tupples fixed in size and diff types arrays
var name = (first: "Taylor", age: 0)
name.0
name.first
name.age


// dictionaries
let heights = [
    "Taylor Swift": 1.78,
    "Ed Sheeran": 1.74,
    
];
print(heights)
heights["Ed Sheeran"]

var x = heights["Tommy", default: 1.21]


var words = Set<String>()
var score = [String:Int]()
var scores = Dictionary<String,Int>()

// swift has a special syntax for arrays and hashmaps



enum Activity {
    case bored
    case running(destination: String)
    case talking(topic: String)
    case singing(volume: Int)
}

var y = Activity.running(destination: "Home")
print(y)


enum Planet: Int {
    case mercury = 1
    case venus
    case earth
    case mars
}

let earth = Planet(rawValue: 2)
