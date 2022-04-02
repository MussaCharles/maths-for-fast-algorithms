import Foundation
import XCTest

public final class ArithmeticSequenceSpeedMeasurementsTests: XCTestCase {

    func test_A_NaiveSumSpeedForSmallDataSets() {
        measureMetrics(
            [.wallClockTime],
            automaticallyStartMeasuring: false
        ) {
            startMeasuring()
            let _ = computeSumOfNaturalNumbersUsingNaiveApproach(
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
            let _ = computeSumOfNaturalNumbersUsingNaiveApproach(
                firstTerm: 1,
                nthTerm: 100_000,
                commonDifference: 1
            )

            stopMeasuring()
        }
    }

    func test_C_GaussSpeedForSmallDataSets() {
        measureMetrics(
            [.wallClockTime],
            automaticallyStartMeasuring: false
        ) {
            startMeasuring()
            let _ = computeSumOfNaturalNumbersUsingGaussApproach(
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
            let _ = computeSumOfNaturalNumbersUsingGaussApproach(
                firstTerm: 1,
                nthTerm: 100_000,
                commonDifference: 1
            )

            stopMeasuring()
        }
    }


}
