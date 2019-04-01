import XCTest
@testable import Talk_Time

final class Talk_TimeTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Talk_Time().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
