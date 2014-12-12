// Type Casting

// Defining a Class Hierarchy for Type Casting

class MediaItem {
  var name: String
  init(name: String) {
    self.name = name
  }
}

class Movie: MediaItem {
  var director: String
  init(name: String, director: String) {
    self.director = director
    super.init(name: name)
  }
}

class Song: MediaItem {
  var artist: String
  init(name: String, artist: String) {
    self.artist = artist
    super.init(name: name)
  }
}

let library = [
  Movie(name: "Casablanca", director: "Michael Curtiz"),
  Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
  Movie(name: "Citizen Kane", director: "Orson Welles"),
  Song(name: "The One And Only", artist: "Chesney Hawkes"),
  Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
]


// Checking Type
// * 'is' type check operator to check if instance is of a certain subclass type
// * returns true or false

var movieCount = 0
var songCount = 0

for item in library {
  if item is Movie {
    ++movieCount
  } else if item is Song {
    ++songCount
  }
}

println("Media library contains \(movieCount) movies and \(songCount) songs")


// Downcasting
// * 'as' type cast operator to downcast to the subclass type, this will also force unwrap the operation
// * 'as?' if not sure if it will succeed

for item in library {
  if let movie = item as? Movie {
    println("Movie: '\(movie.name)', dir. \(movie.director)")
  } else if let song = item as? Song {
    println("Song: '\(song.name)', by \(song.artist)")
  }
}


// Type Casting for Any and AnyObject
// * AnyObject can represent an instance of any class type
// * Any can represent an instance of any type at all, including function types


// AnyObject

let someObjects: [AnyObject] = [
  Movie(name: "2001: A Space Odyssey", director: "Stanley Kubrick"),
  Movie(name: "Moon", director: "Duncan Jones"),
  Movie(name: "Alien", director: "Ridley Scott")
]

for object in someObjects {
  let movie = object as Movie
  println("Movie: '\(movie.name)', dir. \(movie.director)")
}


// Any

var things = [Any]()

things.append(0)
things.append(0.0)
things.append(42)
things.append(3.14159)
things.append("hello")
things.append((3.0, 5.0))
things.append(Movie(name: "Ghostbusters", director: "Ivan Reitman"))
things.append({ (name: String) -> String in "Hello, \(name)" })

for thing in things {
  switch thing {
  case 0 as Int:
    println("zero as an Int")
  case 0 as Double:
    println("zero as a Double")
  case let someInt as Int:
    println("an integer value of \(someInt)")
  case let someDouble as Double where someDouble > 0:
    println("a positive double value of \(someDouble)")
  case is Double:
    println("some other double value that I don't want to print")
  case let someString as String:
    println("a string value of \"\(someString)\"")
  case let (x, y) as (Double, Double):
    println("an (x, y) point at \(x), \(y)")
  case let movie as Movie:
    println("a movie called '\(movie.name)', dir. \(movie.director)")
  case let stringConverter as String -> String:
    println(stringConverter("Michael"))
  default:
    println("something else")
  }
}














