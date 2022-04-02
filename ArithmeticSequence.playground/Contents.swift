import Foundation
import XCTest

final class ArithmeticSequenceTests: XCTestCase {
    // MARK: -  Naive Approach
    func sumNaiveApproach(from firstTerm: Int, to nthTerm: Int, commonDifference: Int) -> Int {
        var sum:Int = 0
        for i in firstTerm...nthTerm {
            sum += i
        }
        return sum
    }
    
    // MARK: - Using Gauss Arithmetic Sum
    func sumGaussApproach(fromFirstTerm a1: Int, toNthTerm n: Int, commonDifference d: Int) -> Int {
        let sum = n / 2 * (2 * a1 + (n - 1) * d)
        return sum
    }
    
    // MARK: - Tests
    
    func testNaiveApproachSum() {
        
    }
    
    
    func testGaussAproachSum() {
        
    }
    
    
    
}
