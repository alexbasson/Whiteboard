public func createWhiteboard(name: String, gui: Gui, repo: WhiteboardRepository) {
    if (name == "") {
        gui.validationFailed(errors: [WhiteboardValidationError(field: "name", validation: "required")])
    } else if (repo.findByName(name: name) != nil) {
        gui.validationFailed(errors: [WhiteboardValidationError(field: "name", validation: "unique")])
    } else {
        let whiteboard = Whiteboard(name: name)
        repo.save(whiteboard)
        if let id = whiteboard.id {
            gui.whiteboardCreated(id: id)
        }
    }
}
