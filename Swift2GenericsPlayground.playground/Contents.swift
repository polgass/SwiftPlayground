//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func swapTwoInts(var a: Int, var b: Int) {
  let temporaryA = a
  a = b
  b = temporaryA
  
  print("a = \(a)")
  print("b = \(b)")
}

swapTwoInts(1, b: 2)



func swapTwoValues<T>(inout first  a: T, inout second b: T) {
  let temporaryA = a
  a = b
  b = temporaryA
}

var x = "t"
var y = "y"
swapTwoValues(first: &x, second: &y)
x
y

struct Stack<E> {
  var items = [E]()
  mutating func push(item: E) {
    items.append(item)
  }
  mutating func pop() {
    items.removeLast()
  }
}

var array = Stack(items: [1,2,3])
array.pop()
array

