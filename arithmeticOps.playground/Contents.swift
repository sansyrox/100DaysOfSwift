import UIKit

var str = "Hello, playground"

let firstScore = 12
var secondScore = 4

secondScore = firstScore % secondScore


let firstHalf = ["John", "Paul"]
let secondHalf = ["George", "Ringo"]
let beatles = firstHalf + secondHalf

let fakers = "Fakers gonna "
let action = fakers + "fake"


var quote = "The rain in Spain falls mainly on the "
quote += "Spaniards"

quote += quote
print(quote)


"Taylor" <= "Swift" // these work with letter by letter comparisions


let age1 = 12
let age2 = 21

if age1 > 18 && age2 > 18 {
    print("Both are over 18")
}


let firstCard = 11
let secondCard = 10
print(firstCard == secondCard ? "Cards are the same" : "Cards are different")



let weather = "Sunny"

switch weather {
case "rain":
    print("Bring an Umbrella")
case "Snow":
    print("Snowy")
default:
    print("Enjoy your day")
}


// no need to add break statements in Switch case in Swift


let score = 85

switch score {
case 0..<50: // ..< is less than half open range operator
    print("You failed badly.")
case 50...85:  // ... is inclusive
    print("You did OK.")
default:
    print("You did great!")
}

