// STRINGS AND CHARACTERS


// String Literals

let someString = "Some string literal value"


// Initializing an Empty String

var emptyString = "" // empty string literal
var anotherEmptyString = String()  // initializer syntax

if emptyString.isEmpty {
  println("Nothing to see here")
}


// String Mutability

var variableString = "Horse"
variableString += " and carriage"
// variableString is now "Horse and carriage"

let constantString = "Highlander"
//constantString += " and another Highlander" // error!


// Strings Are Value Types
// which means that each string value is COPIED 


// Working with Characters

for character in "Dog!🐶" {
  println(character)
}

let yenSign: Character = "¥"


// Concatenating Strings and Characters

let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2

var instruction = "look over"
instruction += string2

let exclamationMark: Character = "!"
welcome.append(exclamationMark)


// String Interpolation

let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"


// Unicode

let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
let dollarSign = "\u{24}"        // $,  Unicode scalar U+0024
let blackHeart = "\u{2665}"      // ♥,  Unicode scalar U+2665
let sparklingHeart = "\u{1F496}" // 💖, Unicode scalar U+1F496


// Extended Grapheme Clusters

let eAcute: Character = "\u{E9}"                         // é
let combinedEAcute: Character = "\u{65}\u{301}"          // e followed by ́
// eAcute is é, combinedEAcute is é

let precomposed: Character = "\u{D55C}"                  // 한
let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"   // ᄒ, ᅡ, ᆫ
// precomposed is 한, decomposed is 한

let enclosedEAcute: Character = "\u{E9}\u{20DD}" // enclose a character in another


// Counting Characters

let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
println("unusualMenagerie has \(countElements(unusualMenagerie)) characters")

var word = "cafe"
println("the number of characters in \(word) is \(countElements(word))")
// prints "the number of characters in cafe is 4"

word += "\u{301}"    // COMBINING ACUTE ACCENT, U+0301

println("the number of characters in \(word) is \(countElements(word))")


// Comparing Strings

let quotation = "We're a lot alike, you and I."
let sameQuotation = "We're a lot alike, you and I."
if quotation == sameQuotation {
  println("These two strings are considered equal")
}

// "Voulez-vous un café?" using LATIN SMALL LETTER E WITH ACUTE
let eAcuteQuestion = "Voulez-vous un caf\u{E9}?"

// "Voulez-vous un café?" using LATIN SMALL LETTER E and COMBINING ACUTE ACCENT
let combinedEAcuteQuestion = "Voulez-vous un caf\u{65}\u{301}?"

if eAcuteQuestion == combinedEAcuteQuestion {
  println("These two strings are considered equal")
}

let latinCapitalLetterA: Character = "\u{41}"
let cyrillicCapitalLetterA: Character = "\u{0410}"

if latinCapitalLetterA != cyrillicCapitalLetterA {
  println("These two characters are not equivalent")
}


// Prefix and Suffix Equality

let romeoAndJuliet = [
  "Act 1 Scene 1: Verona, A public place",
  "Act 1 Scene 2: Capulet's mansion",
  "Act 1 Scene 3: A room in Capulet's mansion",
  "Act 1 Scene 4: A street outside Capulet's mansion",
  "Act 1 Scene 5: The Great Hall in Capulet's mansion",
  "Act 2 Scene 1: Outside Capulet's mansion",
  "Act 2 Scene 2: Capulet's orchard",
  "Act 2 Scene 3: Outside Friar Lawrence's cell",
  "Act 2 Scene 4: A street in Verona",
  "Act 2 Scene 5: Capulet's mansion",
  "Act 2 Scene 6: Friar Lawrence's cell"
]

var act1SceneCount = 0
for scene in romeoAndJuliet {
  if scene.hasPrefix("Act 1 ") {
    ++act1SceneCount
  }
}

println("There are \(act1SceneCount) scenes in Act 1")

var mansionCount = 0
var cellCount = 0
for scene in romeoAndJuliet {
  if scene.hasSuffix("Capulet's mansion") {
    ++mansionCount
  } else if scene.hasSuffix("Friar Lawrence's cell") {
    ++cellCount
  }
}

println("\(mansionCount) mansion scenes; \(cellCount) cell scenes")


// Unicode Representations of Strings

// UTF-8 Representation
let dogString = "Dog‼🐶"
for codeUnit in dogString.utf8 {
  println("\(codeUnit)")
}
print("\n")

// UTF-16 Representation

for codeUnit in dogString.utf16 {
  print("\(codeUnit) ")
}
print("\n")

// Unicode Scalar Representation (21-bit)

for scalar in dogString.unicodeScalars {
  print("\(scalar.value) ")
}
print("\n")

for scalar in dogString.unicodeScalars {
  println("\(scalar) ")
}









