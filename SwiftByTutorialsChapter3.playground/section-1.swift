// Playground - noun: a place where people can play

import UIKit

// REFERENCE TYPES VS. VALUE TYPES
struct MyStruct {
    var foo: Double = 0.0
}

class MyClass {
    var foo: Double = 0.0
}

//var structA = MyStruct()
//var structB = structA
//structB.foo = 1.0
//structA.foo
//structB.foo

//var classA = MyClass()
//var classB = classA
//classB.foo = 1.0
//classA.foo
//classB.foo

// NOTE: 
// 1. With constant objects you can mutate the their properties, but cannot re- assign the constant to a different or new class instance.
// 2. With constant structs you cannot mutate their properties or re-assign to a new value.
// To illustrate, see below:
var classA = MyClass()
let classB = MyClass()
classA.foo = 1.0
classB.foo = 1.0
//classB = classA // error!
//classA = classB // this works
let classC: MyClass = MyClass() // another way of instantiating an object
classC.foo = 0.5

var structA = MyStruct()
let structB = MyStruct()
structA.foo = 1.0
//structB.foo = 1.0 // error!
//structB = structA // error!
var structC: MyStruct = MyStruct(foo: 1.1) // another way of instantiating a struct
structC.foo = 2.0

