public protocol WhiteboardRepository {
  func all() -> [Whiteboard]
  func find(name: String) -> Whiteboard?
  func find(id: String) -> Whiteboard?
  func save(_: Whiteboard)
}
