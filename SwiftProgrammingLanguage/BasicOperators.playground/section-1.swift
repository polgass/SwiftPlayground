// Basic Operators


// Assignment Operator
let b = 10
var a = 5
a = b

let (x, y) = (1, 2)

//if x = y {} // error



// Arithmetic Operators

1 + 2
5 - 3
2 * 3
10.0 / 2.5

"hello, " + "world"



// Remainder Operator
// a = (b × some multiplier) + remainder

9 % 4
-9 % 4
9 % -4



// Floating-Point Remainder Calculations

8 % 2.5
9 % 3.03



// Increment and Decrement Operators

var i = 0
++i
i++
i--
--i

var q = 0
let r = ++q

let s = q++


// Unary Minus Operator

let three = 3
let minusThree = -three
let plusThree = -minusThree


// Unary Plus Operator

let minusSix = -6
let alsoMinusSix = +minusSix


// Compound Assignment Operators

var e = 1
e += 2


// Comparison Operators

1 == 1   // true, because 1 is equal to 1
2 != 1   // true, because 2 is not equal to 1
2 > 1    // true, because 2 is greater than 1
1 < 2    // true, because 1 is less than 2
1 >= 1   // true, because 1 is greater than or equal to 1
2 <= 1   // false, because 2 is not less than or equal to 1

let name = "world"
if name == "world" {
  println("hello, world")
} else {
  println("I'm sorry \(name), but I don't recognize you")
}


// Ternary Conditional Operator

let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)


// Nil Coalescing Operator
// (a ?? b)

let defaultColorName = "red"
var userDefinedColorName: String?

var colorNameToUse = userDefinedColorName ?? defaultColorName

userDefinedColorName = "green"
colorNameToUse = userDefinedColorName ?? defaultColorName



// Range Operators

// Closed Range Operator

for index in 1...5 {
  println("\(index) times 5 is \(index * 5)")
}

// Half-Open Range Operator

let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
  println("Person \(i + 1) is called \(names[i])")
}



// Logical Operators

// Logical NOT Operator

let allowedEntry = false
if !allowedEntry {
  println("ACCESS DENIED")
}


// Logical AND Operator

let enteredDoorCode = true
let passedRetinaScan = false
if enteredDoorCode && passedRetinaScan {
  println("Welcome!")
} else {
  println("ACCESS DENIED")
}


// Logical OR Operator

let hasDoorKey = false
let knowsOverridePassword = true
if hasDoorKey || knowsOverridePassword {
  println("Welcome!")
} else {
  println("ACCESS DENIED")
}


// Combining Logical Operators

if enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword {
  println("Welcome!")
} else {
  println("ACCESS DENIED")
}


// Explicit Parentheses

if (enteredDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword {
  println("Welcome!")
} else {
  println("ACCESS DENIED")
}



