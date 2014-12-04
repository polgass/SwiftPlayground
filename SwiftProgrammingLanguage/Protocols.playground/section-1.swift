// Protocols

protocol SomeProtocol {
  // protocol definition goes here
}

protocol FirstProtocol {}
protocol AnotherProtocol {}

class SomeSuperClass {}

struct SomeStructure: FirstProtocol, AnotherProtocol {
  // structure definition goes here
}

class SomeClass: SomeSuperClass, FirstProtocol, AnotherProtocol {
  // class definition goes here
}