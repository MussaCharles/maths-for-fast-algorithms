# maths-for-fast-algorithms
Detailed explanations and implementations of various maths concepts which can help software Engineers write high performance code/algorithms backed with Unit Tests.

## Arithmetic Sequence & Geometric Sequence
### Arithmetic Sequence (Arithmetic Progression)
Arithmetic Sequence is a sequence of numbers having a common/constant difference.

 For example
 
`100,200,300......n` has a common difference of 100

By using [technics for summing an arithmetic sequence](https://en.wikipedia.org/wiki/Arithmetic_progression#:~:text=An%20alternate%20form%20results%20from%20re%2Dinserting%20the%20substitution%3A,%3A) **(Sn)** 
all we need to know is the first term **(Ao)** and the common difference **(d)**.

`Sn= n/2[2Ao + (n-1)d]`

for Example: 
Consider a list of natural numbers below: - 

`1,2,3,4,......................................1,000,000`

Using the naive approach to find the sum of the numbers would be to iterate through all numbers and add them one by one.

Here is an example of swift code for the naive approach.

This approach will given us `O(n)` run time. 

Swift sample code for this approach is as follows: 

```swift
/// Iteratively Computes and return the sum of natural numbers from the given first term to the last term by incrementing a given common difference.
///
/// Time complexity: O(n)
///
/// - Parameters:
///   - A1:The first term of the series.
///   - n: Position of the last term `(nth Term)` in a given series.
///   - d: A constant difference between two consecutive terms.
/// - Returns: Total sum from the first to the last term.
public func computeSumOfNaturalNumbersUsingNaiveApproach(firstTerm A1: Int, nthTerm n: Int, commonDifference d: Int) -> Int {
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

```

Now let's try using technics for summing an arithmetic sequence to achive `O(1)` time complexity for summing a huge amount of numbers.

A swift implementation for arithmetic sum using Gauss's technic is as follows.
      
```swift
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
```

Performance Tests
Note: Code snippet for this section can be run using Swift Playgrounds. You can find the source code [here](ArithmeticSequence.playground)

  Enough talking show me some tests already 😖!
  
   Sure, let's test the performance of the above two implementations with varying different data sets. 
  We will try to increase the nth term and compare the run times of each implemantation. 
  
  ```swift
import Foundation
import XCTest


final class ArithmeticSequenceTests: XCTestCase {

    var conditionToSumFromOneToFiveWithDifferenceOfTwo: SumConditions!
    var conditionToSumFromOneTo100WithDifferenceOfOne: SumConditions!
    var conditionToSumFromTenToFiftyThousandWithDifferenceOf15: SumConditions!

    override func setUp() {
        super.setUp()
        conditionToSumFromOneToFiveWithDifferenceOfTwo = SumConditions(
            firstTerm: 1,
            nthTerm: 5,
            commonDifference: 2
        )

        conditionToSumFromOneTo100WithDifferenceOfOne = SumConditions(
            firstTerm: 1,
            nthTerm: 100,
            commonDifference: 1
        )

        conditionToSumFromTenToFiftyThousandWithDifferenceOf15 = SumConditions(
            firstTerm: 10,
            nthTerm: 50_000,
            commonDifference: 15
        )
    }

    override func tearDown() {
        conditionToSumFromOneTo100WithDifferenceOfOne = nil
        conditionToSumFromOneToFiveWithDifferenceOfTwo = nil
        super.tearDown()
    }

    // MARK: - Tests

    // Note: - I prefixed the tests with letters A,B,C... etc.. because Xcode run tests in alphabetic order by default, So prefixing them makes it easy to debug time complexity of each test.

    func test_A_NaiveApproachSumTo5GivesCorrectAnswer() {
        // Given
        let givenSumTo5Condition = conditionToSumFromOneToFiveWithDifferenceOfTwo!

        // When
        let sumToFithTerm = computeSumOfNaturalNumbersUsingNaiveApproach(
            firstTerm: givenSumTo5Condition.firstTerm,
            nthTerm: givenSumTo5Condition.nthTerm,
            commonDifference: givenSumTo5Condition.commonDifference
        )

        // Then
        XCTAssertEqual(sumToFithTerm, 25)
    }

    func test_B_NaiveApproachSumTo100GivesCorrectAnswer() {
        // Given
        let givenSumTo100Conditions = conditionToSumFromOneTo100WithDifferenceOfOne!

        // When
        let sumToOneHundred = computeSumOfNaturalNumbersUsingNaiveApproach(
            firstTerm: givenSumTo100Conditions.firstTerm,
            nthTerm: givenSumTo100Conditions.nthTerm,
            commonDifference: givenSumTo100Conditions.commonDifference
        )

        // Then
        XCTAssertEqual(sumToOneHundred, 5050)
    }


    func test_C_NaiveApproachSumTo_50000_GivesCorrectAnswer() {
        // Given
        let givenSumTo100Conditions = conditionToSumFromTenToFiftyThousandWithDifferenceOf15!

        // When
        let sumToOneHundred = computeSumOfNaturalNumbersUsingNaiveApproach(
            firstTerm: givenSumTo100Conditions.firstTerm,
            nthTerm: givenSumTo100Conditions.nthTerm,
            commonDifference: givenSumTo100Conditions.commonDifference
        )

        // Then
        XCTAssertEqual(sumToOneHundred, 18750125000)
    }




    func test_D_GaussAproachSumTo5GivesCorrectAnswer() {
        // Given
        let givenSumTo5Condition = conditionToSumFromOneToFiveWithDifferenceOfTwo!

        // When
        let sumToFithTerm = computeSumOfNaturalNumbersUsingGaussApproach(
            firstTerm: givenSumTo5Condition.firstTerm,
            nthTerm: givenSumTo5Condition.nthTerm,
            commonDifference: givenSumTo5Condition.commonDifference
        )

        // Then
        XCTAssertEqual(sumToFithTerm, 25)
    }

    func test_E_GaussAproachSumTo100GivesCorrectAnswer()  {
        // Given
        let givenCondition = conditionToSumFromOneTo100WithDifferenceOfOne!
        // When
        let sum = computeSumOfNaturalNumbersUsingGaussApproach(
            firstTerm: givenCondition.firstTerm,
            nthTerm: givenCondition.nthTerm,
            commonDifference: givenCondition.commonDifference
        )

        // Then
        XCTAssertEqual(sum, 5050)
    }

    func test_F_GaussAproachSumTo_50000_GivesCorrectAnswer() {
        // Given
        let givenSumTo100Conditions = conditionToSumFromTenToFiftyThousandWithDifferenceOf15!

        // When
        let sumToOneHundred = computeSumOfNaturalNumbersUsingGaussApproach(
            firstTerm: givenSumTo100Conditions.firstTerm,
            nthTerm: givenSumTo100Conditions.nthTerm,
            commonDifference: givenSumTo100Conditions.commonDifference
        )

        // Then
        XCTAssertEqual(sumToOneHundred, 18750125000)
    }

}



let testObserver = TestObserver()
XCTestObservationCenter.shared.addTestObserver(testObserver)
ArithmeticSequenceTests.defaultTestSuite.run()


// MARK: - Sample Outputs
/*

 Test Suite 'ArithmeticSequenceTests' started at 2022-04-03 01:45:51.791
 Test Case '-[__lldb_expr_23.ArithmeticSequenceTests test_A_NaiveApproachSumTo5GivesCorrectAnswer]' started.
 Test Case '-[__lldb_expr_23.ArithmeticSequenceTests test_A_NaiveApproachSumTo5GivesCorrectAnswer]' passed (0.049 seconds).
 Test Case '-[__lldb_expr_23.ArithmeticSequenceTests test_B_NaiveApproachSumTo100GivesCorrectAnswer]' started.
 Test Case '-[__lldb_expr_23.ArithmeticSequenceTests test_B_NaiveApproachSumTo100GivesCorrectAnswer]' passed (0.016 seconds).
 Test Case '-[__lldb_expr_23.ArithmeticSequenceTests test_C_NaiveApproachSumTo_50000_GivesCorrectAnswer]' started.
 Test Case '-[__lldb_expr_23.ArithmeticSequenceTests test_C_NaiveApproachSumTo_50000_GivesCorrectAnswer]' passed (0.031 seconds).
 Test Case '-[__lldb_expr_23.ArithmeticSequenceTests test_D_GaussAproachSumTo5GivesCorrectAnswer]' started.
 Test Case '-[__lldb_expr_23.ArithmeticSequenceTests test_D_GaussAproachSumTo5GivesCorrectAnswer]' passed (0.001 seconds).
 Test Case '-[__lldb_expr_23.ArithmeticSequenceTests test_E_GaussAproachSumTo100GivesCorrectAnswer]' started.
 Test Case '-[__lldb_expr_23.ArithmeticSequenceTests test_E_GaussAproachSumTo100GivesCorrectAnswer]' passed (0.001 seconds).
 Test Case '-[__lldb_expr_23.ArithmeticSequenceTests test_F_GaussAproachSumTo_50000_GivesCorrectAnswer]' started.
 Test Case '-[__lldb_expr_23.ArithmeticSequenceTests test_F_GaussAproachSumTo_50000_GivesCorrectAnswer]' passed (0.001 seconds).
 Test Suite 'ArithmeticSequenceTests' passed at 2022-04-03 01:45:51.907.
      Executed 6 tests, with 0 failures (0 unexpected) in 0.099 (0.116) seconds


 */
  
  ```
      



### Geometric Sequence
