// Enumerations

enum CompassPoint {
  case North
  case South
  case East
  case West
}

enum Planet {
  case Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}

var directionToHead = CompassPoint.West
directionToHead = .East

directionToHead = .South
switch directionToHead {
case .North:
  println("Lots of planets have a north")
case .South:
  println("Watch out for penguins")
case .East:
  println("Where the sun rises")
case .West:
  println("Where the skies are blue")
}

let somePlanet = Planet.Earth
switch somePlanet {
case .Earth:
  println("Mostly harmless")
default:
  println("Not a safe place for humans")
}

// enumurations with associated values

enum Barcode {
  case UPCA(Int, Int, Int, Int)
  case QRCode(String)
}

var productBarCode = Barcode.UPCA(8, 85090, 51226, 3)
productBarCode = .QRCode("ABCDEFGHIJKLMNOP")

switch productBarCode {
case .UPCA(let numberSystem, let manufacturer, let product, let check):
  println("UPC-A: \(numberSystem), \(manufacturer), \(product), \(check).")
case .QRCode(let productCode):
  println("QR code: \(productCode).")
}

switch productBarCode {
case let .UPCA(numberSystem, manufacturer, product, check):
  println("UPC-A: \(numberSystem), \(manufacturer), \(product), \(check).")
case let .QRCode(productCode):
  println("QR code: \(productCode).")
}

// raw values

enum ASCIIControlCharacter: Character {
  case Tab = "\t"
  case LineFeed = "\n"
  case CarriageReturn = "\r"
}

enum ThePlanet: Int {
  case Mercury = 1, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}

ThePlanet.Earth.rawValue

let possiblePlanet = ThePlanet(rawValue: 7)

let positionToFind = 9
if let somePlanet = ThePlanet(rawValue: positionToFind) {
  switch somePlanet {
  case .Earth:
    println("Mostly harmless")
  default:
    println("Not a safe place for humans")
  }
} else {
  println("There isn't a planet at position \(positionToFind)")
}
// prints "There isn't a planet at position 9"










