import XCTest
@testable import Whiteboard

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

  func testItReturnsAllWhiteboards() {
    if let repo = repo {
      XCTAssertEqual(repo.all(), [ny, sf])
    }
  }

  func testItFindsByName() {
    if let repo = repo {
      if let foundWhiteboard = repo.find(name: ny.name) {
        XCTAssertEqual(foundWhiteboard, ny)
      } else {
        XCTFail()
      }

      if let foundWhiteboard = repo.find(name: sf.name) {
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

  func testItFindsByID() {
    if let repo = repo {
      var foundWhiteboard = repo.find(id: ny.id!)!
      XCTAssertEqual(foundWhiteboard, ny)

      foundWhiteboard = repo.find(id: sf.id!)!
      XCTAssertEqual(foundWhiteboard, sf)
    }
  }
}
