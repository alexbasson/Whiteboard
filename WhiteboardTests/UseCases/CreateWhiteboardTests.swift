import XCTest

class GuiSpy: Gui {
    var spyValidationErrors: [WhiteboardError] = []
    var spyCreatedWhiteboardId: String?

    func validationFailed(errors: [WhiteboardError]) {
        spyValidationErrors = errors
    }

    func whiteboardCreated(id: String) {
        spyCreatedWhiteboardId = id
    }
}

class CreateWhiteboardTests: XCTestCase {
    var gui: GuiSpy!
    var repo: WhiteboardRepositoryFake!

    override func setUp() {
        gui = GuiSpy()
        repo = WhiteboardRepositoryFake()
    }

    func testItRequiresAName() {
        createWhiteboard(name: "", gui: gui, repo: repo)

        let requiredNameError = WhiteboardError.Validation(field: .Name, validation: .Required)
        XCTAssertEqual(gui.spyValidationErrors, [requiredNameError])
    }

    func testItRequiresNamesBeUnique() {
        createWhiteboard(name: "valid name", gui: gui, repo: repo)
        createWhiteboard(name: "valid name", gui: gui, repo: repo)

        let uniqueNameError = WhiteboardError.Validation(field: .Name, validation: .Unique)
        XCTAssertEqual(gui.spyValidationErrors, [uniqueNameError])
    }

    func testItSendsAnIdForTheCreatedWhiteboardBackToTheGui() {
        createWhiteboard(name: "valid name", gui: gui, repo: repo)

        XCTAssertNotNil(gui.spyCreatedWhiteboardId)
    }
}
