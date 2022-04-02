import Foundation
import XCTest



let testObserver = TestObserver()
XCTestObservationCenter.shared.addTestObserver(testObserver)

// MARK: - ArithmeticSequenceImplementationTests Execution
addNewLines(withCount: 1)
ArithmeticSequenceImplementationTests.defaultTestSuite.run()

addNewLines(withCount: 2)

// MARK: - ArithmeticSequenceSpeedMeasurementsTests Execution
ArithmeticSequenceSpeedMeasurementsTests.defaultTestSuite.run()
addNewLines(withCount: 1)



// MARK: - Sample Outputs
/*

 Test Suite 'ArithmeticSequenceImplementationTests' started at 2022-04-03 03:45:15.700
 Test Case '-[ArithmeticSequence_Sources.ArithmeticSequenceImplementationTests test_A_NaiveApproachSumTo5GivesCorrectAnswer]' started.
 Test Case '-[ArithmeticSequence_Sources.ArithmeticSequenceImplementationTests test_A_NaiveApproachSumTo5GivesCorrectAnswer]' passed (0.015 seconds).
 Test Case '-[ArithmeticSequence_Sources.ArithmeticSequenceImplementationTests test_B_NaiveApproachSumTo100GivesCorrectAnswer]' started.
 Test Case '-[ArithmeticSequence_Sources.ArithmeticSequenceImplementationTests test_B_NaiveApproachSumTo100GivesCorrectAnswer]' passed (0.014 seconds).
 Test Case '-[ArithmeticSequence_Sources.ArithmeticSequenceImplementationTests test_C_NaiveApproachSumTo_50000_GivesCorrectAnswer]' started.
 Test Case '-[ArithmeticSequence_Sources.ArithmeticSequenceImplementationTests test_C_NaiveApproachSumTo_50000_GivesCorrectAnswer]' passed (0.042 seconds).
 Test Case '-[ArithmeticSequence_Sources.ArithmeticSequenceImplementationTests test_D_GaussAproachSumTo5GivesCorrectAnswer]' started.
 Test Case '-[ArithmeticSequence_Sources.ArithmeticSequenceImplementationTests test_D_GaussAproachSumTo5GivesCorrectAnswer]' passed (0.001 seconds).
 Test Case '-[ArithmeticSequence_Sources.ArithmeticSequenceImplementationTests test_E_GaussAproachSumTo100GivesCorrectAnswer]' started.
 Test Case '-[ArithmeticSequence_Sources.ArithmeticSequenceImplementationTests test_E_GaussAproachSumTo100GivesCorrectAnswer]' passed (0.001 seconds).
 Test Case '-[ArithmeticSequence_Sources.ArithmeticSequenceImplementationTests test_F_GaussAproachSumTo_50000_GivesCorrectAnswer]' started.
 Test Case '-[ArithmeticSequence_Sources.ArithmeticSequenceImplementationTests test_F_GaussAproachSumTo_50000_GivesCorrectAnswer]' passed (0.001 seconds).
 Test Suite 'ArithmeticSequenceImplementationTests' passed at 2022-04-03 03:45:15.785.
      Executed 6 tests, with 0 failures (0 unexpected) in 0.072 (0.086) seconds




 Test Suite 'ArithmeticSequenceSpeedMeasurementsTests' started at 2022-04-03 03:45:15.786
 Test Case '-[ArithmeticSequence_Sources.ArithmeticSequenceSpeedMeasurementsTests test_A_NaiveSumSpeedForSmallDataSets]' started.
 <unknown>:0: Test Case '-[ArithmeticSequence_Sources.ArithmeticSequenceSpeedMeasurementsTests test_A_NaiveSumSpeedForSmallDataSets]' measured [Time, seconds] average: 0.000, relative standard deviation: 29.091%, values: [0.000033, 0.000018, 0.000016, 0.000016, 0.000016, 0.000016, 0.000016, 0.000016, 0.000015, 0.000016], performanceMetricID:com.apple.XCTPerformanceMetric_WallClockTime, baselineName: "", baselineAverage: , polarity: prefers smaller, maxPercentRegression: 10.000%, maxPercentRelativeStandardDeviation: 10.000%, maxRegression: 0.100, maxStandardDeviation: 0.100
 Test Case '-[ArithmeticSequence_Sources.ArithmeticSequenceSpeedMeasurementsTests test_A_NaiveSumSpeedForSmallDataSets]' passed (0.254 seconds).
 Test Case '-[ArithmeticSequence_Sources.ArithmeticSequenceSpeedMeasurementsTests test_B_NaiveSumSpeedForLargeDataSets]' started.
 <unknown>:0: Test Case '-[ArithmeticSequence_Sources.ArithmeticSequenceSpeedMeasurementsTests test_B_NaiveSumSpeedForLargeDataSets]' measured [Time, seconds] average: 0.050, relative standard deviation: 7.325%, values: [0.060051, 0.050511, 0.049859, 0.048082, 0.047221, 0.048863, 0.049820, 0.048061, 0.047177, 0.047231], performanceMetricID:com.apple.XCTPerformanceMetric_WallClockTime, baselineName: "", baselineAverage: , polarity: prefers smaller, maxPercentRegression: 10.000%, maxPercentRelativeStandardDeviation: 10.000%, maxRegression: 0.100, maxStandardDeviation: 0.100
 Test Case '-[ArithmeticSequence_Sources.ArithmeticSequenceSpeedMeasurementsTests test_B_NaiveSumSpeedForLargeDataSets]' passed (0.749 seconds).
 Test Case '-[ArithmeticSequence_Sources.ArithmeticSequenceSpeedMeasurementsTests test_C_GaussSpeedForSmallDataSets]' started.
 <unknown>:0: Test Case '-[ArithmeticSequence_Sources.ArithmeticSequenceSpeedMeasurementsTests test_C_GaussSpeedForSmallDataSets]' measured [Time, seconds] average: 0.000, relative standard deviation: 47.075%, values: [0.000004, 0.000002, 0.000001, 0.000001, 0.000001, 0.000001, 0.000001, 0.000001, 0.000001, 0.000001], performanceMetricID:com.apple.XCTPerformanceMetric_WallClockTime, baselineName: "", baselineAverage: , polarity: prefers smaller, maxPercentRegression: 10.000%, maxPercentRelativeStandardDeviation: 10.000%, maxRegression: 0.100, maxStandardDeviation: 0.100
 Test Case '-[ArithmeticSequence_Sources.ArithmeticSequenceSpeedMeasurementsTests test_C_GaussSpeedForSmallDataSets]' passed (0.253 seconds).
 Test Case '-[ArithmeticSequence_Sources.ArithmeticSequenceSpeedMeasurementsTests test_D_GaussSumSpeedForLargeDataSets]' started.
 <unknown>:0: Test Case '-[ArithmeticSequence_Sources.ArithmeticSequenceSpeedMeasurementsTests test_D_GaussSumSpeedForLargeDataSets]' measured [Time, seconds] average: 0.000, relative standard deviation: 42.705%, values: [0.000003, 0.000002, 0.000002, 0.000001, 0.000001, 0.000001, 0.000001, 0.000001, 0.000001, 0.000001], performanceMetricID:com.apple.XCTPerformanceMetric_WallClockTime, baselineName: "", baselineAverage: , polarity: prefers smaller, maxPercentRegression: 10.000%, maxPercentRelativeStandardDeviation: 10.000%, maxRegression: 0.100, maxStandardDeviation: 0.100
 Test Case '-[ArithmeticSequence_Sources.ArithmeticSequenceSpeedMeasurementsTests test_D_GaussSumSpeedForLargeDataSets]' passed (0.253 seconds).
 Test Suite 'ArithmeticSequenceSpeedMeasurementsTests' passed at 2022-04-03 03:45:17.295.
      Executed 4 tests, with 0 failures (0 unexpected) in 1.509 (1.509) seconds

 */

