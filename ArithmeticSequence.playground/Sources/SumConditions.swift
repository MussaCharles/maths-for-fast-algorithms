import Foundation


/// A class to make it easy to test different implementations of summation techniques.

public struct SumConditions {
    
    // MARK: -  Properties
    public var firstTerm: Int
    public var nthTerm: Int
    public var commonDifference: Int
    
    // MARK: - Life Cycle
    public init(firstTerm: Int, nthTerm: Int, commonDifference: Int) {
        self.firstTerm = firstTerm
        self.nthTerm = nthTerm
        self.commonDifference = commonDifference
    }
}
