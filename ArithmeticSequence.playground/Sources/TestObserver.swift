import Foundation
import XCTest

/// A helplful class to tigger an assertion failure whenever any of our unit test fails.
/// This is useful in Swift playgrounds as it might be difficult to find the failed tests by inspecting the console.
public final class TestObserver: NSObject, XCTestObservation {
    public func testCase(_ testCase: XCTestCase,
                  didFailWithDescription description: String,
                  inFile filePath: String?,
                  atLine lineNumber: Int) {
        assertionFailure("⛔️ \(description)", line: UInt(lineNumber))
    }
}

// Credits: - https://www.swiftbysundell.com/articles/writing-unit-tests-in-a-swift-playground/#:~:text=To%20solve%20that%20problem%2C%20we%20can%20create%20a%20test%20observer%20that%20triggers%20an%20assertion%20failure%20in%20case%20of%20a%20test%20failure%3A
