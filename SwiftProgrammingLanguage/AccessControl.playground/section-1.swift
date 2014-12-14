// Access Control

// Modules and Source Files
// * module - a framework or application that is built and shipped as a single unit and that can be imported by another module with Swift’s import keyword
// * source file - a single Swift source code file within a module

// Access Levels
// * public - can be used within any source file from their defining module, and also in a source file from another module that imports the defining module (highest access level)
// * internal - can only be used within any source file from their defining module
// * private - restricts the use of an entity to its own defining source file (lowest access level)


// Guiding Principle of Access Levels
// * No entity can be defined in terms of another entity that has a lower (more restrictive) access level.
// * A public variable cannot be defined as having an internal or private type, because the type might not be available everywhere that the public variable is used.
// * A function cannot have a higher access level than its parameter types and return type, because the function could be used in situations where its constituent types are not available to the surrounding code


// Default Access Levels
// * internal


// Access Levels for Single-Target Apps
// * for single-target app, you do not need to specify a custom access level. default is internal
// * you may however mark some parts as private to hide implementation details


// Access Levels for Frameworks
// * when developing a framework, mark the public-facing interface to that framework as public so that it can be viewed and accessed by other modules, such as an app that imports the framework
// * used as API


// Access Control Syntax

public class AnExamplePublicClass {}
internal class AnExampleInternalClass {} // may omit 'internal' prefix
private class AnExamplePrivateClass {}

public var somePublicVariable = 0
internal let someInternalConstant = 0 // may omit 'internal' prefix
private func somePrivateFunction() {}

class AnInternalClass {} // implicitly internal
var AnInternalConstant = 0 // impliciltly internal


// Custom Types

public class SomePublicClass {          // explicitly public class
  public var somePublicProperty = 0    // explicitly public class member
  var someInternalProperty = 0         // implicitly internal class member
  private func somePrivateMethod() {}  // explicitly private class member
}

class SomeInternalClass {               // implicitly internal class
  var someInternalProperty = 0         // implicitly internal class member
  private func somePrivateMethod() {}  // explicitly private class member
}

private class SomePrivateClass {        // explicitly private class
  var somePrivateProperty = 0          // implicitly private class member
  func somePrivateMethod() {}          // implicitly private class member
}


// Tuple Types
// * The access level for a tuple type is the most restrictive access level of all types used in that tuple. For example, if you compose a tuple from two different types, one with internal access and one with private access, the access level for that compound tuple type will be private.


// Function Types
// * access level for a function type is calculated as the most restrictive access level of the function’s parameter types and return type

// will not compile:
/*
func someFunction() -> (SomeInternalClass, SomePrivateClass) {
  // function implementation goes here
}
*/

// this will compile
private func someFunction() -> (SomeInternalClass, SomePrivateClass) {
  // function implementation goes here
  return (SomeInternalClass(), SomePrivateClass())
}

// * in above, it is not valid to mark someFunction() with public or internal because the most restrictive access level of its return type is private


// Enumeration Types
// * individual cases of an enumeration automatically receive the same access level as the enumeration they belong to. 
// * You cannot specify a different access level for individual enumeration cases.

public enum CompassPoint {
  case North // public
  case South // public
  case East // public
  case West // public
}


// Raw Values and Associated Values
// * The types used for any raw values or associated values in an enumeration definition must have an access level at least as high as the enumeration’s access level. You cannot use a private type as the raw-value type of an enumeration with an internal access level, for example.


// Nested Types
// * Nested types defined within a private type have an automatic access level of private. Nested types defined within a public type or an internal type have an automatic access level of internal. If you want a nested type within a public type to be publicly available, you must explicitly declare the nested type as public.


// Subclassing

public class A {
  private func someMethod() {}
}

internal class B: A {
  override internal func someMethod() {}
}

// valid, provided both classes are defined in the same source file:
public class X {
  private func someMethod() {}
}

internal class Y: X {
  override internal func someMethod() {
    super.someMethod()
  }
}


// Constants, Variables, Properties, and Subscripts
// * A constant, variable, or property cannot be more public than its type
// * not valid to write a public property with a private type
// * a subscript cannot be more public than either its index type or return type

// If a constant, variable, property, or subscript makes use of a private type, the constant, variable, property, or subscript must also be marked as private:
private var privateInstance = SomePrivateClass()


// Getters and Setters
// * same access level as the constant, variable, property, or subscript they belong to
// * can give a setter a lower access level than its corresponding getter
// * mark private(set) or internal(set) before the var or subscript introducer
// * applies to stored and computed properties

struct TrackedString {
  private(set) var numberOfEdits = 0 // internal getter, private setter
  var value: String = "" {
    didSet {
      numberOfEdits++
    }
  }
}

var stringToEdit = TrackedString()
stringToEdit.value = "This string will be tracked."
stringToEdit.value += " This edit will increment numberOfEdits."
stringToEdit.value += " So will this one."
println("The number of edits is \(stringToEdit.numberOfEdits)")

public struct AnotherTrackedString {
  public private(set) var numberOfEdits = 0 // public getter, private setter
  public var value: String = "" {
    didSet {
      numberOfEdits++
    }
  }
  public init() {}
}


// Initializers
// * can be assigned an access level less than or equal to the type that they initialize. 
// * a required initializer must have the same access level as the class it belongs to
// * for function and method parameters, the types of an initializer’s parameters cannot be more private than the initializer’s own access level.


// Default Initializers
// * has the same access level as the type it initializes


// Default Memberwise Initializers for Structure Types
// * considered private if any of the structure’s stored properties are private. Otherwise, the initializer has an access level of internal


// Protocols
// * access level of each requirement within a protocol definition is automatically set to the same access level as the protocol


// Protocol Conformance
// * can conform to a protocol with a lower access level than the type itself
// * ensure that the type’s implementation of each protocol requirement has at least the same access level as the type’s conformance to that protocol


// Extensions
// * any type members added in an extension have the same default access level as type members declared in the original type being extended
// * can mark an extension with an explicit access level modifier (for example, private extension) to set a new default access level for all members defined within the extension


// Adding Protocol Conformance with an Extension
// * You cannot provide an explicit access level modifier for an extension if you are using that extension to add protocol conformance. Instead, the protocol’s own access level is used to provide the default access level for each protocol requirement implementation within the extension.


// Generics
// * access level for a generic type or generic function is the minimum of the access level of the generic type or function itself and the access level of any type constraints on its type parameters


// Type Aliases
// * Any type aliases you define are treated as distinct types for the purposes of access control. A type alias can have an access level less than or equal to the access level of the type it aliases. For example, a private type alias can alias a private, internal, or public type, but a public type alias cannot alias an internal or private type.


















