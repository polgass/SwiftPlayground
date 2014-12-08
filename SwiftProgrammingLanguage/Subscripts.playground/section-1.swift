// SUBSCRIPTS

// Subscript Syntax

class SomeType {
  subscript(index: Int) -> Int {
    get {
      // return an appropriate subscript value here
      return 0 // dummy
    }
    set(newValue) {
      // perform a suitable setting action here
    }
  }
  // read-only, 'get' can be dropped
  /*
  subscript(index: Int) -> Int {
    // return an appropriate subscript value here
    return 0
  }
*/
}

struct TimesTable {
  let multiplier: Int
  subscript(index: Int) -> Int {
    return multiplier * index
  }
}
let threeTimesTable = TimesTable(multiplier: 3)
println("six times three is \(threeTimesTable[6])")


// Subscript Usage
// * typically used as a shortcut for accessing the member elements in a collection, list, or sequence


// Subscript Options

struct Matrix {
  let rows: Int, columns: Int
  var grid: [Double]
  init(rows: Int, columns: Int) {
    self.rows = rows
    self.columns = columns
    grid = Array(count: rows * columns, repeatedValue: 0.0)
  }
  func indexIsValidForRow(row: Int, column: Int) -> Bool {
    return row >= 0 && row < rows && column >= 0 && column < columns
  }
  subscript(row: Int, column: Int) -> Double {
    get {
      assert(indexIsValidForRow(row, column: column), "Index out of range")
      return grid[(row * columns) + column]
    }
    set {
      assert(indexIsValidForRow(row, column: column), "Index out of range")
      grid[(row * columns) + column] = newValue
    }
  }
}

var matrix = Matrix(rows: 2, columns: 2)
matrix[0, 1] = 1.5
matrix[1, 0] = 3.2

