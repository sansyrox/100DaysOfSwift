import UIKit

class Dog {
    var name: String
    var breed: String
    
    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
    
    func makeNoise(){
        print("Woof!")
    }
}

// final lagane se no inheritance further
final class Havanese: Dog {
    init(name: String) {
        super.init(name: name, breed: "Havanese")
    }
    
    override func makeNoise() {
        print("Yip!")
    }
    
    deinit {
        print("byeee")
    }
}

let poppy = Dog(name: "Casper", breed: "Havanese")

poppy.makeNoise()


class Singer {
    var name = "Taylor Swift"
}

var singer = Singer()
print(singer.name)

var newSinger = singer
singer.name = "Eddy"

print(singer.name)


// in classes , the copy and original point to the same location and in structs they have different memory locations
// i.e. changing in copy of structs won't change in original


//However, if you have a constant class with a variable property, that property can be changed. Because of this, classes don’t need the mutating keyword with methods that change properties; that’s only needed with structs.

//This difference means you can change any variable property on a class even when the class is created as a constant

//If you want to stop that from happening you need to make the property constant:


//class Singer {
//    let name = "Taylor Swift"
//}
