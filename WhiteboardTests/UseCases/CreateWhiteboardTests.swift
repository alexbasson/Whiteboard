import XCTest

class GuiSpy: Gui {
    var spyValidationErrors: [WhiteboardValidationError] = []
    var spyCreatedWhiteboardId: String?

    func validationFailed(errors: [WhiteboardValidationError]) {
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

        let requiredNameError = WhiteboardValidationError(field: "name", validation: "required")
        XCTAssertEqual(gui.spyValidationErrors, [requiredNameError])
    }

    func testItRequiresNamesBeUnique() {
        createWhiteboard(name: "valid name", gui: gui, repo: repo)
        createWhiteboard(name: "valid name", gui: gui, repo: repo)

        let uniqueNameError = WhiteboardValidationError(field: "name", validation: "unique")
        XCTAssertEqual(gui.spyValidationErrors, [uniqueNameError])
    }

    func testItSendsAnIdForTheCreatedWhiteboardBackToTheGui() {
        createWhiteboard(name: "valid name", gui: gui, repo: repo)

        XCTAssertNotNil(gui.spyCreatedWhiteboardId)
    }
}

class WhiteboardRepositoryTests: XCTestCase {
    var repo: WhiteboardRepository?

    let ny = Whiteboard(name: "NY")
    let sf = Whiteboard(name: "SF")

    override func setUp() {
        if let repo = repo {
            repo.save(ny)
            repo.save(sf)
        }
    }

    func testItFindsByName() {
        if let repo = repo {
            if let foundWhiteboard = repo.findByName(name: ny.name) {
                XCTAssertEqual(foundWhiteboard, ny)
            } else {
                XCTFail()
            }

            if let foundWhiteboard = repo.findByName(name: sf.name) {
                XCTAssertEqual(foundWhiteboard, sf)
            } else {
                XCTFail()
            }
        }
    }

    func testItCreatesUniqueIDsForWhiteboardsWhenSaved() {
        if repo != nil {
            XCTAssertNotNil(ny.id)
            XCTAssertNotNil(sf.id)
            XCTAssertNotEqual(ny.id, sf.id)
        }
    }
}