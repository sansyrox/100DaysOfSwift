import UIKit

var evenNumbers = [2,4,6,8]

var song: [Any] = ["Shake it off", "You belong to me", "Back to you", "December", 3]

type(of: song)



// in switch case
//Instead, you use the fallthrough keyword to make one case fall into the next – it's effectively the opposite.


// optionals

func getHaterStatus(weather: String) -> String? {
    if weather == "sunny" {
        return nil
    } else {
        return "Hate"
    }
}


var status = getHaterStatus(weather: "rainy")

if let unwrappedStatus = status {
    
} else {
    
}

func takeHaterAction(sttatus: String){
    if(sttatus=="Hate"){
        print("Hating")
    }
}


if let haterStatus = getHaterStatus(weather: "rainy") {
    takeHaterAction(sttatus: haterStatus)
}


//let album = albumReleased(year: 2006)?.someOptionalValue?.someOtherOptionalValue?.whatever

//let album = albumReleased(year: 2006) ?? "unknown"
//print("The album is \(album)")






enum WeatherType {
    case sun
    case cloud
    case rain
    case wind
    case snow
}

func getHaterStatus(weather: WeatherType) -> String? {
    if weather == .sun {
        return nil
    } else {
        return "Hate"
    }
}

getHaterStatus(weather: .cloud)



struct Person {
    var clothes: String {
        willSet {
            updateUI(msg: "I'm changing from \(clothes) to \(newValue)")
        }
        
        didSet {
            updateUI(msg: "I just changed from \(oldValue) to \(clothes)")
        }
    }
    
    
    var age: Int
    
    // computed props
    var ageInDogYears: Int {
        get {
            return age*7
        }
    }
}

func updateUI(msg: String) {
    print(msg)
}

var taylor = Person(clothes: "T-shirts", age: 23)
taylor.clothes = "short skirts"
taylor.ageInDogYears


//Swift calls these shared properties "static properties", and you create one just by using the static keyword. Once that's done, you access the property by using the full name of the type. Here's a simple example:
//


struct TaylorFan {
    static var favoriteSong = "Look What You Made Me Do"
    
    var name: String
    var age: Int
}

let fan = TaylorFan(name: "James", age: 25)
print(TaylorFan.favoriteSong)


class TaylorFan12 {
    private var name: String?
}


