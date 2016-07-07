public func createWhiteboard(name: String, gui: Gui, repo: WhiteboardRepository) {
    if (name == "") {
        gui.validationFailed(errors: [WhiteboardError.Validation(field: .Name, validation: .Required)])
    } else if (repo.find(name: name) != nil) {
        gui.validationFailed(errors: [WhiteboardError.Validation(field: .Name, validation: .Unique)])
    } else {
        let whiteboard = Whiteboard(name: name)
        repo.save(whiteboard)
        if let id = whiteboard.id {
            gui.whiteboardCreated(id: id)
        }
    }
}
