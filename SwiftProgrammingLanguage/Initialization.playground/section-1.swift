// INITIALIZATION

//Setting Initial Values for Stored Properties
// * When you assign a default value to a stored property, or set its initial value within an initializer, the value of that property is set directly, without calling any property observers

// Initializers

struct MyFahrenheit {
  var temperature: Double
  init() {
    temperature = 32.0
  }
}
var f = MyFahrenheit()
println("The default temperature is \(f.temperature)° Fahrenheit")


// Default Property Values
// * If a property always takes the same initial value, provide a default value rather than setting a value within an initializer

struct Fahrenheit {
  var temperature = 32.0
}


// Customizing Initialization
// Initialization Parameters

struct Celsius {
  var temperatureInCelsius: Double
  init(fromFahrenheit fahrenheit: Double) {
    temperatureInCelsius = (fahrenheit - 32.0) / 1.8
  }
  init(fromKelvin kelvin: Double) {
    temperatureInCelsius = kelvin - 273.15
  }
}

let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
boilingPointOfWater.temperatureInCelsius
let freezingPointOfWater = Celsius(fromKelvin: 273.15)
freezingPointOfWater.temperatureInCelsius


// Local and External Parameter Names

struct Color {
  let red, green, blue: Double
  init(red: Double, green: Double, blue: Double) {
    self.red = red
    self.green = green
    self.blue = blue
  }
  init(white: Double) {
    red = white
    green = white
    blue = white
  }
}
//let veryGreen = Color(0.0, 1.0, 0.0) // this reports a compile-time error - external names are required
let veryGreen = Color(red: 0.0, green: 1.0, blue: 0.0)


// Initializer Parameters Without External Names

struct MyCelsius {
  var temperatureInCelsius: Double
  init(fromFahrenheit fahrenheit: Double) {
    temperatureInCelsius = (fahrenheit - 32.0) / 1.8
  }
  init(fromKelvin kelvin: Double) {
    temperatureInCelsius = kelvin - 273.15
  }
  init(_ celsius: Double) { // no external parameter name
    temperatureInCelsius = celsius
  }
}
let bodyTemperature = MyCelsius(37.0)


// Optional Property Types

class SurveyQuestion {
  var text: String
  var response: String?
  init(text: String) {
    self.text = text
  }
  func ask() {
    println(text)
  }
}

let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
cheeseQuestion.ask()
cheeseQuestion.response = "Yes, I do like cheese."


// Modifying Constant Properties During Initialization
// * For class instances, a constant property can only be modified during initialization by the class that introduces it. It cannot be modified by a subclass.

class SameSurveyQuestion {
  let text: String
  var response: String?
  init(text: String) {
    self.text = text
  }
  func ask() {
    println(text)
  }
}

let beetsQuestion = SameSurveyQuestion(text: "How about beets?")
beetsQuestion.ask()
beetsQuestion.response = "I also like beets. (But not with cheese.)"


// Default Initializers

class MyShoppingListItem {
  var name: String?
  var quantity = 1
  var purchased = false
}
var item = MyShoppingListItem()


// Memberwise Initializers for Structure Types
// * Structure types automatically receive a memberwise initializer

struct MySize {
  var width = 0.0, height = 0.0
}

let twoByTwo = MySize(width: 2.0, height: 2.0)


// Initializer Delegation for Value Types
// * avoids duplicating code across multiple initializers
// * implementation differs between value types and classes

struct Size {
  var width = 0.0, height = 0.0
}

struct Point {
  var x = 0.0, y = 0.0
}

struct Rect {
  var origin = Point()
  var size = Size()
  init() {}
  init(origin: Point, size: Size) {
    self.origin = origin
    self.size = size
  }
  init(center: Point, size: Size) {
    let originX = center.x - (size.width / 2)
    let originY = center.y - (size.height / 2)
    self.init(origin: Point(x: originX, y: originY), size: size)
  }
}

let basicRect = Rect()
let originRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))
let centerRect = Rect(center: Point(x: 4.0, y: 4.0), size: Size(width: 3.0, height: 3.0))


// Class Inheritance and Initialization
// * designated initializers and convenience initializers

// Designated Initializers and Convenience Initializers

class SomeClass {
  // designated initializer
  init(param: Int) {
    // some statement
    // call super class's init
  }
  
  // convenience initializer
  convenience init(anotherParam: Int) {
    self.init(param: 1)
    // some statement
  }
}


// Initializer Delegation for Class Types
// * Rule 1: A designated initializer must call a designated initializer from its immediate superclass.
// * Rule 2: A convenience initializer must call another initializer from the same class.
// * Rule 3: A convenience initializer must ultimately call a designated initializer
// * TO SUM UP: Designated initializers must always delegate up, convenience initializers must always delegate across


// Two-Phase Initialization
// * PHASE 1: each stored property is assigned an initial value
// * PHASE 2: each class is given the opportunity to customize its stored properties further before the new instance is considered ready for use


// Initializer Inheritance and Overriding
// * Swift subclasses do not inherit their superclass initializers by default.

class Vehicle {
  var numberOfWheels = 0
  var description: String {
    return "\(numberOfWheels) wheel(s)"
  }
}

let vehicle = Vehicle()
println("Vehicle: \(vehicle.description)")

class Bicycle: Vehicle {
  override init() {
    super.init()
    numberOfWheels = 2
  }
}

let bicycle = Bicycle()
println("Bicycle: \(bicycle.description)")


// Automatic Initializer Inheritance
// * Rule 1: If your subclass doesn’t define any designated initializers, it automatically inherits all of its superclass designated initializers.
// * Rule 2: If your subclass provides an implementation of all of its superclass designated initializers—either by inheriting them as per rule 1, or by providing a custom implementation as part of its definition—then it automatically inherits all of the superclass convenience initializers.


// Designated and Convenience Initializers in Action

class Food {
  var name: String
  init(name: String) {
    self.name = name
  }
  convenience init() {
    self.init(name: "[Unnamed]")
  }
}

let namedMeat = Food(name: "Bacon")
let mysteryMeat = Food() // calling convenience initializer

class RecipeIngredient: Food {
  var quantity: Int
  init(name: String, quantity: Int) {
    self.quantity = quantity
    super.init(name: name)
  }
  override convenience init(name: String) {
    self.init(name: name, quantity: 1)
  }
}

let oneMysteryItem = RecipeIngredient()
let oneBacon = RecipeIngredient(name: "Bacon")
let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)

class ShoppingListItem: RecipeIngredient {
  var purchased = false
  var description: String {
    var output = "\(quantity) x \(name)"
    output += purchased ? " ✔" : " ✘"
    return output
  }
}

var breakfastList = [
  ShoppingListItem(),
  ShoppingListItem(name: "Bacon"),
  ShoppingListItem(name: "Eggs", quantity: 6),
]
breakfastList[0].name = "Orange juice"
breakfastList[0].purchased = true
for item in breakfastList {
  println(item.description)
}


// Failable Initializers

struct Animal {
  let species: String
  init?(species: String) {
    if species.isEmpty { return nil }
    self.species = species
  }
}

let someCreature = Animal(species: "Giraffe")
if let giraffe = someCreature {
  println("An animal was initialized with a species of \(giraffe.species)")
}

let anonymousCreature = Animal(species: "")
if anonymousCreature == nil {
  println("The anonymous creature could not be initialized")
}


// Failable Initializers for Enumerations

enum MyTemperatureUnit {
  case Kelvin, Celsius, Fahrenheit
  init?(symbol: Character) {
    switch symbol {
    case "K":
      self = .Kelvin
    case "C":
      self = .Celsius
    case "F":
      self = .Fahrenheit
    default:
      return nil
    }
  }
}

let myFahrenheitUnit = MyTemperatureUnit(symbol: "F")
if myFahrenheitUnit != nil {
  println("This is a defined temperature unit, so initialization succeeded.")
}

let myUnknownUnit = MyTemperatureUnit(symbol: "X")
if myUnknownUnit == nil {
  println("This is not a defined temperature unit, so initialization failed.")
}

// Failable Initializers for Enumerations with Raw Values
// * automatically receives a failable initializer, init?(rawValue:)

enum TemperatureUnit: Character {
  case Kelvin = "K", Celsius = "C", Fahrenheit = "F"
}

let fahrenheitUnit = TemperatureUnit(rawValue: "F")
if fahrenheitUnit != nil {
  println("This is a defined temperature unit, so initialization succeeded.")
}

let unknownUnit = TemperatureUnit(rawValue: "X")
if unknownUnit == nil {
  println("This is not a defined temperature unit, so initialization failed.")
}


// Failable Initializers for Classes
// * initial value for a property is provided (nil)

class Product {
  let name: String!
  init?(name: String) {
    if name.isEmpty { return nil }
    self.name = name
  }
}

if let bowTie = Product(name: "bow tie") {
  println("The product's name is \(bowTie.name)")
}


// Propagation of Initialization Failure
// * A failable initializer can delegate across to another failable initializer

class CartItem: Product {
  let quantity: Int!
  init?(name: String, quantity: Int) {
    super.init(name: name)
    if quantity < 1 { return nil }
    self.quantity = quantity
  }
}
if let twoSocks = CartItem(name: "sock", quantity: 2) {
  println("Item: \(twoSocks.name), quantity: \(twoSocks.quantity)")
}

if let zeroShirts = CartItem(name: "shirt", quantity: 0) {
  println("Item: \(zeroShirts.name), quantity: ")
} else {
  println("Unable to initialize zero shirts")
}

if let oneUnnamed = CartItem(name: "", quantity: 1) {
  println("Item: \(oneUnnamed.name), quantity: \(oneUnnamed.quantity)")
} else {
  println("Unable to initialize one unnamed product")
}


// Overriding a Failable Initializer

class Document {
  var name: String? // this initializer creates a document with a nil name value
  init() {} // this initializer creates a document with a non-empty name value
  init?(name: String) {
    if name.isEmpty { return nil }
    self.name = name
  }
}

class AutomaticallyNamedDocument: Document {
  override init() {
    super.init()
    self.name = "[Untitled]"
  }
  override init?(name: String) {
    super.init()
    if name.isEmpty {
      self.name = "[Untitled]"
    } else {
      self.name = name
    }
  }
}

let someDocument = AutomaticallyNamedDocument()
if let untitledDocument = someDocument.name {
  println("Document: \(untitledDocument)")
}

if let failableDocument = AutomaticallyNamedDocument(name: "tabloid") {
  println("Document: \(failableDocument.name!)")
}


// The init! Failable Initializer
// * same as above
// * init! keyword


// Required Initializers

class AnotherClass {
  var nothing: String {
    return "Nothing!"
  }
  required init() {
    // initializer implementation goes here
  }
}

class AnotherSubclass: AnotherClass {
  required init() {
    // subclass implementation of the required initializer goes here
  }
}


// Setting a Default Property Value with a Closure or Function

class SomeOtherClass {
  let someProperty: SomeClass = {
    // create a default value for someProperty inside this closure
    // someValue must be of the same type as SomeType
    let someValue = SomeClass(param: 100)
    return someValue
    }() // take note of the parenthesis
}

struct Checkerboard {
  let boardColors: [Bool] = {
    var temporaryBoard = [Bool]()
    var isBlack = false
    for i in 1...10 {
      for j in 1...10 {
        temporaryBoard.append(isBlack)
        isBlack = !isBlack
      }
      isBlack = !isBlack
    }
    return temporaryBoard
    }()
  func squareIsBlackAtRow(row: Int, column: Int) -> Bool {
    return boardColors[(row * 10) + column]
  }
}

let board = Checkerboard()
println(board.squareIsBlackAtRow(0, column: 1))
println(board.squareIsBlackAtRow(9, column: 9))






