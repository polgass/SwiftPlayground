//: Playground - noun: a place where people can play

import UIKit

// do-catch blocks
class Drink {
  var quantity: Int
  
  init(quantity: Int) {
    self.quantity = quantity
  }
  
  func isAvailable() -> Bool {
    return Bool(quantity)
  }
}

enum DrinkError: ErrorType {
  case NoBeerRemainingError
}

func drinkWithError() throws {
  let beer = Drink(quantity: 0)
  if beer.isAvailable() {
    print("Let's party")
  } else {
    throw DrinkError.NoBeerRemainingError
  }
}

func tryToDrink() {
  do {
    try drinkWithError()
  } catch {
    print("No drinks! \(error)")
    return
  }
}

tryToDrink()

// improvement in optional binding
// with optional values
func fooGuard(pants: String?, frog: String?) {
  guard let pants = pants, frog = frog else {
    print("no frog pants")
    return
  }
  
  print("i have \(frog) \(pants)") // already unwrapped!
}

fooGuard("pant", frog: "frog")

// non-optional
func nonOptionalGuard(x: Int) {
  guard x > 0 else {
    print("value is zero")
    return
  }
  print("\(x) is greater than zero!")
}

nonOptionalGuard(10)

// protocol extensions
extension CustomStringConvertible {
  var shittyDescription: String {
    return "(self.description.uppercaseString)"
  }
}

let greetings = ["Hello", "Hi", "Yo yo yo"]

print("\(greetings.description)")
print("\(greetings.shittyDescription)")

