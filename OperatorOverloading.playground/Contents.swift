//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


let nines = [Int](count: 5, repeatedValue: 9)
let tens = [10, 11, 12, 13, 14]


func +(left: [Int], right: [Int]) -> [Int] {
  var sum = [Int]()
  for (index, value) in enumerate(left) {
    sum.append(value + right[index])
  }
  
  return sum
}

nines + tens