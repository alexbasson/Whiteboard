public protocol Gui {
    func validationFailed(errors: [WhiteboardValidationError])
    func whiteboardCreated(id: String)
}
