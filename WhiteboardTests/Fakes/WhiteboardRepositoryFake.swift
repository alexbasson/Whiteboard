import Foundation

public class WhiteboardRepositoryFake: WhiteboardRepository {
  private var whiteboards: [Whiteboard]

  public init() {
    self.whiteboards = []
  }

  public func all() -> [Whiteboard] {
    return whiteboards
  }

  public func find(name: String) -> Whiteboard? {
    return whiteboards.filter({ $0.name == name }).first
  }

  public func find(id: String) -> Whiteboard? {
    return whiteboards.filter({ $0.id == id }).first
  }

  public func save(_ whiteboard: Whiteboard) {
    whiteboard.id = NSUUID().uuidString
    whiteboards.append(whiteboard)
  }
}

