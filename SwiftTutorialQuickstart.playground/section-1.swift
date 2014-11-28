let tutorialTeam = 56
let editorialTeam = 23
var totalTeam = tutorialTeam + editorialTeam

totalTeam += 1

// Floats and Douvles
let priceInferred = 19.99
let priceExplicit: Double = 19.99

// Bools
let onSaleInferred = true
let onSaleExplicit: Bool = false

// Strings
let nameInferred = "Whoopie Cushion"
let nameExplicit: String = "Whoopie Cushion"

// if statements and string interpolation
if  onSaleInferred {
    println("\(nameInferred) on sale for \(priceInferred)")
} else {
    println("\(nameInferred) at regular price: for \(priceInferred)!")
}

// Unnamed Tuples
let tipAndTotalInferred = (4.00, 25.19)
let tipAndTotalExplicit: (Double, Double) = (4.00, 25.19)

tipAndTotalInferred.0
tipAndTotalInferred.1

let (theTipAmt, theTotal) = tipAndTotalInferred
theTipAmt
theTotal

// Named Tuples
let tipAndTotalNamedInferred = (tipAmt: 4.00, total: 25.19)
tipAndTotalNamedInferred.tipAmt
tipAndTotalNamedInferred.total

let tipAndTotalNamedExplicit: (tipAmt: Double, total: Double) = (4.00, 25.19)
tipAndTotalNamedExplicit.tipAmt
tipAndTotalNamedExplicit.total





