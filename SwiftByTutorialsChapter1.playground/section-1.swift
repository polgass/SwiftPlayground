import Foundation // Objective-C bridging
//var greeting: String = "Hello"
//var greeting = "Hello" // type inference
//let greeting = "Hello"

//greeting = "Bonjour" // works if 'var'
//greeting = 23 // error, the compiler knows variable is String type

//greeting = greeting + " World"
//greeting += " World" // same as above
//greeting.append(Character("!"))
var greeting = "hello world".capitalizedString // NSString API (Foundation framework)
greeting = greeting.stringByAppendingString("!") // NSString API
println(greeting)

// String is a "value" type (value is copied)
var alternateGreeting = greeting
alternateGreeting += " and beyond!"
println(alternateGreeting)
println(greeting) // original value unaffected

// SEMICOLONS
// semicolons still work, note that Swift requires semicolons if you want to write multiple statements on a single line
import Foundation; var greetng = "hello world".capitalizedString; println(greetng);


// NUMERIC TYPES AND CONVERSION
var radius = 4 // Int
let pi = 3.14159 // Double

let million = 1_000_000 // underscore to delimit thousands

//var area = radius * radius * pi // error, must be explicit for numeric conversions (safety feature)
var area = Double(radius) * Double(radius) * pi // convert Int to Double (each var must be of the same type)

//var overflow = Int.max + 1 // bounds error (safety feature)

// BOOLEANS
let alwaysTrue = true

// TUPLES
var address = (747, "Evergreen Terrace")
println(address.0)
println(address.1)
address.0 = 744

var addrss: (Int, String) = (742, "Evergreen Terrace")
var addrss1: (Double, String) = (742, "Evergreen Terrace") // using a type annotation
var addrss2 = (Double(742), "Evergreen Terrace") // explicit creation of double
var addrss3 = (742.0, "Evergreen Terrace") // using a double literal value

// deconstruct to individual elements
var addres = (742, "Evergreen Terrace")
let (house, street) = addres
println(house)
println(street)

// named tuples
var adress = (number: 742, street: "Evergreen Terrace")
println(adress.number)
println(adress.street)


// String interpolation
var adres = (742, "Evergreen Terrace")
let (hse, strt) = adres
println("I live at " + String(hse) + ", " + strt)
println("I live at \(hse), \(strt)") // string interpolation

var address2 = (742, "Evergreen Terrace")
let (house2, street2) = address2
let str = "I live at \(house2 + 10), \(street2.uppercaseString)"
println(str)

// CONTROL FLOW
let greeting2 = "Swift by Tutorials Rocks!"

for i in 1...5 {
    println("\(i) - \(greeting2)")
//    i=i+100 // error
}

//var range = 1...5
var range = Range(start: 1, end: 6)
for i in range {
    println("\(i) - \(greeting2)")
}

for i in "Swift" {
    println(i)
}

// note: types that implements Sequence protocol (like Range and String) are enumerable!


// WHILE LOOPS
let greeting3 = "Swift by Tutorial Rocks!"

var i = 0
while i < 5 {
    println("\(i) - \(greeting3)")
    i++
}

var j = 0
do {
    println("\(j) - \(greeting3)")
    j++
} while j < 5


// IF STATEMENTS

import Foundation

let greeting4 = "Swift by Tutorials Rocks!"

for i in 1...5 {
    if i == 5 { // condition must ONLY be of type Bool
        println(greeting4.uppercaseString)
    } else {
        println(greeting4)
    }
}

// below code does not work anymore, Swift requires all if statements to be enclosed in {}
//for i in 1...5 {
//    if i == 5
//        println(greeting4.uppercaseString)
//    else
//        println(greeting4)
//}


// SWITCH STATEMENTS

var direction = "left"

switch direction {
    case "down":
        println("Going Down!")
    case "up":
        println("Going Up!")
    case "left", "right": // match from multiple values
        println("Going Sonewhere!")
    default:
        println("Going Nowhere")
}

// match range
var score = 570

//var prefix: String
switch score {
    case 1..<10:
        println("novice")
    case 10..<100:
        println("proficient")
    case 100..<1000:
        println("rock-star")
    default:
        println("awesome")
}
