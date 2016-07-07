public final class Whiteboard {
    public let name: String
    var id: String?

    public init(name: String) {
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

public enum WhiteboardError: ErrorProtocol {
    case Validation(field: String, validation: String)
    case Update
    case Destroy
}

extension WhiteboardError: Equatable {}

public func ==(lhs: WhiteboardError, rhs: WhiteboardError) -> Bool {
    switch(lhs, rhs) {
    case (let .Validation(field1, validation1), let .Validation(field2, validation2)):
        return field1 == field2 && validation1 == validation2
    case (.Update, .Update):
        return true
    case (.Destroy, .Destroy):
        return true
    default:
        return false
    }
}
