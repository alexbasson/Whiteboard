import XCTest

class WhiteboardRepositoryFakeTests: WhiteboardRepositoryTests {
    override func setUp() {
        repo = WhiteboardRepositoryFake()
        super.setUp()
    }
}
