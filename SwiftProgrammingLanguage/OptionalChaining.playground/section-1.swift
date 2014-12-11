// Optional Chaining

// Optional Chaining as an Alternative to Forced Unwrapping
// * placing a question mark (?) after the optional value


class SomePerson {
  var residence: SomeResidence?
}

class SomeResidence {
  var numberOfRooms = 1
}

var john = SomePerson()
//let roomCount = john.residence!.numberOfRooms // runtime error!

if let roomCount = john.residence?.numberOfRooms {
  println("John's residence has \(roomCount) room(s).")
} else {
  println("Unable to retrieve the number of rooms.")
}

john.residence = SomeResidence()

if let roomCount = john.residence?.numberOfRooms {
  println("John's residence has \(roomCount) room(s).")
} else {
  println("Unable to retrieve the number of rooms.")
}


// Defining Model Classes for Optional Chaining

class Person {
  var residence: Residence?
}

class Residence {
  var rooms = [Room]()
  var numberOfRooms: Int {
    return rooms.count
  }
  subscript(i: Int) -> Room {
    get {
      return rooms[i]
    }
    set {
      rooms[i] = newValue
    }
  }
  func printNumberOfRooms() {
    println("The number of rooms is \(numberOfRooms)")
  }
  var address: Address?
}

class Room {
  let name: String
  init(name: String) { self.name = name }
}

class Address {
  var buildingName: String?
  var buildingNumber: String?
  var street: String?
  func buildingIdentifier() -> String? {
    if buildingName != nil {
      return buildingName
    } else if buildingNumber != nil {
      return buildingNumber
    } else {
      return nil
    }
  }
}


// Accessing Properties Through Optional Chaining

let jay = Person()
if let roomCount = jay.residence?.numberOfRooms {
  println("John's residence has \(roomCount) room(s).")
} else {
  println("Unable to retrieve the number of rooms.")
}

// attempt to set a property:
let someAddress = Address()
someAddress.buildingNumber = "29"
someAddress.street = "Acacia Road"
jay.residence?.address = someAddress // fails because residence is nil


// Calling Methods Through Optional Chaining

if jay.residence?.printNumberOfRooms() != nil {
  println("It was possible to print the number of rooms.")
} else {
  println("It was not possible to print the number of rooms.")
}

if (jay.residence?.address = someAddress) != nil {
  println("It was possible to set the address.")
} else {
  println("It was not possible to set the address.")
}


// Accessing Subscripts Through Optional Chaining

if let firstRoomName = jay.residence?[0].name {
  println("The first room name is \(firstRoomName).")
} else {
  println("Unable to retrieve the first room name.")
}

jay.residence?[0] = Room(name: "Bathroom") // fail, residence is nil

let jaysHouse = Residence()
jaysHouse.rooms.append(Room(name: "Living Room"))
jaysHouse.rooms.append(Room(name: "Kitchen"))
jay.residence = jaysHouse

if let firstRoomName = jay.residence?[0].name {
  println("The first room name is \(firstRoomName).")
} else {
  println("Unable to retrieve the first room name.")
}


// Accessing Subscripts of Optional Type

var testScores = ["Dave": [86, 82, 84], "Bev": [79, 94, 81]]
testScores["Dave"]?[0] = 91
testScores["Bev"]?[0]++
testScores["Brian"]?[0] = 72


// Linking Multiple Levels of Chaining

if let jaysStreet = jay.residence?.address?.street {
  println("John's street name is \(jaysStreet).")
} else {
  println("Unable to retrieve the address.")
}

let jaysNewAddress = Address()
jaysNewAddress.buildingName = "The Larches"
jaysNewAddress.street = "Laurel Street"
jay.residence!.address = jaysNewAddress

if let johnsStreet = jay.residence?.address?.street {
  println("John's street name is \(johnsStreet).")
} else {
  println("Unable to retrieve the address.")
}


// Chaining on Methods with Optional Return Values

if let buildingIdentifier = jay.residence?.address?.buildingIdentifier() {
  println("Jay's building identifier is \(buildingIdentifier).")
}

if let beginsWithThe =
  jay.residence?.address?.buildingIdentifier()?.hasPrefix("The") {
    if beginsWithThe {
      println("Jay's building identifier begins with \"The\".")
    } else {
      println("Jay's building identifier does not begin with \"The\".")
    }
}












