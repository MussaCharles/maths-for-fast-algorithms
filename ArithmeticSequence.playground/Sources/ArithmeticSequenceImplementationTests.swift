import Foundation
import XCTest

/// Unit tests to verify that implementations of Gauss and naive approach gives correct results for any data sets.

public final class ArithmeticSequenceImplementationTests: XCTestCase {

    // MARK: - Tests

    // Note: - I prefixed the tests with letters A,B,C... etc.. because Xcode run tests in alphabetic order by default, So prefixing them makes it easy to debug time complexity of each test.

    // MARK: - Naive Tests
    func test_A_NaiveApproachSumTo5GivesCorrectAnswer() {
        // When
        let sumToFithTerm = computeSumOfNaturalNumbersUsingNaiveApproach(
            firstTerm: 1,
            nthTerm: 5,
            commonDifference: 2
        )

        // Then
        XCTAssertEqual(sumToFithTerm, 25)
    }

    func test_B_NaiveApproachSumTo100GivesCorrectAnswer() {
        // When
        let sumToOneHundred = computeSumOfNaturalNumbersUsingNaiveApproach(
            firstTerm: 1,
            nthTerm: 100,
            commonDifference: 1
        )

        // Then
        XCTAssertEqual(sumToOneHundred, 5050)
    }


    func test_C_NaiveApproachSumTo_50000_GivesCorrectAnswer() {
        // When
        let sumToOneHundred = computeSumOfNaturalNumbersUsingNaiveApproach(
            firstTerm: 10,
            nthTerm: 50_000,
            commonDifference: 15
        )
        // Then
        XCTAssertEqual(sumToOneHundred, 18750125000)
    }



    // MARK: - Gauss Tests

    func test_D_GaussAproachSumTo5GivesCorrectAnswer() {
        // When
        let sumToFithTerm = computeSumOfNaturalNumbersUsingGaussApproach(
            firstTerm: 1,
            nthTerm: 5,
            commonDifference: 2
        )
        // Then
        XCTAssertEqual(sumToFithTerm, 25)
    }

    func test_E_GaussAproachSumTo100GivesCorrectAnswer()  {
        // When
        let sum = computeSumOfNaturalNumbersUsingGaussApproach(
            firstTerm: 1,
            nthTerm: 100,
            commonDifference: 1
        )
        // Then
        XCTAssertEqual(sum, 5050)
    }

    func test_F_GaussAproachSumTo_50000_GivesCorrectAnswer() {
        // When
        let sumToOneHundred = computeSumOfNaturalNumbersUsingGaussApproach(
            firstTerm: 10,
            nthTerm: 50_000,
            commonDifference: 15
        )

        // Then
        XCTAssertEqual(sumToOneHundred, 18750125000)
    }

}
