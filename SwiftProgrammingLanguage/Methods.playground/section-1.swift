// METHODS

// Instance Methods

class Counter {
  var count = 0
  func increment() {
    count++
  }
  func incrementBy(amount: Int) {
    count += amount
  }
  
  func reset() {
    count = 0
  }
}

let counter = Counter()
counter.increment()
counter.incrementBy(5)


// Local and External Parameter Names for Methods

class AnotherCounter {
  var count: Int = 0
  func incrementBy(amount: Int, numberOfTimes: Int) {
    count += amount * numberOfTimes
  }
}

let newCounter = AnotherCounter()
newCounter.incrementBy(5, numberOfTimes: 3)


// The self Property

struct Point {
  var x = 0.0, y = 0.0
  func isToTheRightOfX(x: Double) -> Bool {
    return self.x > x
  }
}

let somePoint = Point(x: 4.0, y: 5.0)
if somePoint.isToTheRightOfX(1.0) {
  println("This point is to the right of the line where x == 1.0")
}


// Modifying Value Types from Within Instance Methods

struct MutatingPoint {
  var x = 0.0, y = 0.0
  mutating func moveByX(deltaX: Double, y deltaY: Double) {
    x += deltaX
    y += deltaY
  }
}

var someMutatingPoint = MutatingPoint(x: 1.0, y: 1.0)
someMutatingPoint.moveByX(2.0, y: 3.0)
println("The point is now at (\(someMutatingPoint.x), \(someMutatingPoint.y))")

let fixedPoint = Point(x: 3.0, y: 3.0)
//fixedPoint.moveByX(2.0, y: 3.0) // this will report an error 


// Assigning to self Within a Mutating Method
// * this assigns a new instance to self

struct AnotherPoint {
  var x = 0.0, y = 0.0
  mutating func moveByX(deltaX: Double, y deltaY: Double) {
    self = AnotherPoint(x: x + deltaX, y: y + deltaY)
  }
} // this is same as above

var aPoint = AnotherPoint(x: 4, y: 5)
aPoint.moveByX(1, y: 2)

enum TriStateSwitch {
  case Off, Low, High
  mutating func next() {
    switch self {
    case Off:
      self = Low
    case Low:
      self = High
    case High:
      self = Off
    }
  }
}
var ovenLight = TriStateSwitch.Low
ovenLight.next()
ovenLight.next()


// Type Methods

class SomeClass {
  class func someTypeMethod() {
  
  }
}
SomeClass.someTypeMethod()

struct LevelTracker {
  static var highestUnlockedLevel = 1
  static func unlockLevel(level: Int) {
    if level > highestUnlockedLevel { highestUnlockedLevel = level }
  }
  static func levelIsUnlocked(level: Int) -> Bool {
    return level <= highestUnlockedLevel
  }
  var currentLevel = 1
  mutating func advanceToLevel(level: Int) -> Bool {
    if LevelTracker.levelIsUnlocked(level) {
      currentLevel = level
      return true
    } else {
      return false
    }
  }
}

class Player {
  var tracker = LevelTracker()
  let playerName: String
  func completedLevel(level: Int) {
    LevelTracker.unlockLevel(level + 1)
    tracker.advanceToLevel(level + 1)
  }
  init(name: String) {
    playerName = name
  }
}

var player = Player(name: "Argyrios")
player.completedLevel(1)
println("highest unlocked level is now \(LevelTracker.highestUnlockedLevel)")

player = Player(name: "Beto")
if player.tracker.advanceToLevel(6) {
  println("player is now on level 6")
} else {
  println("level 6 has not yet been unlocked")
}
