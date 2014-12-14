// Protocols

protocol SomeTestProtocol {
  // protocol definition goes here
}

protocol FirstProtocol {}
protocol AnotherProtocol {}

class SomeSuperClass {}

struct SomeStructure: FirstProtocol, AnotherProtocol {
  // structure definition goes here
}

class SomeClass: SomeSuperClass, FirstProtocol, AnotherProtocol {
  // class definition goes here
}


// Property Requirements
// * var properties only
// { get set }
// { get }
// doesn’t specify whether the property should be a stored property or a computed property

protocol SomeProtocol {
  var mustBeSettable: Int { get set }
  var doesNotNeedToBeSettable: Int { get }
}

// for type properties
// * always prefix with 'class' keyword, even though implemented in struct or enum as 'static'

protocol JustAnotherProtocol {
  class var someTypeProperty: Int { get set } // notice 'class' keyword
}

// protocol examples with property requirements

protocol FullyNamed {
  var fullName: String { get } // required
}

struct Person: FullyNamed {
  var fullName: String
}

let john = Person(fullName: "John Appleseed")
john.fullName


class Starship: FullyNamed {
  var prefix: String?
  var name: String
  init(name: String, prefix: String? = nil) {
    self.name = name
    self.prefix = prefix
  }
  var fullName: String {
    return (prefix != nil ? prefix! + " " : "") + name
  }
}

var ncc1701 = Starship(name: "Enterprise", prefix: "USS")
ncc1701.fullName


// Method Requirements
// * same way as for normal instance and type methods, but without method body
// * variadic parameters are allowed
// * default values for parameters are not allowed


// for type methods
// * always prefix with 'class' keyword, even though implemented in struct or enum as 'static'

protocol JustSomeProtocol {
  class func someTypeMethod()
}


// protocol examples with method requirements

protocol RandomNumberGenerator {
  func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
  var lastRandom = 42.0
  let m = 139968.0
  let a = 3877.0
  let c = 29573.0
  func random() -> Double {
    lastRandom = ((lastRandom * a + c) % m)
    return lastRandom / m
  }
}
let generator = LinearCongruentialGenerator()
println("Here's a random number: \(generator.random())")
println("And another one: \(generator.random())")


// Mutating Method Requirements
// * for structs and enums
// * 'mutating' keyword
// * no need to prefix 'mutating' to implementing method

protocol Togglable {
  mutating func toggle()
}

enum OnOffSwitch: Togglable {
  case Off, On
  mutating func toggle() {
    switch self {
    case Off:
      self = On
    case On:
      self = Off
    }
  }
}

var lightSwitch = OnOffSwitch.Off
lightSwitch.toggle()


// Initializer Requirements

protocol SomeProtocolAgain {
  init(someParameter: Int)
}


// Class Implementations of Protocol Initializer Requirements
// * must prefix with 'required' keyword, except on 'final' classes

class SomeClassAgain: SomeProtocolAgain {
  required init(someParameter: Int) {
    // initializer implementation goes here
  }
}

// another example
protocol SomeProtocolToo {
  init()
}

class SomeSuperClassToo {
  init() {
    // initializer implementation goes here
  }
}

class SomeSubClassToo: SomeSuperClassToo, SomeProtocolToo {
  // "required" from SomeProtocolToo conformance; "override" from SomeSuperClassToo
  required override init() {
    // initializer implementation goes here
  }
}


// Failable Initializer Requirements
// * A failable initializer requirement can be satisfied by a failable or nonfailable initializer on a conforming type. A nonfailable initializer requirement can be satisfied by a nonfailable initializer or an implicitly unwrapped failable initializer.


// Protocols as Types

class Dice {
  let sides: Int
  let generator: RandomNumberGenerator
  init(sides: Int, generator: RandomNumberGenerator) {
    self.sides = sides
    self.generator = generator
  }
  func roll() -> Int {
    return Int(generator.random() * Double(sides)) + 1
  }
}

var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())
for _ in 1...5 {
  println("Random dice roll is \(d6.roll())")
}


// Delegation

protocol DiceGame {
  var dice: Dice { get }
  func play()
}
protocol DiceGameDelegate {
  func gameDidStart(game: DiceGame)
  func game(game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int)
  func gameDidEnd(game: DiceGame)
}

class SnakesAndLadders: DiceGame {
  let finalSquare = 25
  let dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
  var square = 0
  var board: [Int]
  init() {
    board = [Int](count: finalSquare + 1, repeatedValue: 0)
    board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
    board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
  }
  var delegate: DiceGameDelegate?
  func play() {
    square = 0
    delegate?.gameDidStart(self)
    gameLoop: while square != finalSquare {
      let diceRoll = dice.roll()
      delegate?.game(self, didStartNewTurnWithDiceRoll: diceRoll)
      switch square + diceRoll {
      case finalSquare:
        break gameLoop
      case let newSquare where newSquare > finalSquare:
        continue gameLoop
      default:
        square += diceRoll
        square += board[square]
      }
    }
    delegate?.gameDidEnd(self)
  }
}

class DiceGameTracker: DiceGameDelegate {
  var numberOfTurns = 0
  func gameDidStart(game: DiceGame) {
    numberOfTurns = 0
    if game is SnakesAndLadders {
      println("Started a new game of Snakes and Ladders")
    }
    println("The game is using a \(game.dice.sides)-sided dice")
  }
  func game(game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int) {
    ++numberOfTurns
    println("Rolled a \(diceRoll)")
  }
  func gameDidEnd(game: DiceGame) {
    println("The game lasted for \(numberOfTurns) turns")
  }
}

let tracker = DiceGameTracker()
let game = SnakesAndLadders()
game.delegate = tracker
game.play()


// Adding Protocol Conformance with an Extension

protocol TextRepresentable {
  func asText() -> String
}

extension Dice: TextRepresentable {
  func asText() -> String {
    return "A \(sides)-sided dice"
  }
}

let d12 = Dice(sides: 12, generator: LinearCongruentialGenerator())
println(d12.asText())

extension SnakesAndLadders: TextRepresentable {
  func asText() -> String {
    return "A game of Snakes and Ladders with \(finalSquare) squares"
  }
}

println(game.asText())


// Declaring Protocol Adoption with an Extension

struct Hamster {
  var name: String
  func asText() -> String { // already conforms to TextRepresentable's reqmts
    return "A hamster named \(name)"
  }
}

extension Hamster: TextRepresentable {}

let simonTheHamster = Hamster(name: "Simon")
let somethingTextRepresentable: TextRepresentable = simonTheHamster
println(somethingTextRepresentable.asText())


// Collections of Protocol Types

let things: [TextRepresentable] = [game, d12, simonTheHamster]

for thing in things {
  println(thing.asText())
}


// Protocol Inheritance

protocol InheritingProtocol: SomeProtocol, AnotherProtocol {
  // protocol definition goes here
}

protocol PrettyTextRepresentable: TextRepresentable {
  func asPrettyText() -> String
}

extension SnakesAndLadders: PrettyTextRepresentable {
  func asPrettyText() -> String {
    var output = asText() + ":\n" // asText() is inherited
    for index in 1...finalSquare {
      switch board[index] {
      case let ladder where ladder > 0:
        output += "▲ "
      case let snake where snake < 0:
        output += "▼ "
      default:
        output += "○ "
      }
    }
    return output
  }
}

println(game.asPrettyText())


// Class-Only Protocols
// * can only be adopted by class types

protocol SomeInheritedProtocol {}

protocol SomeClassOnlyProtocol: class, SomeInheritedProtocol {
  // class-only protocol definition goes here
}


// Protocol Composition
// * protocol<SomeProtocol, AnotherProtocol>

protocol Named {
  var name: String { get }
}
protocol Aged {
  var age: Int { get }
}
struct APerson: Named, Aged {
  var name: String
  var age: Int
}

func wishHappyBirthday(celebrator: protocol<Named, Aged>) {
  println("Happy birthday \(celebrator.name) - you're \(celebrator.age)!")
}

let birthdayPerson = APerson(name: "Malcom", age: 21)
wishHappyBirthday(birthdayPerson)


// Checking for Protocol Conformance
// * you can check for protocol conformance only if your protocol is marked with the @objc attribute, even if you are not interoperating with Objective-C
// * for classes only

import Foundation

@objc protocol HasArea {
  var area: Double { get }
}

class Circle: HasArea {
  let pi = 3.1415927
  var radius: Double
  var area: Double { return pi * radius * radius }
  init(radius: Double) { self.radius = radius }
}
class Country: HasArea {
  var area: Double
  init(area: Double) { self.area = area }
}

// does not conform:
class Animal {
  var legs: Int
  init(legs: Int) { self.legs = legs }
}

let objects: [AnyObject] = [
  Circle(radius: 2.0),
  Country(area: 243_610),
  Animal(legs: 4)
]

for object in objects {
  if let objectWithArea = object as? HasArea {
    println("Area is \(objectWithArea.area)")
  } else {
    println("Something that doesn't have an area")
  }
}


// Optional Protocol Requirements
// * 'optional' prefix
// * requires @objc attribute (same as above)
// * for classes only

@objc protocol CounterDataSource {
  optional func incrementForCount(count: Int) -> Int
  optional var fixedIncrement: Int { get }
}

@objc class Counter {
  var count = 0
  var dataSource: CounterDataSource?
  func increment() {
    if let amount = dataSource?.incrementForCount?(count) {
      count += amount
    } else if let amount = dataSource?.fixedIncrement? {
      count += amount
    }
  }
}

class ThreeSource: CounterDataSource {
  let fixedIncrement = 3
}

var counter = Counter()
counter.dataSource = ThreeSource()
for _ in 1...4 {
  counter.increment()
  println(counter.count)
}

class TowardsZeroSource: CounterDataSource {
  func incrementForCount(count: Int) -> Int {
    if count == 0 {
      return 0
    } else if count < 0 {
      return 1
    } else {
      return -1
    }
  }
}

counter.count = -4
counter.dataSource = TowardsZeroSource()
for _ in 1...5 {
  counter.increment()
  println(counter.count)
}














