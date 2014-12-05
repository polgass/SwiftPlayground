// CLASSES AND STRUCTURES

class SomeClass {
  // class definition goes here
}

struct SomeStructure {
  // structure definition goes here
}

struct Resolution {
  var width = 0
  var height = 0
}

class VideoMode {
  var resolution = Resolution()
  var interlaced = false
  var frameRate = 0.0
  var name: String?
}

let someResolution = Resolution()
let someVideoMode = VideoMode()

println("The width of someResolution is \(someResolution.width)")

someVideoMode.resolution.width = 1280
println("The width of someVideoMode is now \(someVideoMode.resolution.width)")


// Memberwise Initializers for Structure Types
// * all structures have an automatically-generated memberwise initializer

let vga = Resolution(width: 640, height: 480)
vga.width
vga.height


// Structures and Enumerations Are Value Types
// * a value type is a type whose value is copied when it is assigned to a variable or constant, or when it is passed to a function.

let hd = Resolution(width: 1920, height: 1080)

var cinema = hd
cinema.width = 2048

println("cinema is now \(cinema.width) pixels wide")
println("hd is still \(hd.width) pixels wide") // different from cinema

enum CompassPoint {
  case North, South, East, West
}

var currentDirection = CompassPoint.West
let rememberedDirection = currentDirection
currentDirection = .East

if rememberedDirection == .West {
  println("The remembered direction is still .West")
}


// Classes Are Reference Types
// * not copied, a reference to the same existing instance is used instead

let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0

println("The frameRate property of tenEighty is now \(tenEighty.frameRate)")


// Identity Operators

if tenEighty === alsoTenEighty {
  println("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
}


// Pointers
// * C, C++, or Objective-C refered to addresses in memory
// in swift, similar to a pointer in C but is not a direct pointer to a memory address


// Choosing Between Classes and Structures
// * Guideline to choose structs:
// * the structure’s primary purpose is to encapsulate a few relatively simple data values
// * reasonable to expect that the encapsulated values will be copied rather than referenced when you assign or pass around an instance of that structure
// * properties stored by the structure are themselves value types, which would also be expected to be copied rather than referenced
// * the structure does not need to inherit properties or behavior from another existing type

// Good candidate for structures:
// * the size of a geometric shape, perhaps encapsulating a width property and a height property, both of type Double
// * a way to refer to ranges within a series, perhaps encapsulating a start property and a length property, both of type Int
// * a point in a 3D coordinate system, perhaps encapsulating x, y and z properties, each of type Double

// NOTE: In all other cases, define a class, and create instances of that class to be managed and passed by reference. In practice, this means that most custom data constructs should be classes, not structures.


// Assignment and Copy Behavior for Strings, Arrays, and Dictionaries
// * Swift’s String, Array, and Dictionary types are implemented as structures












