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

class WhiteboardErrorTests: XCTestCase {
    func testValidationEquatable() {
        let error = WhiteboardError.Validation(field: "field", validation: "validation")
        let equalError = WhiteboardError.Validation(field: "field", validation: "validation")
        let unequalByFieldError = WhiteboardError.Validation(field: "unequal field", validation: "validation")
        let unequalByValidationError = WhiteboardError.Validation(field: "field", validation: "unequal validation")

        XCTAssertEqual(error, equalError)
        XCTAssertNotEqual(error, unequalByFieldError)
        XCTAssertNotEqual(error, unequalByValidationError)
    }
}
