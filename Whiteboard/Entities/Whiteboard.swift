public class Whiteboard {
    let name: String
    var id: String?

    init(name: String) {
        self.name = name
    }

    init(name: String, id: String) {
        self.name = name
        self.id = id
    }
}

extension Whiteboard: Equatable {}

public func ==(lhs: Whiteboard, rhs: Whiteboard) -> Bool {
    return lhs.id == rhs.id && lhs.name == rhs.name
}

public struct WhiteboardValidationError {
    public let field: String
    public let validation: String

    public init(field: String, validation: String) {
        self.field = field
        self.validation = validation
    }
}

extension WhiteboardValidationError: Equatable {}

public func ==(lhs: WhiteboardValidationError, rhs: WhiteboardValidationError) -> Bool {
    return lhs.field == rhs.field && lhs.validation == rhs.validation
}

