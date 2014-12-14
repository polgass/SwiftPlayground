// Generics

// The Problem That Generics Solve

func swapTwoInts(inout a: Int, inout b: Int) {
  let temporaryA = a
  a = b
  b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
println("someInt is now \(someInt), and anotherInt is now \(anotherInt)")

// above function can only be used with Int values. To swap two String values or two doubles, we write more functions:

func swapTwoStrings(inout a: String, inout b: String) {
  let temporaryA = a
  a = b
  b = temporaryA
}

func swapTwoDoubles(inout a: Double, inout b: Double) {
  let temporaryA = a
  a = b
  b = temporaryA
}


// Generic Functions
// * uses a placeholder type (e.g. <T>, <AnyType>, <Whatever>)
// * <T> is an example of a type parameter

func swapTwoValues<T>(inout a: T, inout b: T) {
  let temporaryA = a
  a = b
  b = temporaryA
}

var anInt = 3
var yetAnotherInt = 107
swapTwoValues(&anInt, &yetAnotherInt)
println("anInt is now \(anInt), and yetAnotherInt is now \(yetAnotherInt)")

var someString = "hello"
var anotherString = "world"
swapTwoValues(&someString, &anotherString)

// Swift's swap() function is already available to represent the above example


// Type Parameters
// * <T>, <A, B, C> - multiple types are comma separated


// Naming Type Parameters
// * for simple generic types or functions that refer to a single place holder, it is traditional to use the single-character name <T>
// * for complex types with multiple parameters, give more descriptive parameter names (e.g. <Key, Value>)


// Generic Types

// non-generic way:
struct IntStack {
  var items = [Int]()
  mutating func push(item: Int) {
    items.append(item)
  }
  mutating func pop() -> Int {
    return items.removeLast()
  }
}

// generic way:
struct Stack<T> {
  var items = [T]()
  mutating func push(item: T) {
    items.append(item)
  }
  mutating func pop() -> T {
    return items.removeLast()
  }
}


var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")
stackOfStrings.push("cuatro")

let fromTheTop = stackOfStrings.pop()


// Extending a Generic Type

extension Stack {
  var topItem: T? {
    return items.isEmpty ? nil : items[items.count - 1]
  }
}

if let topItem = stackOfStrings.topItem {
  println("The top item on the stack is \(topItem).")
}


// Type Constraints
// * constraints specify that a type parameter must inherit from a specific class, or conform to a particular protocol or protocol composition

// Type Constraint Syntax
/*
func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, someU: U) {
  // function body goes here
}
*/

// non-generic:
func findStringIndex(array: [String], valueToFind: String) -> Int? {
  for (index, value) in enumerate(array) {
    if value == valueToFind {
      return index
    }
  }
  return nil
}

let strings = ["cat", "dog", "llama", "parakeet", "terrapin"]
if let foundIndex = findStringIndex(strings, "llama") {
  println("The index of llama is \(foundIndex)")
}

// generic:
// * use of Equatable protocol
func findIndex<T: Equatable>(array: [T], valueToFind: T) -> Int? {
  for (index, value) in enumerate(array) {
    if value == valueToFind {
      return index
    }
  }
  return nil
}

let doubleIndex = findIndex([3.14156, 0.1, 0.25], 9.3) // nil
let stringIndex = findIndex(["Mike", "Malcolm", "Andrea"], "Andrea")
println(stringIndex)


// Associated Types
// * typealias keyword

protocol Container {
  typealias ItemType
  mutating func append(item: ItemType)
  var count: Int { get }
  subscript(i: Int) -> ItemType { get }
}

// non-generic:
struct AnotherIntStack: Container {
  // original IntStack implementation
  var items = [Int]()
  mutating func push(item: Int) {
    items.append(item)
  }
  mutating func pop() -> Int {
    return items.removeLast()
  }
  // conformance to the Container protocol
  typealias ItemType = Int
  mutating func append(item: ItemType) {
    self.push(item)
  }
  var count: Int {
    return items.count
  }
  subscript(i: Int) -> Int {
    return items[i]
  }
}

struct AnotherStack<T>: Container {
  // original Stack<T> implementation
  var items = [T]()
  mutating func push(item: T) {
    items.append(item)
  }
  mutating func pop() -> T {
    return items.removeLast()
  }
  // conformance to the Container protocol
  mutating func append(item: T) {
    self.push(item)
  }
  var count: Int {
    return items.count
  }
  subscript(i: Int) -> T {
    return items[i]
  }
}


// Extending an Existing Type to Specify an Associated Type
// * extend an existing type to add conformance to a protocol, including associated types

extension Array: Container {} // Array already provides an append method, a count property, and a subscript with an Int index to retrieve its elements


// Where Clauses
// * 'where' keyword immediately after the list of type parameters

func allItemsMatch<C1: Container, C2: Container where C1.ItemType == C2.ItemType, C1.ItemType: Equatable>(someContainer: C1, anotherContainer: C2) -> Bool {
  
  // check that both containers contain the same number of items
  if someContainer.count != anotherContainer.count {
    return false
  }
  
  // check each pair of items to see if they are equivalent
  for i in 0..<someContainer.count {
    if someContainer[i] != anotherContainer[i] {
      return false
    }
  }
  
  // all items match, so return true
  return true
}

var newStackOfStrings = AnotherStack<String>()
newStackOfStrings.push("uno")
newStackOfStrings.push("dos")
newStackOfStrings.push("tres")

var arrayOfStrings = ["uno", "dos", "tres"]

if allItemsMatch(newStackOfStrings, arrayOfStrings) {
  println("All items match.")
} else {
  println("Not all items match.")
}




