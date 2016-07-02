public protocol WhiteboardRepository {
    func findByName(name: String) -> Whiteboard?
    func save(_: Whiteboard)
}
