// Playground - noun: a place where people can play

import UIKit

// DECLARING OPTIONALS
var str: String? = "Hello Swift by Tutorials!"
//var str: String?
if let unwrappedStr = str {
    println("Unwrapped! \(unwrappedStr.uppercaseString)")
} else {
    println("Was nil")
}

// above code means - if str is currently wrapping an instance of a string, then unwrappedStr becomes a variable of type String, and the if condition passes
// this forces you to check a value before using it (type safety)


// FORCED UNWRAPPING
// does not need the if statement to check if the optional contains a value
var str2: String? = "Hello Swift by Tutorials!"
//var str2: String? // fatal error
println("Force unwrapped! \(str2!.uppercaseString)")


// IMPLICIT UNWRAPPING
// same as above, but uses ! mark in variable assignment
//var str3: String! = "Hello Swift by Tutorials!"
//str3 = str3.lowercaseString
//println(str3)
var str3: String!
if str3 != nil { // this will remove the error
    str3 = str3.lowercaseString
    println(str3)
}

// OPTIONAL CHAINING
// working with optionals quickly without using if/let and a conditional block each time
var maybeString: String? = "Hello Swift by Tutorials!"
let uppercase = maybeString?.uppercaseString


// COLLECTIONS

// ARRAYS
var array = [1, 2, 3, 4, 5] // inferred
println(array[2])
array.append(6)
array.extend(7...10)
println(array)

/** Challenge
Find the method to remove objects from an array and 
remove every other element.
**/
var array2 = array
//array2.removeAtIndex(3) // remove an object

// remove every other element
for (var i = array2.count - 1; i > -1; i--) {
    if i % 2 == 0 {
        println(i)
        array2.removeAtIndex(i)
    }
}
println(array2)
/** end of challenge **/

//array.append("11") // error!

var array3: [Int] = [1, 2, 3, 4, 5] // shorter syntax
//var array3: Array<Int> = [1, 2, 3, 4, 5] // generic syntax

/** Challenge
Create an array to hold AnyObject types and add a few 
integers, strings and anything else you like!
**/
var anArray: [AnyObject] = []
anArray.append(1)
anArray.append("2")
anArray.append("Hello")
println(anArray)
/** end of challenge **/

// DICTIONARIES
//var dictionary = [1: "Dog", 2: "Cat"] // not strongly typed?
var dictionary: [Int:String] = [1: "Dog", 2 : "Cat"] // strongly typed, shorthand
//var dictionary: Dictionary<Int, String> = [1: "Dog", 2 : "Cat"] // long (generic) form
println(dictionary[2])
dictionary[3] = "Mouse"
println(dictionary)
dictionary[3] = nil
println(dictionary)

/** Challenge
Use a subscript to change the value of the 2 key to 
“Elephant”.
**/
dictionary[2] = "Elephant"
println(dictionary)
/** end of challenge **/

println(dictionary[1]) // returns optional
// this makes sense since you could try to read a key that doesn’t exist, and the function needs the option to return nil

// make it "safe by default"
if let value = dictionary[1] {
    println("Value is \(value)")
}

// REFERENCES AND COPIES
var dictionaryA = [1: 1, 2: 4, 3: 9, 4: 16]
var dictionaryB = dictionaryA
println(dictionaryA)
println(dictionaryB)

dictionaryB[4] = nil
println(dictionaryA)
println(dictionaryB)

// note: dictionaries are copied when you assign them to new variables and constants, or when you pass them as parameters to functions.

var arrayA = [1, 2, 3, 4, 5]
var arrayB = arrayA
println(arrayA)
println(arrayB)

//arrayB.removeAtIndex(0)
arrayB[0] = 10
println(arrayA)
println(arrayB)

// note: This is in contrast to references, which you may be more familiar with from other languages such as Objective-C. When a pointer to an NSArray is assigned to another variable, it still points to the same NSArray instance.


// CONSTANT COLLECTIONS
let constantArray = [1, 2, 3, 4, 5]
//constantArray.append(6) // error
//constantArray.removeAtIndex(0) // error

/** Challenge
Create a constant dictionary and confirm that you 
cannot add to, remove from or change values in it.
**/
let constantDictionary = [1: "Dog", 2: "Cat"]
//constantDictionary[3] = "Mouse" // error
//constantDictionary[1] = nil // error





















