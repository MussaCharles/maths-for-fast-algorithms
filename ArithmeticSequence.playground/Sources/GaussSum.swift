import Foundation

// MARK: - Using Gauss Arithmetic Sum

/// Uses Gauss's Approach to sum the numbers
///
/// `Time Complexity` => O(1)
///
/// - Parameters:
///   - a1: he first term of the series
///   - n: Position of the last term `(nth Term)` in a given series.
///   - d: A constant difference between two consecutive terms.
/// - Returns: Total sum from the first to the last term.
public func computeSumOfNaturalNumbersUsingGaussApproach(firstTerm a1: Int, nthTerm n: Int, commonDifference d: Int) -> Int {
   // Sn = n/2 (2A1 + (n - 1)d)
    // ⚠️: A division have to happen after everything else,
    // Notice that I intentionally put n / 2 at the last portion of the computation
    // Putting it at the beginning will give wrong answer due to Swift Numeric's integer propertis.
    let sum =  (2 * a1 + (n - 1) * d) *  n / 2
    return sum
}
