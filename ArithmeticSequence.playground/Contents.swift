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
