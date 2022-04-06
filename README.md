# Maths for fast algorithms
Detailed explanations and implementations of various maths concepts which can help software Engineers write high performance code/algorithms backed with Unit tests.

**Note:** This repo is a work in progress, [contributions](docs/CONTRIBUTING.md) are highly appreciated. 

## Arithmetic Sequence /Arithmetic Progression(AP)

## Theory
Arithmetic Sequence is a sequence of numbers having a common/constant difference.

 For example `1,2,3......n` has a common difference (d) of `1`

By using Gauss's technic for summing an arithmetic sequence all we need to know is the first term (A<sub>1</sub>) and the common difference (d) Or just the first term, n<sup>th</sup> term and the total number of terms (n).

In AP the nth term can be calculated as follows: - 

 `An = A1 + (n-1)d`

Thus using that we can have two ways of computing the sum fo the sequence, also known as Arithmetic Series (S<sub>n</sub>) as follows: - 

`Sn = n/2(A1 + An)`

If we substitute the value of `An` we can also deduce a second formula as follows: - 

  `Sn = n/2[A1 + A1 + (n-1)d]`

Therefore

  `Sn = n/2[2A1 + (n-1)d]`

***Note:** For full derivations of the fomulas above see Suggested Learning Materials [Section.](#suggested-learning-materials)*

## Code Samples & Complexity Analysis

Consider a list of natural numbers below: - 

`1,2,3,4,......................................1,000,000`

Using the naive approach to find the sum of the numbers would be to iterate through all numbers and add them one by one.
Here is an example of swift code for the naive approach.

This approach will given us `O(n)` run time. 

### Naive approach Swift sample code, `O(n)`

```swift
import Foundation

public struct NaiveSum {

    public func compute(firstTerm A1: Int, nthTerm n: Int, commonDifference d: Int) -> Int {
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

}

```

### Gauss's Arithmetic Series sum, `O(1)`

Now let's try using technics for summing an arithmetic sequence to achive `O(1)` time complexity for summing a huge amount of numbers.

A swift implementation for arithmetic sum using Gauss's technic is as follows.
      
```swift
import Foundation

public struct GaussSum {

    public func compute(firstTerm a1: Int, nthTerm n: Int, commonDifference d: Int) -> Int {
       // Sn = n/2 (2A1 + (n - 1)d)
        let sum =  (2 * a1 + (n - 1) * d) *  n / 2
        return sum
    }

}

```

### Unit tests to verify our implementation details

**Note:** Code snippet for this section can be run using Swift Playgrounds.You can find the source code [here.](ArithmeticSequence.playground)


Let's write some unit tests for the above two implementations with different data sets, starting from small amount of data to a very large amount.
We will try to increase the nth term and see if our functions give use expected output. 
  
  ```swift
public final class ArithmeticSequenceImplementationTests: XCTestCase {

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

    // Note: - I prefixed the tests with letters A,B,C... etc.. because Xcode run tests in alphabetic order by default,
    // So prefixing them makes it easy to debug time complexity of each test.

    // MARK: - Naive Tests
    func test_A_NaiveApproachSumTo5GivesCorrectAnswer() {
        // When
        let sumToFithTerm = naiveSum.compute(
            firstTerm: 1,
            nthTerm: 5,
            commonDifference: 2
        )

        // Then
        XCTAssertEqual(sumToFithTerm, 25)
    }

    func test_B_NaiveApproachSumTo100GivesCorrectAnswer() {
        // When
        let sumToOneHundred = naiveSum.compute(
            firstTerm: 1,
            nthTerm: 100,
            commonDifference: 1
        )

        // Then
        XCTAssertEqual(sumToOneHundred, 5050)
    }

    func test_C_NaiveApproachSumTo_50000_GivesCorrectAnswer() {
        // When
        let sumToOneHundred = naiveSum.compute(
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
        let sumToFithTerm = gaussSum.compute(
            firstTerm: 1,
            nthTerm: 5,
            commonDifference: 2
        )
        // Then
        XCTAssertEqual(sumToFithTerm, 25)
    }

    func test_E_GaussAproachSumTo100GivesCorrectAnswer()  {
        // When
        let sum = gaussSum.compute(
            firstTerm: 1,
            nthTerm: 100,
            commonDifference: 1
        )
        // Then
        XCTAssertEqual(sum, 5050)
    }

    func test_F_GaussAproachSumTo_50000_GivesCorrectAnswer() {
        // When
        let sumToOneHundred = gaussSum.compute(
            firstTerm: 10,
            nthTerm: 50_000,
            commonDifference: 15
        )

        // Then
        XCTAssertEqual(sumToOneHundred, 18750125000)
    }

}

  ```
  
  ### Running Implemnentation Tests
  In the sources folder there is a playground file named ArithmeticSequence. All tests are triggered in that file as follows. 
  ```swift
import Foundation
import XCTest
  
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



### Performance Tests
Now let's write tests specifically for measuring performance of individual functions regardless of the IDE background tasks. This will give us more correct results to verify our hypothesis. 

**Note:** Code snippet for this section too can be run using Swift Playgrounds.
You can find the source code [here.](ArithmeticSequence.playground)

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

```

 ### Running Performance measurement Tests
  Similar to implementation tests above tests for this section can also be triggered from the ArithmeticSequence playground included in Sources folder as follows.
  ```swift
  import Foundation
import XCTest
  
let testObserver = TestObserver()
XCTestObservationCenter.shared.addTestObserver(testObserver)
ArithmeticSequenceSpeedMeasurementsTests.defaultTestSuite.run()
  
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

## Other useful formulas related to Arithmetic Progression
- Sum of Natural Numbers (S<sub>n</sub>) => n/2(n+1)
- Sum of Square Series (S<sub>n<sup>2</sup></sub>) =>  n/6(n+1)(2n+1)
- Sum of Cubic Series (S<sub>n<sup>3</sup></sub>) => (n/2(n+1))<sup>2</sup>

## Suggested Learning Materials

If you are new to Arithmetic Progression (AP) or you just need to review the concepts, I recommend the following materials. 
- [Reading - Nth Term of an AP](https://byjus.com/maths/nth-term-of-an-ap/#:~:text=Nth%20term%20of%20an%20AP%2C%20an%20%3D%20a,%2B(n%2D1)d.)
- [Reading - Sum of N Terms of AP And Arithmetic Progression](https://byjus.com/maths/sum-of-n-terms/)
- [Youtube - Arithmetic Sequences and Arithmetic Series - Basic Introduction](https://www.youtube.com/watch?v=XZJdyPkCxuE&t=1016s&ab_channel=TheOrganicChemistryTutor)
- [Wikipedia - Arithmetic progression](https://en.wikipedia.org/wiki/Arithmetic_progression#:~:text=An%20alternate%20form%20results%20from%20re%2Dinserting%20the%20substitution%3A,%3A)

## Contributing
This is a work in progress so, I welcome any contributions which involves usage of maths theorem/formulas to achieve high performance algorithms. 
Please see the [CONTRIBUTING](docs/CONTRIBUTING.md) for how to get involved.
    
