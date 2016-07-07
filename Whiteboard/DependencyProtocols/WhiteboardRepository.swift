public protocol WhiteboardRepository {
    func findByName(name: String) -> Whiteboard?
    func find(id: String) -> Whiteboard?
    func save(_: Whiteboard)
}
