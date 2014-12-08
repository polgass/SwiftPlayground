println("Hello, world!")

// Simple Values
var myVariable = 42
myVariable = 50
let myConstant = 42

let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble: Double = 70
let explicitFloat: Float = 4

let label = "The width is "
let width = 94
let widthLabel = label + String(width)

let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."

let name = "Paul"
let value1 = 5.5
let value2 = 11.011
let message = "Greetings, \(name), you have \(value1 + value2) million dollars."

var shoppingList = ["catfish", "water", "tulips", "blue paint"]
shoppingList[1] = "bottle of water"

var occupations = ["Malcom": "Captain", "Kaylee": "Mechanic"]
occupations["Jayne"] = "Public Relations"

// to initialize empty array or dictionary
// use initializer syntax
let emptyArray = [String]()
let emptyDictionary = [String: Float]()

// or, inferred
shoppingList = []
occupations = [:]

// Control Flow
let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
  if score > 50 {
    teamScore += 3
  } else {
    teamScore += 1
  }
}
teamScore

// if statement conditions MUST be a boolean

// optionals
var optionalString: String? = "Hello"
optionalString = nil

var optionalName: String? = nil
var greeting = "Hello!"
if let name = optionalName {
  greeting = "Hello, \(name)"
}

// switches
let vegetable = "red pepper"
switch vegetable {
  case "celery":
    let vegetableComment = "Add some raisins and make ants on a log."
  case "cucumber", "watercress":
    let vegetableComment = "That would make a good tea sandwich."
  case let x where x.hasSuffix("pepper"):
    let vegetableComment = "Is it a spicy \(x)?"
  default:
    let vegetableComment = "Everything tastes good in soup."
}

// for-in (dictionary)
let interestingNumbers = [
  "Prime": [2, 3, 5, 7, 11, 13],
  "Fibonacci": [1, 1, 2, 3, 5, 8],
  "Square": [1, 4, 9, 16, 25],
  "Random": [8, 100, 99],
]

var largest = 0
var type = ""
for (kind, numbers) in interestingNumbers {
  for number in numbers {
    if number > largest {
      largest = number
      type = kind
    }
  }
}
largest
type

// while loop
var n = 2
while n < 100 {
  n = n * 2
}
n

var m = 2
do {
  m = m * 2
} while m < 100
m

// for-loop with range
var firstForLoop = 0
for i in 0..<4 {
  firstForLoop += i
}
firstForLoop

var secondForLoop = 0
for var i = 0; i < 4; ++i {
  secondForLoop += i
}
secondForLoop

// Functions and Closures
func greet(name: String, day: String) -> String {
  return "Hello \(name), today is \(day)"
}
greet("Bob", "Tuesday")

// tuple
// return multiple values
func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
  var min = scores[0]
  var max = scores[0]
  var sum = 0
  
  for score in scores {
    if score > max {
      max = score
    } else if score < min {
      min = score
    }
    sum += score
  }
  return (min, max, sum)
}

let statistics = calculateStatistics([5, 3, 100, 3, 9])
statistics.min
statistics.max
statistics.sum

// functions can take n arguments
func sumOf(numbers: Int...) -> Int {
  var sum = 0
  for number in numbers {
    sum += number
  }
  return sum
}
sumOf()
sumOf(42, 597, 12)

func averageOf(numbers: Int...) -> Float {
  var sum = 0
  var count = 0
  for number in numbers {
    sum += number
    count++
  }
  return Float(sum) / Float(count)
}
averageOf(13, 22, 3)

// nesting
func returnFifteen() -> Int {
  var y = 10
  func add() {
    y += 5
  }
  add()
  return y
}
returnFifteen()

// function can return another function as its return value
func makeIncrementer() -> (Int -> Int) {
  func addOne(number: Int) -> Int {
    return 1 + number
  }
  return addOne
}
var increment = makeIncrementer()
increment(3)

// function can take another function as one of its arguments
func hasAnyMatches(list: [Int], condition: Int -> Bool) -> Bool {
  for item in list {
    if condition(item) {
      return true
    }
  }
  return false
}

func lessThanTen(number: Int) -> Bool {
  return number < 10
}

var numbers = [20, 19, 7, 12]
hasAnyMatches(numbers, lessThanTen)

// closures w/o a name
numbers.map({
  (number: Int) -> Int in
  let result = 3 * number
  return result
})

numbers.map({
  (number: Int) -> Int in
  var result = 0
  if number % 2 == 0 {
    result = number
  }
  return result
})

// closure type is known (callback for delegate), you can omit its parameters and/or return type
let mappedNumbers = numbers.map({ number in 3 * number })
mappedNumbers

// refer to parameters instead if by name
let sortedNumbers = sorted(numbers) { $0 > $1 }
sortedNumbers

// Objects and Classes
class Shape {
  var numberOfSides = 0
  let anotherProperty = "I am a property."
  
  func simpleDescription() -> String {
    return "A shape with \(numberOfSides) sides."
  }
  
  func anotherMethod(what: String) {
    println("\(what) is being printed.")
  }
}

// class with initializer
var shape = Shape()
shape.numberOfSides = 7
shape.anotherProperty
shape.anotherMethod("Hey")
var shapesDescription = shape .simpleDescription()

class NamedShape {
  var numberOfSides: Int = 0
  var name: String
  
  init(name: String) {
    self.name = name
  }
  
  // use deinit to do some cleanup before the object is deallocated
  
  func simpleDescription() -> String {
    return "A shape with \(numberOfSides) sides."
  }
}

// sub-class
class Square: NamedShape {
  var sideLength: Double
  
  init(sideLength: Double, name: String) {
    self.sideLength = sideLength
    super.init(name: name)
    numberOfSides = 4
  }
  
  func area() -> Double {
    return sideLength * sideLength
  }
  
  override func simpleDescription() -> String {
    return "A square with sides of length \(sideLength)."
  }
}

let test = Square(sideLength: 5.2, name: "my test square")
test.area()
test.name
test.numberOfSides
test.simpleDescription()

import Darwin

class Circle: NamedShape {
  var radius: Float;
  let 
  
  init(radius: Float, name: String) {
    self.radius = radius
    super.init(name: name)
    self.numberOfSides = 0
  }
  
  func area() {
    return Math.pi * radius * radius
  }
}






























































