// Functional Programming

// old way:
var evens = [Int]()
for i in 1...10 {
  if i % 2 == 0 {
    evens.append(i)
  }
}
println(evens)


// Functional Filtering

func isEven(number: Int) -> Bool {
  return number % 2 == 0
}

evens = Array(1...10).filter(isEven)

evens = Array(1...10).filter({ (number: Int) -> Bool in
  return number % 2 == 0
})

evens = Array(1...10).filter({ (Int) -> Bool in
  return Int % 2 == 0
})

evens = Array(1...10).filter() {
  (number) -> Bool in
  return number % 2 == 0
}

evens = Array(1...10).filter {
  (number) -> Bool in
  return number % 2 == 0
}

evens = Array(1...10).filter { (number) in number % 2 == 0 }

evens = Array(1...10).filter { $0 % 2 == 0 }

func myFilter<T>(source: [T], predicate:(T) -> Bool) -> [T] {
  var result = [T]()
  for i in source {
    if predicate(i) {
      result.append(i)
    }
  }
  return result
}

evens = myFilter(Array(1...10), isEven)

evens = myFilter(Array(1...10)) {
  (number: Int) -> Bool in
  return number % 2 == 0
}

evens = myFilter(Array(1...10)) {
  (number) -> Bool in
  return number % 2 == 0
}

evens = myFilter(Array(1...10)) {
  (Int) -> Bool in
  return Int % 2 == 0
}

evens = myFilter(Array(1...10)) {
  (number) in number % 2 == 0
}

evens = myFilter(Array(1...10)) { $0 % 2 == 0 }
println(evens)


// Reducing

// Manual Reduction
evens = [Int]()
for i in 1...10 {
  if i % 2 == 0 {
    evens.append(i)
  }
}

var evenSum = 0
for i in evens {
  evenSum += i
}

println(evenSum)


// Functional Reduce
// func reduce<U>(initial: U, combine: (U, T) -> U) -> U

evenSum = Array(1...10)
  .filter({
    (number) in
    return number % 2 == 0
  })
  .reduce(0, combine: {
  (total, number) in
  return total + number
})

evenSum = Array(1...10)
  .filter({
    (number) in number % 2 == 0
  })
  .reduce(0, combine: {
    (total, number) in
    return total + number
  })

evenSum = Array(1...10)
  .filter { (number) in number % 2 == 0 }
  .reduce(0, combine: {
    (total, number) in
    return total + number
  })

evenSum = Array(1...10)
  .filter { $0 % 2 == 0 }
  .reduce(0) { (total: Int, number: Int) -> Int in
    return total + number
}

evenSum = Array(1...10)
  .filter { $0 % 2 == 0 }
  .reduce(0) { (total, number) in
    return total + number
}

evenSum = Array(1...10)
  .filter { $0 % 2 == 0 }
  .reduce(0) { (total, number) in total + number }

evenSum = Array(1...10).filter { $0 % 2 == 0 }.reduce(0) { $0 + $1 }

var maxNumber = Array(1...10)
  .reduce(0) { (total, number) in max(total, number) }
println(maxNumber)

var numbers = Array(1...10)
  .reduce("numbers: ") { (output, number) in output + "\(number) " }
println(numbers)

numbers = Array(1...10)
  .reduce("numbers: ") { $0 + "\($1) " }
println(numbers)

extension Array {
  func myReduce<T, U>(seed:U, combiner:(U, T) -> U) -> U {
    var current = seed
    for item in self {
      current = combiner(current, item as T)
    }
    return current
  }
}

// Building an Index

import Foundation

let words = ["Cat", "Chicken", "fish", "Dog", "Mouse", "Guinea Pig", "monkey"]

typealias Entry = (Character, [String])

func buildIndex(words: [String]) -> [Entry] {
  var result = [Entry]()
  
  var letters = [Character]()
  for word in words {
    let firstLetter = Character(word.substringToIndex(advance(word.startIndex, 1)).uppercaseString)
    
    if !contains(letters, firstLetter) {
      letters.append(firstLetter)
    }
  }
  
  for letter in letters {
    var wordsForLetter = [String]()
    for word in words {
      let firstLetter = Character(word.substringToIndex(
        advance(word.startIndex, 1)).uppercaseString)
      
      if firstLetter == letter {
        wordsForLetter.append(word)
      }
    }
    result.append((letter, wordsForLetter))
  }
  return result
}


println(buildIndex(words))










