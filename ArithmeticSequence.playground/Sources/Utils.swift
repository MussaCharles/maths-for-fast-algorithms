import Foundation

/// A helper method to simply print new lines in console. Useful for making our console output readable.
/// - Parameter lineCounts: Number of new lines to be printed.
public func addNewLines(withCount lineCounts: Int) {
    for _ in 1...lineCounts {
        print("\n")
    }
}
