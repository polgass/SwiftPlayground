// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/**
* Part 1. Variables and Constants
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
* Part 2. Strings
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

let maybeInt = "1".toInt() // returns optional value
if let definiteInt = maybeInt {
    println(definiteInt)
} else {
    println("Not an int")
}

// Double conversion
var myDouble2 = Double(("3.14" as NSString).doubleValue)
var myDouble3 = ("3.14" as NSString).doubleValue;
myDouble2 == myDouble3

// Contains string
var flappy = "Flappy Felipe"
(flappy as NSString).containsString("Felipe")

// Subtring
var felipe = (flappy as NSString).substringWithRange(NSMakeRange(7, 6))

let englishMorning = "Good morning"
let japaneseMorning = "おはよう"

let valentines:Character = "💝"
let halloween:Character = "🎃"
let holidays = String(valentines) + String(halloween)

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
* Part 3. Arrays
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

/**
 * Part 4. Dictionaries
 */

// Inferred
let gameTypes = ["Fallout" : "RPG", "Hearthstone" : "Strategy Game", "Angry Birds" : "Bird Game"];

// Explicit (long form)
let gameTypesExplicit:Dictionary<String, String> = ["Fallout" : "RPG", "Hearthstone" : "Strategy Game", "Angry Birds" : "Bird Game"];

// Explicit (shorthand)
let gameTypesExplicit2:[String: String] = ["Fallout" : "RPG", "Hearthstone" : "Strategy Game", "Angry Birds" : "Bird Game"];

// Emplty Dictionary
let gameTypesEmpty = Dictionary<String, String>()

let game = "Hearthstone"
let optionalGameType = gameTypes[game]
if let definiteGameType = optionalGameType {
    println("\(game) is a \(definiteGameType)")
} else {
    println("Sorry, never heard of \(game)")
}
gameTypes.count

let immutableDictionary = gameTypes
//immutableDictionary["Super Mario Brothers"] = "Action Game" // error

var mutableDictionary = gameTypes
mutableDictionary["Super Mario Brothers"] = "Action Game" // insert
mutableDictionary["Angry Birds"] = "Overhyped Game"
mutableDictionary["Fallout"] = nil // delete
//mutableDictionary.removeValueForKey("Fallout"); // alternative
mutableDictionary

/**
* (Dictionaries) Challenge!
*/
var characters:[String: String] = ["Oberyn" : "Spear", "Arya" : "Sword", "Ygritte" : "Bow"]
characters["Tyrion"] = "Crossbow"
characters["Arya"] = characters["Arya"]! + " (Needle)"
characters
// remove dead characters
characters.removeValueForKey("Oberyn")
characters["Ygritte"] = nil
characters

/**
 * Part 5. Control flow
 */
// FOR loops
// exclusive
for i in 1..<10 {
    println("Exclusive: \(i)")
}

// inclusive
for i in 1...10 {
    println("Inclusive: \(i)")
}

// variation 1
let birdGames2 = ["Angry Birds", "Tiny Wings", "Flappy Bird"]
for i in 0..<birdGames2.count {
    let birdGame = birdGames2[i]
    println(birdGame)
}

// variation 2
for birdGame in birdGames2 {
    println(birdGame)
}

// variation 3
let gamesToTypes = ["Fallout" : "RPG", "Civilization" : "Strategy Game", "World of Warcraft" : "MMO"]
for (game, type) in gamesToTypes {
    println("\(game) is a \(type).")
}

// example
let holidays2:String = "💝🎃"
for holiday:Character in holidays2 {
    println(holiday)
}

// variation 4
for var i = 0; i < birdGames2.count; i++ {
    let birdGame = birdGames2[i]
    println(birdGame)
}

// WHILE AND DO WHILE loops
var multiplesOf3 = 3
while multiplesOf3 < 100 {
    println("\(multiplesOf3)")
    multiplesOf3 += 3
}

let lastRandom = 5
var random:Int
do {
    random = Int(arc4random()) % 10
} while(random == lastRandom)
random

let name2 = "Paul"
if countElements(name2) <= 3 {
    println("You have a short name.")
} else if countElements(name2) <= 6 {
    println("You have an average name.")
} else {
    println("You have a long name.")
}

// SWITCH
let teamMember = "BC"
switch (teamMember) {
    case "BC", "Chris B", "Wendy":
        println("Editor")
    case "Chris LP", "Alexis", "Ryan":
        println("Tech Editor")
    case "Greg", "Brian", "Vicki", "Ray":
        println("Razeware")
    default:
        println("Tutorial Team")
}

switch countElements(name2) {
    case 0...3:
        println("You have a short name.")
    case 4...6:
        println("You have an average name.")
    default:
        println("You have a long name.")
}

let bookNames:[NSString] = ["The Great Gatsby", "The Scarlet Letter", "Hunger Games", "Swift by Tutorials", "iOS 8 by Tutorials", "Core Data by Tutorials", "iOS Games by Tutorials"]
for bookName in bookNames {
    switch (bookName) {
        case "The Great Gatsby", "The Scarlet Letter":
            println("\(bookName) is a classic")
        case let x where x.containsString("by Tutorials"):
            println("\(bookName) is a tutorial book")
        default:
            println("\(bookName) is a fiction book")
    }
}

/**
 * (Control flow) Challenge!
 */
for i in 1...100 {
    let multipleOf3 = i % 3 == 0
    let multipleOf5 = i % 5 == 0
    if multipleOf3 && multipleOf5 {
        println("FizzBuzz")
    } else if multipleOf3 {
        println("Fizz")
    } else if multipleOf5 {
        println("Buzz")
    }
}

/**
 * Part 6. Functions
 */
func addNums(x: Int, y: Int) -> Int {
    return x + y;
}

addNums(1, 2)
addNums(3, 4)

// no parameters & return value
func noParams() -> () {
    println("Look hon, no params!")
}

noParams()

// shortcut
func noParams2() {
    println("Look hon, no params!")
}

noParams2()

// example
import CoreGraphics
func lerp(start: CGPoint, end: CGPoint, t: CGFloat) -> CGPoint {
    let range = CGPoint(x: end.x - start.x, y: end.y - start.y)
    return CGPoint(x: start.x + range.x * t, y: start.y + range.y * t)
}

lerp(CGPoint(x: 100, y: 100), CGPoint(x: 200, y: 200), 0.2);

// external parameter names
func lerp2(from start: CGPoint, to end: CGPoint, delta t: CGFloat) -> CGPoint {
    let range = CGPoint(x: end.x - start.x, y: end.y - start.y)
    return CGPoint(x: start.x + range.x * t, y: start.y + range.y * t)
}

lerp2(from: CGPoint(x: 100, y: 100), to: CGPoint(x: 200, y: 200), delta: 0.2);


// external parameter names 2
func lerp3(#start: CGPoint, #end: CGPoint, #t: CGFloat) -> CGPoint {
    let range = CGPoint(x: end.x - start.x, y: end.y - start.y)
    return CGPoint(x: start.x + range.x * t, y: start.y + range.y * t)
}

lerp3(start: CGPoint(x: 100, y: 100), end: CGPoint(x: 200, y: 200), t: 0.2);

// with default values
func calcTip(subtotal: Double, tipPct: Double = 0.18) -> Double {
    return subtotal * tipPct
}
calcTip(10.00)
calcTip(10.00, tipPct: 0.20)

// option 2
func calcTip2(amount subtotal: Double, tip tipPct: Double = 0.18) -> Double {
    return subtotal * tipPct
}
calcTip2(amount: 10.00)
calcTip2(amount: 10.00, tip: 0.20)

// option 3
func calcTip3(#subtotal: Double, tipPct: Double = 0.18) -> Double {
    return subtotal * tipPct
}
calcTip3(subtotal: 10.00)
calcTip3(subtotal: 10.00, tipPct: 0.20)

// VARIADIC PARAMETERS
func maxof(numbers: Int ...) -> Int? {
    if numbers.count == 0 {
        return nil
    }
    var max = numbers[0]
    for number in numbers {
        if number > max {
            max = number
        }
    }
    return max
}

let maybeMax = maxof(3, 1, 707, 5, 55, 8)
if let max = maybeMax {
    println("The max is \(max)")
} else {
    println("No max!")
}

// Constant, Variable, and Inout Parameters
func addEnthusiasm(string: String) {
//    string += "!" // error
}

func addEnthusiasm2(var string: String) {
    string += "!"
    println(string)
}

var myString2 = "Hello"
addEnthusiasm2(myString2)
myString2

func addEnthusiasm3(inout string: String) {
    string += "!"
    println(string)
}
addEnthusiasm3(&myString2)
myString2

/**
 * (Functions) Challenge!
 */
func sumOfMultiples(#mult1: Int, #mult2: Int, max: Int = 1000) -> Int {
    var sum = 0
    for i in 1...max {
        let multOfFirst = i % mult1 == 0
        let multOfSecond = i % mult2 == 0
        if multOfFirst || multOfSecond {
            sum += i
        }
    }
    return sum
}
sumOfMultiples(mult1: 3, mult2: 5)

/**
* Part 6. Classes
*/

class Entity {
    // Properties
    var inventory:[String] = []
//    var hp = 0
    var hp: Int
    
    // Initializers
    init(hp: Int) {
        self.hp = hp
    }
    
    // Methods
    func addItem(item: String, numItems: Int) {
        for i in 0..<numItems {
            self.inventory.append(item)
            // inventory.append(item) // same as above
        }
    }
    
    func removeItem(item: String) {
        let optionalIndex = find(self.inventory, item)
        if let index = optionalIndex {
            self.inventory.removeAtIndex(index)
            // inventory.removeAtIndex(index) // same as above
        }
    }
}

//let entity = Entity() // no initializer
let entity = Entity(hp: 5) // with initializer
entity.hp = 5
entity.addItem("Spinach", numItems: 3)
entity.addItem("Duck", numItems: 1)
entity.removeItem("Duck")
entity.inventory

// SUBCLASSING
class Popeye : Entity {
    
    let favoriteFood: String
    
    init() {
        favoriteFood = "Spinach"
        super.init(hp: 10)
    }
    
    func sing() {
        println("I'm Popeye the sailor man...")
    }
    
    override func addItem(item: String, numItems: Int) {
        if item == favoriteFood {
            hp += 10 * numItems
        } else {
            super.addItem(item, numItems: numItems)
        }
    }
}

/**
 * (Classes) Challenge!
 */
class Animal {
    
    // Properties
    let name: String
    
    // Initializer
    init(name: String) {
        self.name = name
    }
    
    // Methods
    func speak() {}
}

class Dog : Animal {
    
    init() {
        super.init(name: "Snow")
    }

    override func speak() {
        println("Woof!")
    }
}

class Cat : Animal {
    
    init() {
        super.init(name: "Kittie")
    }
    
    override func speak() {
        println("Meow!")
    }
}

class Fox : Animal {
    
    init() {
        super.init(name: "Foxy")
    }
    
    override func speak() {
        println("Ring-ding-ding-ding-dingeringeding!")
    }
}

let animals = [Dog(), Cat(), Fox()]
for animal in animals {
    animal.speak()
}

/**
 * Part 7. Tuples
 */

// umnnamed tuples
let tipAndTotal = (4.00, 25.19)
let tipAndTotalExplicit: (Double, Double) = (4.00, 25.19)

tipAndTotal.0
tipAndTotal.1

let (theTipAmt, theTotal) = tipAndTotal
theTipAmt
theTotal

// named tuples
let tipAndTotalNamed = (tipAmt: 4.00, total: 25.19)
tipAndTotalNamed.tipAmt
tipAndTotalNamed.total

let tipAndTotalNamedExplicit: (tipAmt: Double, total: Double) = (4.00, 25.19)

// example usage
let totl = 21.19
let taxPct = 0.06
let subtotal = totl / (taxPct + 1)

func calcTipWithTipPct(tipPct: Double) -> (tipAmt: Double, total: Double) {
    let tipAmt = subtotal * tipPct
    let finalTotal = totl + tipAmt
    return (tipAmt, finalTotal)
}

calcTipWithTipPct(2)

// another example
func wordOfTheDayAsTuple() -> (word: String, partsOfSpeech: String, definition: String) {
    return ("fudiciary", "adjective", "involving a confidence or trust")
}

let resultTuple = wordOfTheDayAsTuple()
resultTuple.definition

// tuples and switch statements
let error = (404, "Not Found")
switch error {
    case (200, _): // error code 200 and any description
        println("Success!")
    case (_, "Not Found"):
        println("Resource not available")
    case (300...399, _):
        println("Redirection")
    case (500, let description):
        println("\(description), please try again later.")
    case let (code, description):
        println("Unexpected error code \(code): \(description)")
}

// tuples and assignment
var name10 = "Ray"
var name20 = "Wenderlich"

(name10, name20) = ("Paul", "Sevilla")
(name10, name20) = (name20, name10)

/**
* (Tuples) Challenge!
*/
import Foundation

func randomIndex(count: Int) -> Int {
    return Int(arc4random_uniform(UInt32(count)))
}

func knockKnockJoke() -> (who: String, punchline: String) {
    let joke1 = (who: "Pedro", punchline: "Pedro fine ..whatever!")
    let joke2 = (who: "Penduko", punchline: "Pendukolot!")
    let joke3 = (who: "Polgass", punchline: "Polgassol")
    let jokes = [joke1, joke2, joke3]
    return jokes[randomIndex(jokes.count)]
}

let joke = knockKnockJoke()
println("Knock, knock.")
println("Who's there?")
println("\(joke.who)")
println("\(joke.who) who?")
println("\(joke.punchline)")


/**
* Part 8. Enums
*/

enum Suit {
    case Clubs, Diamonds, Hearts, Spades
}

var cardSuit1 = Suit.Clubs
var cardSuit2: Suit = .Diamonds

// enums and switch statements
switch cardSuit2 {
    case .Clubs:
        println("Clubs")
    case .Diamonds:
        println("Diamonds")
    case .Hearts:
        println("Hearts")
    case .Spades:
        println("Spades")
}

// ToRaw / FromRaw
enum Rank: Int {
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    
    func description() -> String {
        switch (self) {
            case .Ace:
                return "Ace"
            case .Jack:
                return "Jack"
            case .Queen:
                return "Queen"
            case .King:
                return "King"
            default:
                return String(self.rawValue)
        }
    }
}

let rank1 = Rank.Three
rank1.rawValue

let orank2 = Rank(rawValue: 11)
if let rank2 = orank2 {
    println(rank2.description())
} else {
    println("No such value")
}

let orank3 = Rank(rawValue: 99)
if let rank3 = orank3 {
    println(rank3.description())
} else {
    println("No such value")
}

// associated values
enum Rank2 {
    case Ace
    case Num(Int)
    case Jack, Queen, King
    func description() -> String {
        switch (self) {
            case .Ace:
                return "Ace"
            case .Jack:
                return "Jack"
            case .Queen:
                return "Queen"
            case .King:
                return "King"
            case .Num(let val):
                return String(val)
        }
    }
}

let rank4 = Rank2.Num(3)
println(rank4.description())

let rank5 = Rank2.Jack
println(rank5.description())

// default values
enum Rating: Int {
    case Terrible = 1
    case NotGreat
    case Average
    case Great
    case Epic
    
    init() {
        self = .Average
    }
}

let myRating = Rating()
myRating.rawValue

/**
* (Enum) Challenge!
*/

enum MicrosoftCEOs: Int {
    case BillGates = 1
    case SteveBallmer
    case SatyaNadella
    
    init() {
        self = .SatyaNadella
    }
    
    func description() -> String {
        switch (self) {
            case .BillGates:
              return "Bill Gates"
            case .SteveBallmer:
                return "Steve Ballmer"
            case .SatyaNadella:
                return "Satya Nadella"
        }
    }
}

let currentCEO = MicrosoftCEOs()
println(currentCEO.description())

let oFirstCEO = MicrosoftCEOs(rawValue: 1)
if let firstCEO = oFirstCEO {
    println(firstCEO.description())
} else {
    println("No such value")
}


