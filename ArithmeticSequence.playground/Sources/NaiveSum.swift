import Foundation


public struct NaiveSum {

    /// Iteratively Computes and return the sum of natural numbers from the given first term to the last term by incrementing a given common difference.
    ///
    /// Time complexity: O(n)
    ///
    /// - Parameters:
    ///   - A1:The first term of the series.
    ///   - n: Position of the last term `(nth Term)` in a given series.
    ///   - d: A constant difference between two consecutive terms.
    /// - Returns: Total sum from the first to the last term.
    public func compute(firstTerm A1: Int, nthTerm n: Int, commonDifference d: Int) -> Int {
        // Space complexity O(n), n = total terms
        var allTerms: [Int] = []

        var currentTerm: Int = A1
        // First creates all terms. Space complexity -> O(n)
        for _ in 1...n {
            allTerms.append(currentTerm)
            currentTerm += d
        }

        // Then compute the sum iteratively. Time complexity O(n), where n = count of all terms.
        var sum:Int = 0
        for term in allTerms {
            sum += term
        }

        return sum
    }

}
