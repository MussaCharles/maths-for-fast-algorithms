import Foundation
import XCTest

/// Unit tests to verify that implementations of Gauss and naive approach gives correct results for any data sets.

public final class ArithmeticSequenceImplementationTests: XCTestCase {

    var conditionToSumFromOneToFiveWithDifferenceOfTwo: SumConditions!
    var conditionToSumFromOneTo100WithDifferenceOfOne: SumConditions!
    var conditionToSumFromTenToFiftyThousandWithDifferenceOf15: SumConditions!

    public override func setUp() {
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

    public override func tearDown() {
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
