// Automatic Reference Counting
// * whenever you assign a class instance to a property, constant, or variable, that property, constant, or variable makes a strong reference to the instance
// * does not allow it to be deallocated for as long as that strong reference remains

// ARC in Action

class SomePerson {
  let name: String
  init(name: String) {
    self.name = name
    println("\(name) is being initialized")
  }
  deinit {
    println("\(name) is being deinitialized")
  }
}

var reference1: SomePerson?
var reference2: SomePerson?
var reference3: SomePerson?

reference1 = SomePerson(name: "John Appleseed") // strong reference from reference1 to the new Person instance

// two more strong references to that instance are established:
reference2 = reference1
reference3 = reference1

// will not deallocate:
reference1 = nil
reference2 = nil

// this will deallocate (final strong reference):
reference3 = nil
// prints "John Appleseed is being deinitialized"


// Strong Reference Cycles Between Class Instances

class AnotherPerson {
  let name: String
  init(name: String) { self.name = name }
  var apartment: AnApartment?
  deinit { println("\(name) is being deinitialized") }
}

class AnApartment {
  let number: Int
  init(number: Int) { self.number = number }
  var tenant: AnotherPerson?
  deinit { println("Apartment #\(number) is being deinitialized") }
}

var john: AnotherPerson?
var number73: AnApartment?

john = AnotherPerson(name: "John Appleseed")
number73 = AnApartment(number: 73)

john!.apartment = number73
number73!.tenant = john

// this will not deallocate:
john = nil
number73 = nil


// Resolving Strong Reference Cycles Between Class Instances
// * weak references and unowned references
// * use a weak reference whenever it is valid for that reference to become nil at some point during its lifetime
// * use an unowned reference when you know that the reference will never be nil once it has been set during initialization

// Weak References
// * optional value
// * 'weak' keyword

class Person {
  let name: String
  init(name: String) { self.name = name }
  var apartment: Apartment?
  deinit { println("\(name) is being deinitialized") }
}

class Apartment {
  let number: Int
  init(number: Int) { self.number = number }
  weak var tenant: Person? // declared as weak
  deinit { println("Apartment #\(number) is being deinitialized") }
}

var paul: Person?
var number99: Apartment?

paul = Person(name: "Paul McCartney")
number99 = Apartment(number: 99)

paul!.apartment = number99
number99!.tenant = paul

paul = nil
// prints "Paul McCartney is being deinitialized"

number99 = nil
// prints "Apartment #99 is being deinitialized"


// Unowned References
// * assumed to always have a value
// * 'unowned' keyword

class Customer {
  let name: String
  var card: CreditCard?
  init(name: String) {
    self.name = name
  }
  deinit { println("\(name) is being deinitialized") }
}

class CreditCard {
  let number: UInt64
  unowned let customer: Customer
  init(number: UInt64, customer: Customer) {
    self.number = number
    self.customer = customer
  }
  deinit { println("Card #\(number) is being deinitialized") }
}

var johnny: Customer?
johnny = Customer(name: "Johnny Appleseed")
johnny!.card = CreditCard(number: 1234_5678_9012_3456, customer: johnny!)

john = nil
// prints "John Appleseed is being deinitialized"
// prints "Card #1234567890123456 is being deinitialized"


// Unowned References and Implicitly Unwrapped Optional Properties
// * both properties should always have a value, and neither property should ever be nil once initialization is complete

class Country {
  let name: String
  let capitalCity: City!
  init(name: String, capitalName: String) {
    self.name = name
    self.capitalCity = City(name: capitalName, country: self)
  }
}

class City {
  let name: String
  unowned let country: Country
  init(name: String, country: Country) {
    self.name = name
    self.country = country
  }
}

var country = Country(name: "Canada", capitalName: "Ottawa")
println("\(country.name)'s capital city is called \(country.capitalCity.name)")


// Strong Reference Cycles for Closures

class AnHTMLElement {
  let name: String
  let text: String?
  
  // this property creates strong reference cycle:
  lazy var asHTML: () -> String = {
    if let text = self.text {
      return "<\(self.name)>\(text)</\(self.name)>"
    } else {
      return "<\(self.name) />"
    }
  }
  
  var testClosureVariable: (String) -> String = {
    (someString: String) -> String in
    return someString
  }
  
  init(name: String, text: String? = nil) {
    self.name = name
    self.text = text
  }
  
  deinit {
    println("\(name) is being deinitialized")
  }
}

var aparagraph: AnHTMLElement? = AnHTMLElement(name: "p", text: "hello, world")
println(aparagraph!.asHTML())
//aparagraph!.testClosureVariable("Hi")


// Resolving Strong Reference Cycles for Closures
// * capture list
// * 'weak' or 'unknown' keyword

// Defining a Capture List

class SomeClass {
  lazy var someClosure: (Int, String) -> String = {
    [unowned self] (index: Int, stringToProcess: String) -> String in
    // closure body goes here
    return ""
  }

  // If a closure does not specify a parameter list or return type:
  lazy var anotherClosure: () -> String = {
    [unowned self] in
    // closure body goes here
    return ""
  }
}


// Weak and Unowned References
// * unowned: when the closure and the instance it captures will always refer to each other, and will always be deallocated at the same time
// * weak: when the captured reference may become nil at some point in the future

class HTMLElement {
  let name: String
  let text: String?
  
  lazy var asHTML: () -> String = {
    [unowned self] in
    if let text = self.text {
      return "<\(self.name)>\(text)</\(self.name)>"
    } else {
      return "<\(self.name) />"
    }
  }
  
  init(name: String, text: String? = nil) {
    self.name = name
    self.text = text
  }
  
  deinit {
    println("\(name) is being deinitialized")
  }
}

var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
println(paragraph!.asHTML())
// prints "<p>hello, world</p>"

paragraph = nil
// prints "p is being deinitialized"
















