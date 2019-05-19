import UIKit

// Cannot loop over a tuple using for in statement


let count = 1...10

for number in count {
    print("Number is \(number)")
}

let albums = ["Red", "1989", "Reputation"]

for album in albums {
    print("\(album) is on Apple Music")
}

var number = 1

while number <= 20 {
    print(number)
    number += 1
}

print("Ready or not, here I come!")

var countDown = 10
while countDown >= 0 {
    print(countDown)
    
    if countDown == 4 {
        print("I'm bored. Let's go now!")
        break
    }
    
    countDown -= 1
}


// do while alternative |V

repeat {
    print("This is false")
} while false


// exiting multiple loops

outerLoop: for i in 1...10 {
    for j in 1...10 {
        let product = i * j
        print ("\(i) * \(j) is \(product)")
        
        if product == 50 {
            print("It's a bullseye!")
            break outerLoop
        }
    }
}

//skiiping items
for i in 1...10 {
    if i % 2 == 1 {
        continue
    }
    
    print(i)
}


// i+=2

for i in 0...100 where i%2==0 {
    print(i)
}
