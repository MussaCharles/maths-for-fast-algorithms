import Foundation
import XCTest

/// Speed measurement tests to verify the run time of both Gauss and Naive implementations.

public final class ArithmeticSequenceSpeedMeasurementsTests: XCTestCase {

    // MARk: - Properties
    public var naiveSum: NaiveSum!
    public var gaussSum: GaussSum!

    // MARK: - Life Cycle
    public override func setUp() {
        super.setUp()
        naiveSum = NaiveSum()
        gaussSum = GaussSum()
    }

    public override func tearDown() {
        gaussSum = nil
        naiveSum = nil
        super.tearDown()
    }

    // MARK: - Naive Tests

    func test_A_NaiveSumSpeedForSmallDataSets() {
        measureMetrics(
            [.wallClockTime],
            automaticallyStartMeasuring: false
        ) {
            startMeasuring()
            let _ = naiveSum.compute(
                firstTerm: 1,
                nthTerm: 10,
                commonDifference: 1
            )

            stopMeasuring()
        }
    }

    func test_B_NaiveSumSpeedForLargeDataSets() {
        measureMetrics(
            [.wallClockTime],
            automaticallyStartMeasuring: false
        ) {
            startMeasuring()
            let _ = naiveSum.compute (
                firstTerm: 1,
                nthTerm: 100_000,
                commonDifference: 1
            )
            stopMeasuring()
        }
    }

    // MARK: - Gauss Tests

    func test_C_GaussSpeedForSmallDataSets() {
        measureMetrics(
            [.wallClockTime],
            automaticallyStartMeasuring: false
        ) {
            startMeasuring()
            let _ = gaussSum.compute(
                firstTerm: 1,
                nthTerm: 10,
                commonDifference: 1
            )

            stopMeasuring()
        }
    }

    func test_D_GaussSumSpeedForLargeDataSets() {
        measureMetrics(
            [.wallClockTime],
            automaticallyStartMeasuring: false
        ) {
            startMeasuring()
            let _ = gaussSum.compute(
                firstTerm: 1,
                nthTerm: 100_000,
                commonDifference: 1
            )
            stopMeasuring()
        }
    }


}
