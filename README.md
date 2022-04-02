# maths-for-fast-algorithms
Detailed explanations and implementations of various maths concepts which can help software Engineers write high performance code/algorithms backed with Unit Tests.

Note: This repo is a work in progress, [contributions](docs/CONTRIBUTING.md) are highly appreciated. 

## Arithmetic Sequence (Arithmetic Progression)
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
public func computeSumOfNaturalNumbersUsingNaiveApproach(firstTerm A1: Int, nthTerm n: Int, commonDifference d: Int) -> Int {
    var allTerms: [Int] = []
    var currentTerm: Int = A1
    for _ in 1...n {
        allTerms.append(currentTerm)
        currentTerm += d
    }
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
public func computeSumOfNaturalNumbersUsingGaussApproach(firstTerm a1: Int, nthTerm n: Int, commonDifference d: Int) -> Int {
   // Sn = n/2 (2A1 + (n - 1)d)
    let sum =  (2 * a1 + (n - 1) * d) *  n / 2
    return sum
}
```

Unit tests to verify our implementation details

Note: Code snippet for this section can be run using Swift Playgrounds.

You can find the source code [here](ArithmeticSequence.playground)

Enough talking show me some unit tests already 😖!
  
Sure, let's write some unit tests for the above two implementations with different data sets, starting from small amount of data to a very large amount.
We will try to increase the nth term and see if our functions give use expected output. 
  
  ```swift
import Foundation
import XCTest


final class ArithmeticSequenceImplementationTests: XCTestCase {

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
  
Interpretations of the console output
-  The ouput above is for the implementation details of our algorithms, All tests passed so we can rest assured that our algorithms will give us correct results for any data sets. 
- Note that the time stemps printed on console above, it is not safe to use them as a measure of performance because other tasks are being done by Xcode such as cleaning up the tests before running each test etc.. So  we are going to write better tests just for verifying the performance in the next section.


Now let's write tests specifically for measuring performance of individual functions regardless of the IDE background tasks. This will give us more correct results to verify our hypothesis. 

```swift
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


```

Demistifying Console Outputs
- Naive sum performance results.
  - `test_A_NaiveSumSpeedForSmallDataSets` took 0.266 seconds. 
  - `test_B_NaiveSumSpeedForLargeDataSets` took 0.782 seconds (Almost 3 times the small data sets) ->` O(n)` runtime.
 
- Gauss Arithmetic sum performance results. 
  - `test_C_GaussSpeedForSmallDataSets` took 0.253 seconds.
  - `test_D_GaussSumSpeedForLargeDataSets` Surprisingly  took 0.252 seconds which is the almost exactly similar ( `O(1)` run time) to the method for small data sets above.

      
      
## Contributing
This is a work in progress so, I welcome any contributions which involves usage of maths theorem/formulas to achieve high performance algorithms. 
Please see the [CONTRIBUTING](docs/CONTRIBUTING.md) for how to get involved.
    
