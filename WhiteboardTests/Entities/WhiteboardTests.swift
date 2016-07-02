import XCTest

class WhiteboardTests: XCTestCase {
    func testEquatable() {
        let whiteboard = Whiteboard(name: "a name", id: "123")
        let equalWhiteboard = Whiteboard(name: "a name", id: "123")
        let unequalByNameWhiteboard = Whiteboard(name: "a different name", id: "123")
        let unequalByIdWhiteboard = Whiteboard(name: "a name", id: "456")

        XCTAssertEqual(whiteboard, equalWhiteboard)
        XCTAssertNotEqual(whiteboard, unequalByNameWhiteboard)
        XCTAssertNotEqual(whiteboard, unequalByIdWhiteboard)
    }
}

class WhiteboardValidationErrorTests: XCTestCase {
    func testEquatable() {
        let error = WhiteboardValidationError(field: "field", validation: "validation")
        let equalError = WhiteboardValidationError(field: "field", validation: "validation")
        let unequalByFieldError = WhiteboardValidationError(field: "unequal field", validation: "validation")
        let unequalByValidationError = WhiteboardValidationError(field: "field", validation: "unequal validation")

        XCTAssertEqual(error, equalError)
        XCTAssertNotEqual(error, unequalByFieldError)
        XCTAssertNotEqual(error, unequalByValidationError)
    }
}
