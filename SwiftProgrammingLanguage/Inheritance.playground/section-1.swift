// INHERITANCE

// Defining a Base Class
// * Swift classes do not inherit from a universal base class
// * Classes you define without specifying a superclass automatically become base classes for you to build upon

class Vehicle {
  var currentSpeed = 0.0
  var description: String {
    return "traveling at \(currentSpeed) miles per hour"
  }
  func makeNoise() {
    // do nothing - an arbitrary vehicle doesn't necessarily make a noise
  }
}

let someVehicle = Vehicle()
println("Vehicle: \(someVehicle.description)")


// Subclassing

class Bicycle: Vehicle {
  var hasBasket = false
}

let bicycle = Bicycle()
bicycle.hasBasket = true
bicycle.currentSpeed = 15.0
println("Bicycle: \(bicycle.description)")

class Tandem: Bicycle {
  var currentNumberOfPassengers = 0
}

let tandem = Tandem()
tandem.hasBasket = true
tandem.currentSpeed = 2
tandem.currentSpeed = 22.0
println("Tandem: \(tandem.description)")


// Overriding
// * 'override' keyword
// * applies to  instance method, class method, instance property, class property, or subscript


// Accessing Superclass Methods, Properties, and Subscripts
// * 'super' keyword
// * super.someMethod()
// * super.someProperty
// * super[someIndex]


// Overriding Methods

class Train: Vehicle {
  override func makeNoise() {
    println("Choo Choo")
  }
}

let train = Train()
train.makeNoise()


// Overriding Properties

// Overriding Property Getters and Setters

class Car: Vehicle {
  var gear = 1
  override var description: String {
    return super.description + " in gear \(gear)"
  }
}

let car = Car()
car.currentSpeed = 25.0
car.gear = 3
println("Car: \(car.description)")


// Overriding Property Observers
// * cannot add property observers to inherited constant stored properties or inherited read-only computed properties
class AutomaticCar: Car {
  override var currentSpeed: Double {
    didSet {
      gear = Int(currentSpeed / 10.0) + 1
    }
  }
}

let automatic = AutomaticCar()
automatic.currentSpeed = 35.0
println("AutomaticCar: \(automatic.description)")


// Preventing Overrides
// * adding 'final' modifier befor the metho, property or subscript's introducer keyword













