//: Playground - noun: a place where people can play

import UIKit

var str = "Hello"

var newString = str + " Wilmer!"

for character in newString.characters {
    
    print(character)
    
}

let hoursInADay :Int = 24

var shoppingArray: [String] = ["bananas","apples","grapes"]
shoppingArray.append("mango")

var menu: [String] = ["pizza", "spaghetti", "lasagne"]

var animalArray: [String] = ["Dog", "Cat", "Fish", "Owl" ]
animalArray.reverse()

var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

var myDictionary = ["Mogwai": "Glasgow", "Explosions In The Sky": "Austin", "Oceansize": "Manchester"]


let primeNumbers = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31]

for number in primeNumbers {
        print("\(number)")
}


let newTString = NSString(string: newString)

newTString.substring(to: 5)
newTString.substring(from: 4)

NSString(string: newTString.substring(from: 6)).substring(to: 6)

newTString.substring(with: NSRange(location: 6, length: 6))

if newTString.contains("Wilmer") {
    print("newTString contains Wilmer")
}


newTString.components(separatedBy: " ")

newTString.uppercased
newTString.lowercased


func myFunction (n: Int) -> Bool {
    if n <= 1 {
        return false
    }
    if n <= 3 {
        return true
    }
    var i = 2
    while i*i <= n {
        if n % i == 0 {
            return false
        }
        i = i + 1
    }
    return true
}

myFunction(n: 2)

func myFunction2 (numberOfHours:Double, rate: Double) -> Double {
    let totalAmount = numberOfHours * rate
    return totalAmount
}

myFunction2(numberOfHours: 42, rate: 8.4)
