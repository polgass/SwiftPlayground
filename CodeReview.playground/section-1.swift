enum Suit: Int {
  case Clubs = 1, Diamonds, Hearts, Spades
}

var cardSuit1 = Suit.Clubs

// default values
enum Rating: Int {
  case Terrible = 1
  case NotGreat
  case Average
  case Great
  case Epic
  
  init() {
    self = .Average
  }
}

let myRating = Rating()

myRating.rawValue
