// PROPERTIES

// Stored Properties

struct FixedLengthRange {
  var firstValue: Int
  let length: Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
rangeOfThreeItems.firstValue = 6

let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
//rangeOfFourItems.firstValue = 6 // error!
// * structures being value types. When an instance of a value type is marked as a constant, so are all of its properties


// Lazy Stored Properties

class DataImporter {
  /*
  DataImporter is a class to import data from an external file.
  The class is assumed to take a non-trivial amount of time to initialize.
  */
  var fileName = "data.txt"
  // the DataImporter class would provide data importing functionality here
}

class DataManager {
  lazy var importer = DataImporter()
  var data = [String]()
  // the DataManager class would provide data management functionality here
}

let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")
// the DataImporter instance for the importer property has not yet been created

println(manager.importer.fileName)
// the DataImporter instance for the importer property has now been created


// Stored Properties and Instance Variables
// * no instance variables, unlike objective-c
// * all information about the property—including its name, type, and memory management characteristics—is defined in a single location as part of the type’s definition.


// Computed Properties

struct Point {
  var x = 0.0, y = 0.0
}

struct Size {
  var width = 0.0, height = 0.0
}

struct Rect {
  var origin = Point()
  var size = Size()
  var center: Point {
    get {
      let centerX = origin.x + (size.width / 2)
      let centerY = origin.y + (size.height / 2)
      return Point(x: centerX, y: centerY)
    }
    set(newCenter) {
      origin.x = newCenter.x - (size.width / 2)
      origin.y = newCenter.y - (size.height / 2)
    }
  }
}

var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)


// Shorthand Setter Declaration
// * newValue - default name of setter

struct AlternativeRect {
  var origin = Point()
  var size = Size()
  var center: Point {
    get {
      let centerX = origin.x + (size.width / 2)
      let centerY = origin.y + (size.height / 2)
      return Point(x: centerX, y: centerY)
    }
    set {
      origin.x = newValue.x - (size.width / 2)
      origin.y = newValue.y - (size.height / 2)
    }
  }
}


// Read-Only Computed Properties
// * no setter

struct Cuboid {
  var width = 0.0, height = 0.0, depth = 0.0
  var volume: Double { // get {} may be removed
    return width * height * depth
  }
}
let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
println("The volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")


// Property Observers

class StepCounter {
  var totalSteps: Int = 0 {
    willSet(newTotalSteps) {
      println("About to set totalSteps to \(newTotalSteps)")
    }
    didSet {
      if totalSteps > oldValue {
        println("Added \(totalSteps - oldValue) steps")
      }
    }
  }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 360
stepCounter.totalSteps = 896


// Global and Local Variables
// * same behavior as above
// * global variables are computed lazily


// Type Properties
// * universal property
// * must have a default value (for stored types)
// * value types (ie enum, struct), 'static' keyword
// * referenced types, 'class' keyword
// * for value types, can be applied to stored and computed properties
// * for referenced types, can be applied to computed properties only

struct SomeStructure {
  static var storedTypeProperty = "Some value."
  static var computedTypeProperty: Int {
    // return an Int value here
    return 0 // dummy
  }
}

enum SomeEnumeration {
  static var storedTypeProperty = "Some value."
  static var computedTypeProperty: Int {
    // return an Int value here
    return 0 // dummy
  }
}

class SomeClass {
  class var computedTypeProperty: Int {
    // return an Int value here
    return 42
  }
  class var anotherComputedTypePropert: Int {
    get {
      return 42
    }
    set {
      
    }
  }
}


// Querying and Setting Type Properties

println(SomeClass.computedTypeProperty)
println(SomeStructure.storedTypeProperty)
SomeStructure.storedTypeProperty = "Another value."
println(SomeStructure.storedTypeProperty)

struct AudioChannel {
  static let thresholdLevel = 10
  static var maxInputLevelForAllChannels = 0
  var currentLevel: Int = 0 {
    didSet {
      if currentLevel > AudioChannel.thresholdLevel {
        // cap the new audio level to the threshold level
        currentLevel = AudioChannel.thresholdLevel
      }
      if currentLevel > AudioChannel.maxInputLevelForAllChannels {
        // store this as the new overall maximum input level
        AudioChannel.maxInputLevelForAllChannels = currentLevel
      }
    }
  }
}

var leftChannel = AudioChannel()
var rightChannel = AudioChannel()

leftChannel.currentLevel = 7
println(leftChannel.currentLevel)
println(AudioChannel.maxInputLevelForAllChannels)

rightChannel.currentLevel = 11
println(rightChannel.currentLevel)
println(AudioChannel.maxInputLevelForAllChannels)





