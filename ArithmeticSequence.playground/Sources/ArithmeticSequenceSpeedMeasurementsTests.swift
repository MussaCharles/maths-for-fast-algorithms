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


// MARK: - Sample Output
/*

 Test Suite 'ArithmeticSequenceSpeedMeasurementsTests' started at 2022-04-03 03:31:00.706
 Test Case '-[ArithmeticSequence_Sources.ArithmeticSequenceSpeedMeasurementsTests test_A_NaiveSumSpeedForSmallDataSets]' started.
 <unknown>:0: Test Case '-[ArithmeticSequence_Sources.ArithmeticSequenceSpeedMeasurementsTests test_A_NaiveSumSpeedForSmallDataSets]' measured [Time, seconds] average: 0.000, relative standard deviation: 154.337%, values: [0.000144, 0.000015, 0.000013, 0.000012, 0.000012, 0.000012, 0.000012, 0.000012, 0.000012, 0.000012], performanceMetricID:com.apple.XCTPerformanceMetric_WallClockTime, baselineName: "", baselineAverage: , polarity: prefers smaller, maxPercentRegression: 10.000%, maxPercentRelativeStandardDeviation: 10.000%, maxRegression: 0.100, maxStandardDeviation: 0.100
 Test Case '-[ArithmeticSequence_Sources.ArithmeticSequenceSpeedMeasurementsTests test_A_NaiveSumSpeedForSmallDataSets]' passed (0.266 seconds).
 Test Case '-[ArithmeticSequence_Sources.ArithmeticSequenceSpeedMeasurementsTests test_B_NaiveSumSpeedForLargeDataSets]' started.
 <unknown>:0: Test Case '-[ArithmeticSequence_Sources.ArithmeticSequenceSpeedMeasurementsTests test_B_NaiveSumSpeedForLargeDataSets]' measured [Time, seconds] average: 0.053, relative standard deviation: 8.010%, values: [0.054845, 0.053265, 0.063672, 0.053840, 0.054468, 0.052207, 0.048998, 0.048461, 0.049184, 0.050229], performanceMetricID:com.apple.XCTPerformanceMetric_WallClockTime, baselineName: "", baselineAverage: , polarity: prefers smaller, maxPercentRegression: 10.000%, maxPercentRelativeStandardDeviation: 10.000%, maxRegression: 0.100, maxStandardDeviation: 0.100
 Test Case '-[ArithmeticSequence_Sources.ArithmeticSequenceSpeedMeasurementsTests test_B_NaiveSumSpeedForLargeDataSets]' passed (0.782 seconds).
 Test Case '-[ArithmeticSequence_Sources.ArithmeticSequenceSpeedMeasurementsTests test_C_GaussSpeedForSmallDataSets]' started.
 <unknown>:0: Test Case '-[ArithmeticSequence_Sources.ArithmeticSequenceSpeedMeasurementsTests test_C_GaussSpeedForSmallDataSets]' measured [Time, seconds] average: 0.000, relative standard deviation: 42.445%, values: [0.000002, 0.000001, 0.000001, 0.000001, 0.000001, 0.000001, 0.000001, 0.000001, 0.000001, 0.000001], performanceMetricID:com.apple.XCTPerformanceMetric_WallClockTime, baselineName: "", baselineAverage: , polarity: prefers smaller, maxPercentRegression: 10.000%, maxPercentRelativeStandardDeviation: 10.000%, maxRegression: 0.100, maxStandardDeviation: 0.100
 Test Case '-[ArithmeticSequence_Sources.ArithmeticSequenceSpeedMeasurementsTests test_C_GaussSpeedForSmallDataSets]' passed (0.253 seconds).
 Test Case '-[ArithmeticSequence_Sources.ArithmeticSequenceSpeedMeasurementsTests test_D_GaussSumSpeedForLargeDataSets]' started.
 <unknown>:0: Test Case '-[ArithmeticSequence_Sources.ArithmeticSequenceSpeedMeasurementsTests test_D_GaussSumSpeedForLargeDataSets]' measured [Time, seconds] average: 0.000, relative standard deviation: 42.183%, values: [0.000004, 0.000002, 0.000002, 0.000001, 0.000001, 0.000001, 0.000001, 0.000002, 0.000001, 0.000001], performanceMetricID:com.apple.XCTPerformanceMetric_WallClockTime, baselineName: "", baselineAverage: , polarity: prefers smaller, maxPercentRegression: 10.000%, maxPercentRelativeStandardDeviation: 10.000%, maxRegression: 0.100, maxStandardDeviation: 0.100
 Test Case '-[ArithmeticSequence_Sources.ArithmeticSequenceSpeedMeasurementsTests test_D_GaussSumSpeedForLargeDataSets]' passed (0.252 seconds).
 Test Suite 'ArithmeticSequenceSpeedMeasurementsTests' passed at 2022-04-03 03:31:02.273.
      Executed 4 tests, with 0 failures (0 unexpected) in 1.552 (1.567) seconds

 */
