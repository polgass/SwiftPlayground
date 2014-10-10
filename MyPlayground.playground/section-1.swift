// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/**
* Variables and Constants
*/

var myInt:Int = 1 // mutable
myInt = 2
var myDouble:Double = 1.5
var myBool:Bool = true
var myString:String = "Paul"

var myView:UIView = UIView(frame: CGRectMake(0, 0, 300, 200))
myView.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)

var anInt = 1
var aDouble = 1.5
var aBool = true
var aString = "Paul"

let anotherVar = 1 // constant
//anotherVar = 1.3 // error


var anOptionalString:String
// println(anOptionalString) // error
// anOptionalString = nil // error

var myStringOptional:String?
//myStringOptional = "Yo!"
if let myStringDefinite = myStringOptional {
    println(myStringDefinite)
} else {
    println("Uninitialized variable")
}

// (Variable and Constants) Challenge!
let bill = 19.99
let tipPercentage = 0.20
let taxPercentage = 0.06

let tax = bill * taxPercentage
let tip = bill * tipPercentage
let total = bill + tax + tip

/**
* Strings
*/

let whazzup = "Whazzup"
let dawg = "Dawg"

var greeting = whazzup + ", " + dawg
greeting = greeting + "!"
//greeting += "!" // shortcut

let constantGreeting = "Welcome"
//constantGreeting += ", Greg" // error

var mutableGreeting = "Welcome"
mutableGreeting += ", Greg"


let kermit = "Kermit"
let msPiggy = "Ms. Piggy"

let love = msPiggy + " and " + kermit + ", sitting in a tree..."
let love2 = "\(msPiggy) and \(kermit) sitting in a tree..."

let fingers = "Kermit has \(5*2) fingers"

let kermit1 = "kermit"
let kermit2 = "kerm" + "it"
kermit1 == kermit2

let kermit3 = "keRmiT"
let kermit4 = "kermit"
kermit3.lowercaseString == kermit4.lowercaseString

var empty1 = ""
var empty2 = String()
empty1.isEmpty && empty2.isEmpty

let str1 = String(1)
let str2:String = NSString(format: "%.02f", 3.14)

let maybeInt = "1".toInt()
if let definiteInt = maybeInt {
    println(definiteInt)
} else {
    println("Not an int")
}

// Double conversion
var myDouble2 = Double(("3.14" as NSString).doubleValue)

// Contains string
var flappy = "Flappy Felipe"
(flappy as NSString).containsString("Felipe")

// SUbtring
var felipe = (flappy as NSString).substringWithRange(NSMakeRange(7, 6))

let englishMorning = "Good morning"
let japaneseMorning = "おはよう"

let valentines:Character = "💝"
let halloween:Character = "🎃"
let holidays:String = valentines + halloween

let π = 3.14
let 犬 = "🐶"

countElements(kermit)
countElements(holidays)

holidays.utf16
holidays.utf16Count

// (Strings) Challenge!
let emotion = "😍"
let name = "Ray"
let noun = "Swift"

let story = "When \(name) saw \(noun), he was like \(emotion)!"

/**
* Arrays
*/

// Inferred
let birdGames = ["Angry Birds", "Tiny Wings", "Flappy Bird"]

// Explicit (long form)
let birdGamesExplicit:Array<String> = birdGames

// Explicit (shorthand)
let birdGamesExplicit2:[String] = birdGames

// Empty array
let birdGamesEmpty:[String] = []


let firstGame = birdGames[0]
let lastGame = birdGames[birdGames.count - 1]
let tinyWings = birdGames[1]
birdGames.isEmpty
birdGamesEmpty.isEmpty

let flappyBirdIndex = find(birdGames, "Flappy Bird") // returns optional value
if let actualIndex = flappyBirdIndex {
    println("Found at \(actualIndex): \(birdGames[actualIndex])")
} else {
    println("Not found!")
}

let immutable = birdGames
//immutable.append("Flappy Felipe") // error!

var mutable = birdGames
mutable.append("Flappy Felipe")
println(mutable)

mutable.removeAtIndex(3)
//mutable
//mutable.removeLast()
//mutable
//mutable.removeAll(keepCapacity: false)
//mutable

mutable.insert("Angry Birds Rio", atIndex: 1)
mutable

mutable[0...1] = ["Angry Birds", "Angry Birds Epic", "Angry Birds Friends", "Angry Birds Go!", "Angry Birds Rio", "Angry Birds Seasons", "Angry Birds Space", "Angry Birds Star Wars", "Angry Birds Star Wars II"]
mutable[mutable.count - 1]

// sort
mutable.sort { a, b in a < b }

/**
* (Arrays) Challenge!
*/

var languages:[String] = ["C", "C++", "Objective-C"]
languages.append("Swift")
languages.insert("Javascript", atIndex: 2)

let optIndex = find(languages, "Objective-C")
if let defaultIndex = optIndex {
    languages.removeAtIndex(defaultIndex)
}
languages












