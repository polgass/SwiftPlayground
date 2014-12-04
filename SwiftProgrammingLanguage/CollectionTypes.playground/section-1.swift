// COLLECTION TYPES

// Mutability of Collections
// a good practice to create immutable collections whenever possible

// Arrays

var anArray: Array<Int> // full
var anotherArray: [Int] // shorthand

var shoppingList: [String] = ["Eggs", "Milk"]
var inferredShoppingList = ["Eggs", "Milk"]


// Accessing and Modifying an Array

println("The shopping list contains \(shoppingList.count) items.")

if shoppingList.isEmpty {
  println("The shopping list is empty.")
} else {
  println("The shopping list is not empty.")
}

shoppingList.append("Flour")
shoppingList += ["Baking Powder"]
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]

var firstItem = shoppingList[0]

shoppingList[0] = "Six Eggs" // update value
shoppingList
shoppingList[4...6] = ["Bananas", "Apples"]

shoppingList.insert("Maple Syrup", atIndex: 0) // insert

let mapleSyrup = shoppingList.removeAtIndex(0)
shoppingList
mapleSyrup

firstItem = shoppingList[0]

let apples = shoppingList.removeLast()


// Iterating Over an Array

for item in shoppingList {
  println(item)
}

for (index, value) in enumerate(shoppingList) {
  println("Item \(index + 1): \(value)")
}


// Creating and Initializing an Array

var someInts = [Int]() // recommended
var someString: Array<String> = []
println("someInts is of type [Int] with \(someInts.count) items.")

someInts.append(3)
someInts = []

var threeDoubles = [Double](count: 3, repeatedValue: 0.0)

var anotherThreeDoubles = [Double](count: 3, repeatedValue: 2.5)

var sixDoubles = threeDoubles + anotherThreeDoubles


// Dictionaries

var aDictionary: Dictionary<Int, String> // full
var anotherDict: [Int: String] // shorthand (preferred)

var airportsExplicit: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
var airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"] // inferred


// Accessing and Modifying a Dictionary

println("The airports dictionary contains \(airports.count) items.")

if airports.isEmpty {
  println("The airports dictionary is empty.")
} else {
  println("The airports dictionary is not empty.")
}

airports["LHR"] = "London"
airports["LHR"] = "London Heathrow" // update
airports

// updateValue(forKey:) - returns old value
if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
  println("The old value for DUB was \(oldValue)")
}
airports

if let airportName = airports["DUB"] {
  println("The name of the airport is \(airportName).")
} else {
  println("The airport is not in the airports dictionary.")
}

airports["APL"] = "Apple International"
airports["APL"] = nil

if let removedValue = airports.removeValueForKey("DUB") {
  println("The removed airport's name is \(removedValue)")
} else {
  println("The airports dictionary does not contain a value for DUB")
}

for (airportCode, airportName) in airports {
  println("\(airportCode): \(airportName)")
}


// Iterating Over a Dictionary

// access via keys
for airportCode in airports.keys {
  println("Airport code: \(airportCode)")
}

// access via values
for airportName in airports.values {
  println("Airport name: \(airportName)")
}

// return array of keys
let airportCodes = [String](airports.keys)

// return array of values
let airportNames = [String](airports.values)


// Creating an Empty Dictionary

var namesOfIntegers = [Int: String]() // recommended
namesOfIntegers[16] = "sixteen"
namesOfIntegers = [:] // empty the dictionary


// Hash Values for Dictionary Key Types
// * A type must be hashable in order to be used as a dictionary’s key type
// * All of Swift’s basic types (such as String, Int, Double, and Bool) are hashable by default
// * Enumeration member values without associated values are also hashable by default.
// * You can use your own custom types as dictionary key types by making them conform to the Hashable protocol








