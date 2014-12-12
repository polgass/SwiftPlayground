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













