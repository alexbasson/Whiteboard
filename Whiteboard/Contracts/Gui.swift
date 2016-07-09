public protocol Gui {
    func validationFailed(errors: [WhiteboardError])
    func whiteboardCreated(id: String)
}
