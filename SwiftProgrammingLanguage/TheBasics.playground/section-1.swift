// Constants and Variables

let maximumNumberOfLoginAttempts = 10
var currentLoginAttempt = 0

var x = 0.0, y = 00, z = 0.0


// Type Annotations

var welcomeMessage: String
welcomeMessage = "Hello"

var red, green, blue: Double


// Naming Constants and Variables

let π = 3.14159
let 你好 = "你好世界"
let 🐶🐮 = "dogcow"

var `var` = "use back ticks for reserved keywords"

var friendlyWelcome = "Hello!"
friendlyWelcome = "Bonjour!" // value changed

let languageName = "Swift"
//languageName = "Swift++" // compile-time error


// Printing Constants and Variables

println(friendlyWelcome)

println("This is a string")

println("The current value of friendlyWelcome is \(friendlyWelcome)")


// Comments

// this is a comment

/* this is also a comment,
but written over multiple lines */

/* this is the start of the first multiline comment
/* this is the second, nested multiline comment */
this is the end of the first multiline comment */


// Semicolons

let cat = "🐱"; println(cat) // required for multiple statements


// Integers

let minValue = UInt8.min // explicit 8-bit
let maxValue = UInt8.max

let anInteger = UInt.min // platform's native 


// Floating-Point Numbers
// Double (64-bit)
// Float (32-bit)

let piValue = 3.14159
let discount = -273.15


// Type Safety and Type Inference

let meaningOfLife = 42 // inferred as Int
let pi = 3.14159 // inferred as Double (by default)
let anotherPi = 3 + 0.14159 // inferred as Double


// Numeric Literals

let decimalInteger = 17 // decimal number, no prefix
let binaryInteger = 0b10001 // binary number, with a 0b prefix
let octalInteger = 0o21 // octal number, with a 0o prefix
let hexadecimalInteger = 0x11 // hexadecimal number, with a 0x prefix

let aNumberWithExponent = 1.25e2 // 1.25 x 10^2
let anotherNumberWithExponent = 1.25e-2 // 1.25 x 10^-2
let hexValue = 0xFp2 // 15 x 2^2
let anotherHexValue = 0xFp-2 // 15 x 2^-2

let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble = 0xC.3p0

// literals padded with extra zeroes and underscores
let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1


// Numeric Type Conversion

// Integer Conversion

//let cannotBeNegative: UInt8 = -1
// UInt8 cannot store negative numbers, and so this will report an error
//let tooBig: Int8 = Int8.max + 1
// Int8 cannot store a number larger than its maximum value,
// and so this will also report an error

let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one) // initialize UInt16() with variable "one"

// Integer and Floating-Point Conversion

let three = 3
let pointOneFourOneFiveNine = 0.14159
let newPi = Double(three) + pointOneFourOneFiveNine // initialize Double() with variable "three"

let integerPi = Int(newPi)


// Type Aliases

typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.min


// Booleans

let orangesAreOrange = true
let turnipsAreDelicious = false

if turnipsAreDelicious {
  println("Mmm, tasty turnips!")
} else {
  println("Eww, turnips are horrible.")
}

let i = 1
//if i {} // error!
if i == 1 {} // valid


// Tuples

let http404Error = (404, "Not Found")

let (statusCode, statusMessage) = http404Error
println("The status code is \(statusCode)")
println("The status message is \(statusMessage)")

let (justTheStatusCode, _) = http404Error
println("The status code is \(justTheStatusCode)")

println("The status code is \(http404Error.0)")
println("The status code is \(http404Error.1)")

let http200Status = (statusCode: 200, description: "OK")

println("The status code is \(http200Status.statusCode)")
println("The status message is \(http200Status.description)")


// Optionals

let possibleNumber = "23"
let convertedNumber = possibleNumber.toInt() // inferred as Int?

var serverResponseCode: Int? = 404
//serverResponseCode = nil

var surveyAnswer: String?

if convertedNumber != nil {
  println("convertedNumber contains some integer value.")
}

if convertedNumber != nil {
  println("convertedNumber has an integer value of \(convertedNumber!).")
}


// Optional Binding

if let actualNumber = possibleNumber.toInt() {
  println("\'\(possibleNumber)\' has an integer value of \(actualNumber)")
} else {
  println("\'\(possibleNumber)\' could not be converted to an integer")
}

// Implicitly Unwrapped Optionals

let possibleString: String? = "An optional string."
let forcedString: String = possibleString!

let assumedString: String! = "An implicity unwrapped optional string."
let implicitString: String = assumedString

if assumedString != nil {
  println(assumedString)
}

if let definiteString = assumedString {
  println(definiteString)
}


// Assertion

let age = -3
//assert(age >= 0, "A person's age cannot be less than zero") // stops code execution from this point on
//assert(age >= 0) // without a message



