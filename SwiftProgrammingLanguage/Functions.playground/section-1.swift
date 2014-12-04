// FUNCTIONS

// Defining and Calling Functions

func sayHello(personName: String) -> String {
  let greeting = "Hello, " + personName + "!"
  return greeting
}

println(sayHello("Anna"))
println(sayHello("Brian"))

func sayHelloAgain(personName: String) -> String {
  return "Hello again, " + personName + "!"
}

println(sayHelloAgain("Anna"))


// Function Parameters and Return Values
// Multiple Input Parameters

func halfOpenRangeLength(start: Int, end: Int) -> Int {
  return end - start
}
println(halfOpenRangeLength(1, 10))


// Functions Without Parameters

func sayHelloWorld() -> String {
  return "hello, world"
}
println(sayHelloWorld())


// Functions Without Return Values

func sayGoodbye(personName: String) {
  println("Goodbye, \(personName)!")
}
sayGoodbye("Dave")

// The return value of a function can be ignored when it is called

func printAndCount(stringToPrint: String) -> Int {
  println(stringToPrint)
  return countElements(stringToPrint)
}
func printWithoutCounting(stringToPrint: String) {
  printAndCount(stringToPrint)
}
printAndCount("hello, world")
printWithoutCounting("hello, world")


// Functions with Multiple Return Values

func minMax(array: [Int]) -> (min: Int, max: Int) {
  var currentMin = array[0]
  var currentMax = array[0]
  for value in array[1..<array.count] {
    if value < currentMin {
      currentMin = value
    } else if value > currentMax {
      currentMax = value
    }
  }
  return (currentMin, currentMax)
}

let bounds = minMax([8, -6, 2, 109, 3, 71])
println("min is \(bounds.min) and max is \(bounds.max)")


// Optional Tuple Return Types

func minMax2(array: [Int]) -> (min: Int, max: Int)? {
  if array.isEmpty { return nil }
  var currentMin = array[0]
  var currentMax = array[0]
  for value in array[1..<array.count] {
    if value < currentMin {
      currentMin = value
    } else if value > currentMax {
      currentMax = value
    }
  }
  return (currentMin, currentMax)
}

if let bounds = minMax2([8, -6, 2, 109, 3, 71]) {
  println("min is \(bounds.min) and max is \(bounds.max)")
}


//Function Parameter Names

func someFunction(parameterName: Int) {
  // function body goes here, and can use parameterName
  // to refer to the argument value for that parameter
}

// External Parameter Names

func someFunction(externalParameterName localParameterName: Int) {
  // function body goes here, and can use localParameterName
  // to refer to the argument value for that parameter
}

func join(string s1: String, toString s2: String, withJoiner joiner: String) -> String {
  return s1 + joiner + s2
}

join(string: "hello", toString: "world", withJoiner: ", ")


// Shorthand External Parameter Names

func containsCharacter(#string: String, #characterToFind: Character) -> Bool {
  for character in string {
    if character == characterToFind {
      return true
    }
  }
  return false
}

let containsAVee = containsCharacter(string: "aardvark", characterToFind: "v")


// Default Parameter Values

func join2(string s1: String, toString s2: String, withJoiner joiner: String = " ") -> String {
  return s1 + joiner + s2
}

join2(string: "hello", toString: "world")


// External Names for Parameters with Default Values

func join3(s1: String, s2: String, joiner: String = " ") -> String {
  return s1 + joiner + s2
}

join3("hello", "world", joiner: "-")


// Variadic Parameters

func arithmeticMean(numbers: Double...) -> Double {
  var total: Double = 0
  for number in numbers {
    total += number
  }
  return total / Double(numbers.count)
}

arithmeticMean(1, 2, 3, 4, 5)
arithmeticMean(3, 8.25, 18.75)


// Constant and Variable Parameters

func alignRight(var string: String, count: Int, pad: Character) -> String {
  let amountToPad = count - countElements(string)
  if amountToPad < 1 {
    return string
  }
  let padString = String(pad)
  for _ in 1...amountToPad {
    string = padString + string
  }
  return string
}

let originalString = "hello"
let paddedString = alignRight(originalString, 10, "-")


// In-Out Parameters

func swapTwoInts(inout a: Int, inout b: Int) {
  let temporaryA = a
  a = b
  b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
println("someInt is now \(someInt), and anotherInt is now \(anotherInt)")


// Function Types
// * every function has a specific function type, made up of the parameter types and the return type of the function

func addTwoInts(a: Int, b: Int) -> Int {
  return a + b
}

func multiplyTwoInts(a: Int, b: Int) -> Int {
  return a * b
}

// type of functions above is (Int, Int) -> Int

func printHelloWorld() {
  println("hello, world")
}

// type is () -> () or empty tuples

var mathFunction: (Int, Int) -> Int = addTwoInts
println("Result: \(mathFunction(2, 3))")

mathFunction = multiplyTwoInts
println("Result: \(mathFunction(2, 3))")

let anotherMathFunction = addTwoInts // inferred


// Function Types as Parameter Types

func stepForward(input: Int) -> Int {
  return input + 1
}

func stepBackward(input: Int) -> Int {
  return input - 1
}

// both functions above have (Int) -> Int function type

func chooseStepFunction(backwards: Bool) -> (Int) -> Int {
  return backwards ? stepBackward : stepForward
}

var currentValue = 3
let moveNearerToZero = chooseStepFunction(currentValue > 0)

println("Counting to zero:")
// Counting to zero:
while currentValue != 0 {
  println("\(currentValue)... ")
  currentValue = moveNearerToZero(currentValue)
}
println("zero!")


// Nested Functions

func anotherChooseStepFunction(backwards: Bool) -> (Int) -> Int {
  func stepForward(input: Int) -> Int { return input + 1 }
  func stepBackward(input: Int) -> Int { return input - 1 }
  return backwards ? stepBackward : stepForward
}

var currValue = -4
let moveNearerToZero2 = anotherChooseStepFunction(currentValue > 0)
// moveNearerToZero now refers to the nested stepForward() function
while currValue != 0 {
  println("\(currValue)... ")
  currValue = moveNearerToZero2(currValue)
}
println("zero!")



